//
//  TTLoginView.h
//  NoSceneTemp
//
//  Created by 肖扬 on 2022/6/6.
//

#import <UIKit/UIKit.h>
@class TTInputField;

NS_ASSUME_NONNULL_BEGIN

@interface TTLoginAndRegisterView : UIView
@property (nonatomic, strong) UIStackView *containerStack;
@property (nonatomic, strong) TTInputField *usernameInputField;
@property (nonatomic, strong) TTInputField *emailInputField;
@property (nonatomic, strong) TTInputField *passwordInputField;
@property (nonatomic, strong) UIButton *loginButton;
@property (nonatomic, strong) UIButton *registerButton;
@end

NS_ASSUME_NONNULL_END
