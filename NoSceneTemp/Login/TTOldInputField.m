//
//  TTInputField.m
//  NoSceneTemp
//
//  Created by 肖扬 on 2022/6/6.
//

#import "TTOldInputField.h"
#import "Masonry.h"

@interface TTOldInputField ()
@property (nonatomic, strong) UIStackView *horizontalStack;

@end

@implementation TTOldInputField

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)init {
    _label = UILabel.new;
    _textField = UITextField.new;
    self.horizontalStack = [[UIStackView alloc]initWithArrangedSubviews:@[_label, _textField]];
    _horizontalStack.axis = UILayoutConstraintAxisHorizontal;
    _horizontalStack.spacing = 0;
    [self addSubview:_horizontalStack];
    return [super init];
}

- (void)setupLabel {
    _label.textAlignment = NSTextAlignmentCenter;
    _label.font = [UIFont systemFontOfSize:18];
    _label.backgroundColor = UIColor.blueColor;
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(80);
        make.centerY.mas_equalTo(_horizontalStack.mas_centerY);
    }];
}

- (void)setupTextField {
    _textField.textAlignment = NSTextAlignmentLeft;
    _textField.font = [UIFont systemFontOfSize:18];
    [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(80);
        make.centerY.mas_equalTo(_horizontalStack.mas_centerY);
    }];

}

@end
