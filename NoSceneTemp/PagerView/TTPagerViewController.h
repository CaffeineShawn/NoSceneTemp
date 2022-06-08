//
//  TTPagerViewController.h
//  NoSceneTemp
//
//  Created by 肖扬 on 2022/6/7.
//

#import "ViewController.h"
@class TTPagerContainerView;
@class TTSegmentedView;
@class TTSliderNavView;
NS_ASSUME_NONNULL_BEGIN

@interface TTPagerViewController : ViewController
@property (nonatomic, strong) TTPagerContainerView *container;
@property (nonatomic, assign) NSInteger currentIndex;
@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) TTSliderNavView *ttSliderNav;
- (BOOL)populateWithChildren:(NSArray <UITableView *> *)children;

@end

NS_ASSUME_NONNULL_END
