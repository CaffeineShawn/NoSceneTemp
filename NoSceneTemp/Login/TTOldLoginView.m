//
//  TTLoginView.m
//  NoSceneTemp
//
//  Created by 肖扬 on 2022/6/6.
//

#import "TTOldLoginView.h"
#import "Masonry.h"
@interface TTOldLoginView ()
@property (nonatomic, strong) UIStackView *accountStack;
@property (nonatomic, strong) UIStackView *emailStack;
@property (nonatomic, strong) UIStackView *passwordStack;
@property (nonatomic, strong) UIStackView *buttonStack;
@end

@implementation TTOldLoginView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
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
    [self addSubview:_containerStack];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_containerStack setLayoutMarginsRelativeArrangement:YES];
    NSDirectionalEdgeInsets paddings = NSDirectionalEdgeInsetsMake(10, 20, 10, 20);
    _containerStack.directionalLayoutMargins = paddings;
    [_containerStack mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX);
        make.centerY.mas_equalTo(self.mas_centerY);
        make.width.mas_equalTo(self.mas_width);
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

@end
