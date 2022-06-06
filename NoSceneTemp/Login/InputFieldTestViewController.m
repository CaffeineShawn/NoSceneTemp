//
//  InputFieldTestViewController.m
//  NoSceneTemp
//
//  Created by 肖扬 on 2022/6/6.
//

#import "InputFieldTestViewController.h"
#import "TTInputField.h"
#import "Masonry.h"
@interface InputFieldTestViewController ()
@property (nonatomic, strong) UIStackView *stackView;
@end

@implementation InputFieldTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    TTInputField *ttInputField1 = [[TTInputField alloc]initWithLabelText:@"kkp" placeholder:@"rnm"];
    [self.view addSubview:ttInputField1];
    TTInputField *ttInputField2 = [[TTInputField alloc]initWithLabelText:@"kkp" placeholder:@"rnm"];
    [self.view addSubview:ttInputField1];
    TTInputField *ttInputField3 = [[TTInputField alloc]initWithLabelText:@"kkp" placeholder:@"rnm"];
    [self.view addSubview:ttInputField1];
    _stackView = [[UIStackView alloc]initWithArrangedSubviews: @[ttInputField1, ttInputField2, ttInputField3]];
    _stackView.axis = UILayoutConstraintAxisVertical;
    _stackView.spacing = 10;
    self.view.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:_stackView];
    
}

- (void)viewWillLayoutSubviews {
    [_stackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self.view.bounds.size.width);
        make.centerY.mas_equalTo(self.view.mas_centerY);
        make.centerX.mas_equalTo(self.view.mas_centerX);
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
