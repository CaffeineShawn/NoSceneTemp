//
//  TTLoginView.m
//  NoSceneTemp
//
//  Created by 肖扬 on 2022/6/6.
//

#import "TTLoginView.h"
#import "TTInputField.h"
#import "Masonry.h"

@implementation TTLoginView

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
        _accountInputField = [[TTInputField alloc]initWithLabelText:@"账号" placeholder:@"请输入账号"];
        _emailInputField = [[TTInputField alloc]initWithLabelText:@"邮箱" placeholder:@"请输入邮箱"];
        _emailInputField.textField.keyboardType = UIKeyboardTypeEmailAddress;
        _passwordInputField = [[TTInputField alloc]initWithLabelText:@"密码" placeholder:@"请输入密码"];
        [_passwordInputField.textField  setSecureTextEntry:YES];
        _containerStack = [[UIStackView alloc]initWithArrangedSubviews:@[_accountInputField, _emailInputField, _passwordInputField]];
        _containerStack.axis = UILayoutConstraintAxisVertical;
//        _containerStack.spacing = 10;
        _containerStack.distribution = UIStackViewDistributionEqualSpacing;
        [self initButtons];
        [_containerStack addArrangedSubview:_loginButton];
        [_containerStack addArrangedSubview:_registerButton];
        [self addSubview:_containerStack];
    }
    return self;
}

- (void)initButtons {
    _loginButton = [UIButton buttonWithType:UIButtonTypeSystem];
    _loginButton.backgroundColor = UIColor.systemBlueColor;
    _loginButton.tintColor = UIColor.whiteColor;
    [_loginButton.titleLabel setFont:[UIFont systemFontOfSize:18]];
    [_loginButton setContentEdgeInsets:UIEdgeInsetsMake(12, 0, 12, 0)];
    [_loginButton.layer setCornerRadius:8];
    
    _registerButton = [UIButton buttonWithType:UIButtonTypeSystem];

    [_registerButton.titleLabel setFont:[UIFont systemFontOfSize:18]];
    [_registerButton.layer setCornerRadius:8];
    [_registerButton setContentEdgeInsets:UIEdgeInsetsMake(12, 0, 12, 0)];
    
    [_loginButton sizeToFit];
    [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [_registerButton sizeToFit];
    [_registerButton setTitle:@"注册" forState:UIControlStateNormal];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_containerStack mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self);
        make.center.mas_equalTo(self);
    }];
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(_containerStack.mas_height);
    }];
}
@end
