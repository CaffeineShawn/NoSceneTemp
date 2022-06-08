//
//  TTPagerViewController.m
//  NoSceneTemp
//
//  Created by 肖扬 on 2022/6/7.
//

#import "TTPagerViewController.h"
#import "TTPagerContainerView.h"
#import "../TTSliderNavView.h"
#import "Masonry.h"
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
        _childrenArray = @[tableView1, tableView2, tableView3];
        _ttSliderNav = TTSliderNavView.new;
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
    [_ttSliderNav.buttonA setSelected:YES];
    [_ttSliderNav.buttonA addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventTouchUpInside];
    [_ttSliderNav.buttonB addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventTouchUpInside];
    [_ttSliderNav.buttonC addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventTouchUpInside];
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
                .offset((widthMetric - sliderWidth)/2 + (tag-1) * widthMetric);
        }];
        
        [self->_ttSliderNav layoutIfNeeded];
    } completion:^(BOOL finished) {
        self->_ttSliderNav.canInteract = YES;
    }];
    [[_ttSliderNav buttonWithTag:tag]setSelected:YES];
}

- (void)slideAnimationWithTag:(NSInteger)tag {
    if (!_ttSliderNav.canInteract) {
        return;
    }
    self.currentIndex = tag-1;
    [_ttSliderNav.buttonA setSelected:NO];
    [_ttSliderNav.buttonB setSelected:NO];
    [_ttSliderNav.buttonC setSelected:NO];
    [self animateWithTag:tag];
    NSLog(@"button action: %zd", _currentIndex);
    
}

//- (void)slideWithTag:(NSInteger)tag {
//    self.currentIndex = tag-1;
//    [_ttSliderNav.buttonA setSelected:NO];
//    [_ttSliderNav.buttonB setSelected:NO];
//    [_ttSliderNav.buttonC setSelected:NO];
//    UIButton *sender = [_ttSliderNav buttonWithTag:tag];
//    sender.selected = YES;
//    [self->_ttSliderNav.sliderLabel mas_updateConstraints:^(MASConstraintMaker *make) {
//        CGFloat widthMetric = self->_ttSliderNav.bounds.size.width / 3;
//        CGFloat sliderWidth = _ttSliderNav.sliderLabel.frame.size.width;
//        make.left.mas_equalTo(self->_ttSliderNav.container.mas_left).offset((widthMetric - sliderWidth)/2 + (tag-1) * widthMetric);
//    }];
//
//}

- (void)sliderAction:(UIButton *)sender {
    if (self.currentIndex == sender.tag-1) {
        return;
    }
    [self slideAnimationWithTag:sender.tag];
    _ttSliderNav.isButtonClicked = YES;
    [UIView animateWithDuration:0.3 animations:^{
        self->_container.contentOffset = CGPointMake(UIScreen.mainScreen.bounds.size.width*(sender.tag-1), 0);
    } completion:^(BOOL finished) {
        _ttSliderNav.isButtonClicked = NO;
    }];
   
    NSLog(@"%zd", _currentIndex);
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
    NSInteger previousTag = _currentIndex+1;
    [[_ttSliderNav buttonWithTag:previousTag]setSelected:NO];
    NSInteger tag = scrollView.contentOffset.x / UIScreen.mainScreen.bounds.size.width + 1;
    
    [self animateWithTag:tag];
    self.currentIndex = tag-1;
    NSLog(@"%zd", _currentIndex);
    [self slideAnimationWithTag:tag];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
