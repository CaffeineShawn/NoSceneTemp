//
//  TTPagerViewController.h
//  NoSceneTemp
//
//  Created by 肖扬 on 2022/6/7.
//

#import "ViewController.h"
/// Class forward declaration -- 参见<<Effective Objective-C 2.0>>
@class TTPagerContainerView;
@class TTSliderNavView;
NS_ASSUME_NONNULL_BEGIN

@interface TTPagerViewController : ViewController
@property (nonatomic, strong) UIScrollView *container; /// 下挂视图容器
@property (nonatomic, assign) NSInteger currentIndex; /// 记录当前页面位置
@property (nonatomic, strong) UISearchBar *searchBar; /// self.view下搜索框
@property (nonatomic, strong) TTSliderNavView *ttSliderNav; /// self.view下滑动指示器
- (void)populateWithChildren:(NSArray <UITableView *> *)children;
@end

NS_ASSUME_NONNULL_END
