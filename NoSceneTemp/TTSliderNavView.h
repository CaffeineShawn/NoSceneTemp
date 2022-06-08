//
//  TTSliderNavView.h
//  NoSceneTemp
//
//  Created by 肖扬 on 2022/6/8.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TTSliderNavView : UIView
@property (nonatomic, strong) UIScrollView *container;
@property (nonatomic, strong) UIButton *buttonA;
@property (nonatomic, strong) UIButton *buttonB;
@property (nonatomic, strong) UIButton *buttonC;
@property (nonatomic, strong) UILabel *sliderLabel;
@property (nonatomic, assign) BOOL canInteract;
@property (nonatomic, assign) BOOL isButtonClicked;
- (UIButton *)buttonWithTag:(NSInteger)tag;
- (void)setupSubViews;
@end
NS_ASSUME_NONNULL_END
