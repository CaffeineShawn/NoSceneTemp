//
//  LoginViewController.h
//  NoSceneTemp
//
//  Created by 肖扬 on 2022/6/5.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoginViewController : UIViewController
@property (nonatomic, strong) UILabel *accountLabel;
@property (nonatomic, strong) UILabel *emailLabel;
@property (nonatomic, strong) UILabel *passwordLabel;

@property (nonatomic, strong) UITextField *accountField;
@property (nonatomic, strong) UITextField *emailField;
@property (nonatomic, strong) UITextField *passwordField;

@property (nonatomic, strong) UIButton *loginButton;
@property (nonatomic, strong) UIButton *registerButton;
@end

NS_ASSUME_NONNULL_END
