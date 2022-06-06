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
    _stackView.alignment = UIStackViewAlignmentFill;
    _stackView.spacing = 10;
    self.view.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:_stackView];
    
}

- (void)viewWillLayoutSubviews {
    [_stackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view);
    }];
    NSLog(@"controller.view %@", @(self.view.frame.size.width));
}


@end
