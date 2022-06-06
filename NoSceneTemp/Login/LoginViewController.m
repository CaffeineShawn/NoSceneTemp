//
//  LoginViewController.m
//  NoSceneTemp
//
//  Created by 肖扬 on 2022/6/5.
//

#import "LoginViewController.h"
#import "Masonry.h"
#import "TTOldInputField.h"

@interface LoginViewController ()
@property (nonatomic, strong) UIStackView *accountStack;
@property (nonatomic, strong) UIStackView *emailStack;
@property (nonatomic, strong) UIStackView *passwordStack;
@property (nonatomic, strong) UIStackView *buttonStack;
@property (nonatomic, strong) UIStackView *containerStack;
//@property (nonatomic, strong) TTInputField *ttInputField;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    TTInputField *inputField = TTInputField.new;
//    inputField.label.text = @"test";
//    inputField.backgroundColor = UIColor.redColor;
//    _ttInputField = inputField;
    
    self.view.backgroundColor = UIColor.whiteColor;
    // Do any additional setup after loading the view.
    _accountLabel = UILabel.new;
    _emailLabel = UILabel.new;
    _passwordLabel = UILabel.new;
    
    _accountField = UITextField.new;
    _accountField.backgroundColor = UIColor.redColor;
    _emailField = UITextField.new;
    _emailField.backgroundColor = UIColor.yellowColor;
    _passwordField = UITextField.new;
    _passwordField.backgroundColor = UIColor.blueColor;
    _accountLabel.text = @"账号";
    _emailLabel.text = @"邮箱";
    _passwordLabel.text = @"密码";
    
    _accountLabel.textAlignment = NSTextAlignmentCenter;
    [_accountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(50);
    }];
    
    _emailLabel.textAlignment = NSTextAlignmentCenter;
    [_emailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(50);
    }];
    
    _passwordLabel.textAlignment = NSTextAlignmentCenter;
    [_passwordLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(50);
    }];
    
    _loginButton = [UIButton buttonWithType:UIButtonTypeSystem];
    _loginButton.backgroundColor = UIColor.systemBlueColor;
    _loginButton.tintColor = UIColor.whiteColor;
    [_loginButton.titleLabel setFont:[UIFont systemFontOfSize:18]];
    [_loginButton.layer setCornerRadius:8];
    [_loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(50);
    }];
    
    _registerButton = [UIButton buttonWithType:UIButtonTypeSystem];
    _registerButton.backgroundColor = UIColor.systemMintColor;
    [_registerButton.titleLabel setFont:[UIFont systemFontOfSize:18]];
    [_registerButton.layer setCornerRadius:8];
    [_registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(50);
    }];
    
    [_loginButton sizeToFit];
    [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [_registerButton sizeToFit];
    [_registerButton setTitle:@"注册" forState:UIControlStateNormal];

    _accountStack = [[UIStackView alloc]initWithArrangedSubviews:@[_accountLabel, _accountField]];
    _accountStack.axis = UILayoutConstraintAxisHorizontal;


    _emailStack = [[UIStackView alloc]initWithArrangedSubviews:@[_emailLabel, _emailField]];
    _emailStack.axis = UILayoutConstraintAxisHorizontal;

    _passwordStack = [[UIStackView alloc]initWithArrangedSubviews:@[_passwordLabel, _passwordField]];
    _passwordStack.axis = UILayoutConstraintAxisHorizontal;
    
    _buttonStack = [[UIStackView alloc]initWithArrangedSubviews:@[_loginButton, _registerButton]];
    _buttonStack.axis = UILayoutConstraintAxisVertical;
    _buttonStack.spacing = 20;
    _containerStack = [[UIStackView alloc]initWithArrangedSubviews:@[_accountStack, _emailStack, _passwordStack, _buttonStack]];
    _containerStack.spacing = 20;
    _containerStack.axis = UILayoutConstraintAxisVertical;
    self.view.insetsLayoutMarginsFromSafeArea = YES;
    [self.view addSubview:_containerStack];
}

- (void)viewWillLayoutSubviews {
    [_containerStack setLayoutMarginsRelativeArrangement:YES];
    NSDirectionalEdgeInsets paddings = NSDirectionalEdgeInsetsMake(10, 20, 10, 20);
    _containerStack.directionalLayoutMargins = paddings;
    [_containerStack mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.centerY.mas_equalTo(self.view.mas_centerY);
        make.width.mas_equalTo(self.view.mas_width);
    }];
    
    [_accountStack mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(50);
    }];
    
    [_emailStack mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(50);
    }];
    [_passwordStack mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(50);
    }];
    
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
