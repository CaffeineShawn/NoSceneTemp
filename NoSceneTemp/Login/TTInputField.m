//
//  TTInput.m
//  NoSceneTemp
//
//  Created by 肖扬 on 2022/6/6.
//

#import "TTInputField.h"
#import "Masonry.h"
#import "UIView+Border.h"

@interface TTInputField ()

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIView *bottomMargin;
@end
@implementation TTInputField

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
        _textField = UITextField.new;
        _label = UILabel.new;
        _label.textAlignment = NSTextAlignmentCenter;
        
        
        UIStackView *containerStack = [[UIStackView alloc]initWithArrangedSubviews:@[_label, _textField]];
        _textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _textField.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 20, 25)];
        [_textField.leftView addLeftBorderWithColor:UIColor.blackColor andWidth:0.5];
        _textField.leftViewMode = UITextFieldViewModeAlways;
        _textField.rightView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 20, 25)];
        _textField.rightViewMode = UITextFieldViewModeUnlessEditing;
        [_label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(70);
            make.height.mas_equalTo(50);
        }];
        containerStack.axis = UILayoutConstraintAxisHorizontal;
        containerStack.alignment = UIStackViewAlignmentCenter;
        _containerView = containerStack;
        _containerView.layer.masksToBounds = YES;
        [_containerView.layer setCornerRadius:10];
        [_containerView.layer setBorderWidth:0.5];
        [_containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        }];
        [self addSubview:_containerView];
    }
    return self;
}

- (instancetype)initPasswordInputField {
    self = [super init];
    if (self) {
        _textField = UITextField.new;
        _label = UILabel.new;
        _label.textAlignment = NSTextAlignmentCenter;
        
        UIStackView *containerStack = [[UIStackView alloc]initWithArrangedSubviews:@[_label, _textField]];
        _textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _textField.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 20, 25)];
        [_textField.leftView addLeftBorderWithColor:UIColor.blackColor andWidth:0.5];
        _textField.leftViewMode = UITextFieldViewModeAlways;
        UIImage *image = [UIImage systemImageNamed:@"eye"];
        _textField.rightView = [UIButton systemButtonWithImage:image target:self action: @selector(toggleVisibility)];
//        _textField.rightView.frame = CGRectMake(0, 0, 20, 25);
        [_textField.rightView sizeToFit];
        _textField.rightViewMode = UITextFieldViewModeAlways;
        [_label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(70);
            make.height.mas_equalTo(50);
        }];
        containerStack.axis = UILayoutConstraintAxisHorizontal;
        containerStack.alignment = UIStackViewAlignmentCenter;
        _containerView = containerStack;
        _containerView.layer.masksToBounds = YES;
        [_containerView.layer setCornerRadius:10];
        [_containerView.layer setBorderWidth:0.5];
        [_containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        }];
        [self addSubview:_containerView];
    }
    return self;
}

- (instancetype)initWithLabelText:(NSString *)labelText placeholder:(NSString *)placeholder {
    self = [self init];
    _label.text = labelText;
    _textField.placeholder = placeholder;
    return self;
}

- (instancetype)initPasswordInputFieldWithLabelText:(NSString *)labelText placeholder:(NSString *)placeholder {
    self = [self initPasswordInputField];
    _label.text = labelText;
    _textField.placeholder = placeholder;
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(self);
        make.centerX.mas_equalTo(self);
        make.centerY.mas_equalTo(self);
    }];
}

#pragma mark - Override Responder Methods

- (BOOL)becomeFirstResponder {
    return [_textField becomeFirstResponder];
}

- (BOOL)resignFirstResponder {
    return [_textField resignFirstResponder];
}

- (BOOL)canBecomeFocused {
    return [_textField canBecomeFocused];
}

- (BOOL)canBecomeFirstResponder {
    return [_textField canBecomeFirstResponder];
}

- (BOOL)canResignFirstResponder {
    return [_textField canResignFirstResponder];
}

#pragma mark - Toggle Password Visibility

- (void)toggleVisibility {
    [self.textField setSecureTextEntry:!self.textField.secureTextEntry];
}

@end
