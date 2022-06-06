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
@interface TestViewController ()
@property (nonatomic, strong) TTLoginView *loginView;
@property (nonatomic, strong) TTOldInputField *inputField;
@property (nonatomic, strong) TTInputField *ttInput;
@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = UIColor.whiteColor;
    _loginView = TTLoginView.new;
//    _inputField = TTInputField.new;
//    _inputField.label.text = @"kkp";
//
    [self.view addSubview:_loginView];
//    [self.view addSubview:_inputField];
    _ttInput = [[TTInputField alloc]initWithLabelText:@"kkp" placeholder:@"kkp"];
//    [self.view addSubview: _ttInput];
    self.view.backgroundColor = UIColor.whiteColor;
    
    // Do any additional setup after loading the view.
}

- (void)viewWillLayoutSubviews {
//    [_loginView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.width.equalTo(self.view.mas_width);
//            make.centerY.mas_equalTo(self.view.mas_centerY);
//    }];
//
//    [_loginView.containerStack addArrangedSubview:_inputField];
//    [_inputField mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.height.mas_equalTo(100);
//        make.leftMargin.mas_equalTo(_loginView.containerStack.mas_left);
//        make.rightMargin.mas_equalTo(_loginView.containerStack.mas_right);
//    }];
//    [_inputField.label mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.mas_equalTo(100);
//    }];
//    _ttInput.backgroundColor = UIColor.redColor;
//    [_ttInput mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.mas_equalTo(self.view.mas_width);
//        make.height.mas_equalTo(80);
//        make.centerY.mas_equalTo(self.view.mas_centerY);
//        make.centerX.mas_equalTo(self.view.mas_centerX);
//    }];
    [_loginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self.view);
        make.centerY.mas_equalTo(self.view.mas_centerY);
        make.centerX.mas_equalTo(self.view.mas_centerX);
    }];
    [_loginView sizeToFit];
    
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
