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

@property (nonatomic, strong) NSArray <UIButton *> *buttonArray;
@property (nonatomic, strong) UILabel *sliderLabel;
@property (nonatomic, assign) BOOL canInteract;
@property (nonatomic, assign) BOOL isButtonClicked;
- (instancetype)initWithButtonTitles:(NSArray <NSString *> *)buttonTitles;
- (UIButton *)buttonWithTag:(NSInteger)tag;
- (void)setupSubViews;
- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithCoder:(NSCoder *)coder NS_UNAVAILABLE;
- (instancetype)initWithFrame:(CGRect)frame NS_UNAVAILABLE;
@end
NS_ASSUME_NONNULL_END
