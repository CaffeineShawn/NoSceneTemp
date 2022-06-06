//
//  TestViewController.m
//  NoSceneTemp
//
//  Created by 肖扬 on 2022/6/6.
//

#import "TestViewController.h"
#import "TTLoginView.h"
#import "TTOldInputField.h"
#import "TTInputField.h"

#import "Masonry.h"

NSUInteger const kAccountFieldTag = 111;
NSUInteger const kEmailFieldTag = 222;
NSUInteger const kPasswordFieldTag = 333;
NSUInteger const kValidPasswordLength = 30;
NSString * const kUsernameRegex = @"[A-Za-z0-9]+";
NSString * const kEmailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
NSString * const kPasswordRegex = @"(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,}";

@interface TestViewController () <UITextFieldDelegate>
@property (nonatomic, strong) TTLoginView *loginView;

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _loginView = TTLoginView.new;
    [self.view addSubview:_loginView];
    self.view.backgroundColor = UIColor.whiteColor;
    _loginView.usernameInputField.textField.delegate = self;
    _loginView.emailInputField.textField.delegate = self;
    _loginView.passwordInputField.textField.delegate = self;
    _loginView.usernameInputField.tag = kAccountFieldTag;
    _loginView.emailInputField.tag = kEmailFieldTag;
    _loginView.passwordInputField.tag = kPasswordFieldTag;
//    UIAction *loginButtinAction = [UIAction forwardingTargetForSelector:@selector(isInputLegal)];
[_loginView.loginButton addTarget:self action:@selector(isInputLegal) forControlEvents:UIControlEventTouchUpInside];
}
- (void)viewWillLayoutSubviews {

    [_loginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self.view);
        make.center.mas_equalTo(self.view);
        make.height.mas_equalTo(300);
    }];
    
}

#pragma mark - TextField Delegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    switch (textField.tag) {
        case kAccountFieldTag:
            if (textField.text == nil) {
                
            }
            break;
        case kEmailFieldTag:
            if (textField.text == nil) {
                
            }
            break;
        case kPasswordFieldTag:
            if (textField.text == nil) {
                
            }
            break;
    }
    return YES;
}

#pragma mark - 校验表单
- (BOOL)checkUsername:(NSString*)string {
    return [self checkStringForRegex:string regex:kUsernameRegex];
}

- (BOOL)checkEmail:(NSString*)string {
    return [self checkStringForRegex:string regex:kEmailRegex];
}


- (BOOL)checkPassword:(NSString *)string {
    return [self checkStringForRegex:string regex:kPasswordRegex];
    
}

- (BOOL)checkStringForRegex:(NSString *)string regex:(NSString *)regex {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    if (![predicate evaluateWithObject:string]) {
        return NO;
    }
    return YES;
}


- (BOOL)isInputLegal {
    BOOL isUsernameEmpty = [_loginView.usernameInputField.textField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length == 0;
    BOOL isEmailEmpty = _loginView.emailInputField.textField.text.length == 0;
    BOOL isPasswordEmpty = _loginView.passwordInputField.textField.text.length == 0 ;
    BOOL isUsernameValid = [self checkUsername:_loginView.usernameInputField.textField.text];
    BOOL isEmailValid = [self checkEmail:_loginView.emailInputField.textField.text];
    BOOL isPasswordValid = _loginView.passwordInputField.textField.text.length < kValidPasswordLength && [self checkPassword:_loginView.passwordInputField.textField.text];
    
    BOOL isValid = !isUsernameEmpty && !isEmailEmpty && !isPasswordEmpty && isUsernameValid && isEmailValid && isPasswordValid;
    if (isValid) {
        return YES;
    } else {
//        [self resignAllFieldResponders];
        NSString *errorMessage;
        if (isUsernameEmpty) {
            errorMessage = @"输入的账号不能为空";
        } else if (isEmailEmpty) {
            errorMessage = @"输入的邮箱不能为空";
        } else if (isPasswordEmpty) {
            errorMessage = @"输入的密码不能为空";
        } else if (!isUsernameValid) {
            errorMessage = @"输入的账号应仅包含26个英文字母和数字";
        } else if (!isEmailValid) {
            errorMessage = @"输入的邮箱格式无效";
        } else if (!isPasswordValid) {
            errorMessage = @"输入的密码应该包含大小写和数字, 且长度在8到30个字符以内";
        }
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"输入错误" message:errorMessage preferredStyle:UIAlertControllerStyleAlert];
//        __weak typeof(self) weakSelf = self;
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:action];
        [self presentViewController:alertController animated:YES completion:nil];
        return NO;
    }
}

- (void)resignAllFieldRespondersWithNextResponder:(UITextField *)nextResponder {
    if (_loginView.usernameInputField.isFirstResponder) {
        NSLog(@"username, %@", @(_loginView.usernameInputField.resignFirstResponder));
        [_loginView.usernameInputField resignFirstResponder];
    }
    if (_loginView.emailInputField.isFirstResponder) {
        NSLog(@"email, %@", @(_loginView.usernameInputField.resignFirstResponder));
        [_loginView.emailInputField resignFirstResponder];
    }
    if (_loginView.passwordInputField.isFirstResponder) {
        NSLog(@"password, %@", @(_loginView.usernameInputField.resignFirstResponder));
        [_loginView.passwordInputField resignFirstResponder];
    }
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
