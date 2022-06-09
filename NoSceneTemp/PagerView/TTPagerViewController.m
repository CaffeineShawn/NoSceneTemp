//
//  TTPagerViewController.m
//  NoSceneTemp
//
//  Created by 肖扬 on 2022/6/7.
//

#import "TTPagerViewController.h"
#import "TTPagerContainerView.h"
#import "TTSliderNavView.h"
#import "Masonry.h"
NSInteger const kTagToIndex = 1000;
@interface TTPagerViewController () <UIScrollViewDelegate>
@property (nonatomic, strong) NSArray <UITableView *> *childrenArray;

@end

@implementation TTPagerViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _searchBar = UISearchBar.new;
        UITableView *tableView1 = UITableView.new;
        tableView1.backgroundColor = UIColor.grayColor;
        UITableView *tableView2 = UITableView.new;
        tableView2.backgroundColor = UIColor.blackColor;
        UITableView *tableView3 = UITableView.new;
        tableView3.backgroundColor = UIColor.darkGrayColor;
        UITableView *tableView4 = UITableView.new;
        tableView4.backgroundColor = UIColor.blackColor;
        _childrenArray = @[tableView1, tableView2, tableView3, tableView4];
        _ttSliderNav = [[TTSliderNavView alloc]initWithButtonTitles:@[@"AAA", @"BBB", @"CCC", @"DDD"]];
    }
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpContainer];
    [self.view addSubview:_container];
    [self.view addSubview:_ttSliderNav];
    
    [self populateWithChildren: _childrenArray];
    CGSize contentSize = CGSizeMake(UIScreen.mainScreen.bounds.size.width * _childrenArray.count, 0);
    [_container setContentSize:contentSize];
    
    [self.view addSubview: _searchBar];
    [_searchBar setInsetsLayoutMarginsFromSafeArea:YES];
    [_searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self.view);
        make.height.mas_equalTo(50);
        make.centerX.mas_equalTo(self.view);
        make.top.mas_equalTo(self.view.mas_safeAreaLayoutGuideTop);
    }];
    _searchBar.searchBarStyle = UISearchBarStyleMinimal;
    [_ttSliderNav mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_searchBar.mas_bottom);
        make.width.mas_equalTo(_searchBar.mas_width).offset(-40);
        make.centerX.mas_equalTo(_searchBar);
        make.height.mas_equalTo(_searchBar);
    }];
    [_ttSliderNav.buttonArray.firstObject setSelected:YES];
    [_ttSliderNav.buttonArray enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventTouchUpInside];
    }];
    [_ttSliderNav setupSubViews];
}

- (BOOL)populateWithChildren:(NSArray<UITableView *> *)children {

    __block BOOL containsNilObj = NO;
    [children enumerateObjectsUsingBlock:^(UITableView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj == nil) {
            containsNilObj = YES;
            return;
        }
        CGRect rect = CGRectMake(UIScreen.mainScreen.bounds.size.width*idx, 0, UIScreen.mainScreen.bounds.size.width, self.container.bounds.size.height);
        obj.frame = rect;
        [self.container addSubview:obj];
    }];
    return !containsNilObj;
}

- (void)setUpContainer {
    _container = [[TTPagerContainerView alloc]initWithFrame:self.view.bounds];
    _container.bounces = 0;
    _container.showsVerticalScrollIndicator = NO;
    _container.showsHorizontalScrollIndicator = NO;
    _container.delegate = self;
    [_container setPagingEnabled:YES];
}

- (void)animateWithTag:(NSInteger)tag {
    CGFloat widthMetric = _ttSliderNav.frame.size.width / 3;
    CGFloat sliderWidth = _ttSliderNav.sliderLabel.frame.size.width;
    UILabel *sliderLabel = self->_ttSliderNav.sliderLabel;
    
    UIView *sliderContainer = (UIView *)_ttSliderNav.container;
    _ttSliderNav.canInteract = false;
    [UIView animateWithDuration:0.3 animations:^{
        [sliderLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left
                .mas_equalTo(sliderContainer.mas_left)
                .offset((widthMetric - sliderWidth)/2 + ([self indexFromTag:tag]) * widthMetric);
        }];
        
        [self->_ttSliderNav layoutIfNeeded];
    } completion:^(BOOL finished) {
        self->_ttSliderNav.canInteract = YES;
    }];
    [[_ttSliderNav buttonWithTag:tag]setSelected:YES];
}

- (void)sliderAction:(UIButton *)sender {
    NSInteger nextIndex = [self indexFromTag:sender.tag];
    if (_currentIndex == nextIndex || !_ttSliderNav.canInteract) {
        return;
    }
    [self slideAnimationWithTag:sender.tag];
    _currentIndex = nextIndex;
    _ttSliderNav.isButtonClicked = YES;
    [UIView animateWithDuration:0.3 animations:^{
        self->_container.contentOffset = CGPointMake(UIScreen.mainScreen.bounds.size.width*(nextIndex), 0);
    } completion:^(BOOL finished) {
        self->_ttSliderNav.isButtonClicked = NO;
    }];
}

- (void)slideAnimationWithTag:(NSInteger)tag {
    [_ttSliderNav.buttonArray enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj setSelected:NO];
    }];
    [self animateWithTag:tag];
    NSLog(@"scroll end: %zd", _currentIndex);
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (_ttSliderNav.isButtonClicked) {
        return;
    }
    CGFloat currentOffSetX = _container.contentOffset.x;
    CGFloat sliderOffsetX = currentOffSetX / 3.333 ;
    
    
    [_ttSliderNav.sliderLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_ttSliderNav.container.mas_left).offset(sliderOffsetX + _ttSliderNav.bounds.size.width / 24);
    }];
    [_ttSliderNav.container layoutIfNeeded];
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger previousTag = [self tagFromIndex:_currentIndex];
    [[_ttSliderNav buttonWithTag:previousTag]setSelected:NO];
    NSInteger tag = [self tagFromIndex:scrollView.contentOffset.x / UIScreen.mainScreen.bounds.size.width];
    
    [self animateWithTag:tag];
    NSInteger nextIndex = [self indexFromTag:tag];
    NSLog(@"scroll start: %zd", _currentIndex);
    _currentIndex = nextIndex;
    [self slideAnimationWithTag:tag];
}

#pragma mark - tag index conversion
- (NSInteger)indexFromTag:(NSInteger)tag {
    return tag - kTagToIndex;
}

- (NSInteger)tagFromIndex:(NSInteger)index {
    return index + kTagToIndex;
}

@end
