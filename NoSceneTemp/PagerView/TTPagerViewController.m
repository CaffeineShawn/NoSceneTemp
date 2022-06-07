//
//  TTPagerViewController.m
//  NoSceneTemp
//
//  Created by 肖扬 on 2022/6/7.
//

#import "TTPagerViewController.h"
#import "TTPagerContainerView.h"
#import "Masonry.h"
@interface TTPagerViewController () <UIScrollViewDelegate>
@property (nonatomic, strong) NSArray <UITableView *> *childrenArray;
@end

@implementation TTPagerViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        UITableView *tableView1 = UITableView.new;
        tableView1.backgroundColor = UIColor.redColor;
        UITableView *tableView2 = UITableView.new;
        tableView2.backgroundColor = UIColor.yellowColor;
        UITableView *tableView3 = UITableView.new;
        tableView3.backgroundColor = UIColor.blueColor;
        _childrenArray = @[tableView1, tableView2, tableView3];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpContainer];
    [self.view addSubview:_container];
    [self populateWithChildren: _childrenArray];
    CGSize contentSize = CGSizeMake(UIScreen.mainScreen.bounds.size.width * _childrenArray.count, 0);
    [_container setContentSize:contentSize];
}

- (BOOL)populateWithChildren:(NSArray<UITableView *> *)children {
    __weak typeof(self) weakSelf = self;
    __block BOOL containsNilObj = NO;
    [children enumerateObjectsUsingBlock:^(UITableView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (obj == nil) {
            containsNilObj = YES;
            return;
        }
        CGRect rect = CGRectMake(UIScreen.mainScreen.bounds.size.width*idx, 0, UIScreen.mainScreen.bounds.size.width, strongSelf.container.bounds.size.height);
        obj.frame = rect;
        [strongSelf.container addSubview:obj];
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




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
