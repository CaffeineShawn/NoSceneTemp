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

    [_loginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self.view);
        make.center.mas_equalTo(self.view);
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
