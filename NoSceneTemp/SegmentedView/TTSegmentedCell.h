//
//  TTSegmentedCell.h
//  NoSceneTemp
//
//  Created by 肖扬 on 2022/6/8.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TTSegmentedCell : UIView
@property (nonatomic, strong) UILabel *titleLabel;
- (instancetype)initWithTitle:(NSString *)title;
@end
NS_ASSUME_NONNULL_END
