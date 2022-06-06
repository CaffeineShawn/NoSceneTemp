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
        _passwordInputField = [[TTInputField alloc]initWithLabelText:@"密码" placeholder:@"请输入密码"];
        _containerStack = [[UIStackView alloc]initWithArrangedSubviews:@[_accountInputField, _emailInputField, _passwordInputField]];
        _containerStack.axis = UILayoutConstraintAxisVertical;
        _containerStack.spacing = 10;
        [self addSubview:_containerStack];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
//    [self mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.height.mas_equalTo(170);
//    }];
    [_containerStack mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(self.bounds.size);
    }];
}
@end
