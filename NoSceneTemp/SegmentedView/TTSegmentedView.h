//
//  TTSegmentedView.h
//  NoSceneTemp
//
//  Created by 肖扬 on 2022/6/8.
//

#import <UIKit/UIKit.h>
@class TTSegmentedCell;
NS_ASSUME_NONNULL_BEGIN

@interface TTSegmentedView : UIView
@property (nonatomic, strong) UIScrollView *containerView;
@property (nonatomic, strong) NSArray <TTSegmentedCell *> *childrenArray;
- (void)populateWithChildren: (NSArray <TTSegmentedCell *> *)childrenArray;
@end

NS_ASSUME_NONNULL_END
