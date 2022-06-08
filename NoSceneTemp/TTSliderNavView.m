//
//  TTSliderNavView.m
//  NoSceneTemp
//
//  Created by 肖扬 on 2022/6/8.
//

#import "TTSliderNavView.h"
#import "Masonry.h"


@interface TTSliderNavView ()

@end

@implementation TTSliderNavView
- (instancetype)init
{
    self = [super init];
    if (self) {
        _canInteract = YES;
        _container = UIScrollView.new;
        _buttonA = [UIButton buttonWithType:UIButtonTypeCustom];
        [_buttonA setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        [_buttonA setTitleColor:UIColor.redColor forState:UIControlStateSelected];
        
        [_buttonA setTitle:@"AAA" forState:UIControlStateNormal];
        _buttonA.tag = 1;
        
        _buttonB = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [_buttonB setTitle:@"BBB" forState:UIControlStateNormal];
        _buttonB.tag = 2;
        [_buttonB setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        [_buttonB setTitleColor:UIColor.redColor forState:UIControlStateSelected];
        
        _buttonC = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [_buttonC setTitle:@"CCC" forState:UIControlStateNormal];
        _buttonC.tag = 3;
        [_buttonC setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        [_buttonC setTitleColor:UIColor.redColor forState:UIControlStateSelected];
        _sliderLabel = UILabel.new;
        _sliderLabel.backgroundColor = UIColor.systemBlueColor;
        [self addSubview:_container];
        [_container addSubview:_buttonA];
        [_container addSubview:_buttonB];
        [_container addSubview:_buttonC];
        [_sliderLabel.layer setCornerRadius:2];
        [self.container addSubview:_sliderLabel];
        _container.showsHorizontalScrollIndicator = NO;
        _container.automaticallyAdjustsScrollIndicatorInsets = NO;
    }
    return self;
}

- (UIButton *)buttonWithTag:(NSInteger)tag {
    return (UIButton *)[_container viewWithTag:tag];
}

- (void)setupSubViews {
    [_container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self);
        make.height.mas_equalTo(self);
        make.top.mas_equalTo(self);
        make.left.mas_equalTo(self);
    }];
    [self layoutIfNeeded];
    NSLog(@"%@", _container);
    [_buttonA mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_container);
        make.height.mas_equalTo(_container);
        make.width.mas_equalTo(_container.frame.size.width / 3 );
        make.centerY.mas_equalTo(_container);
    }];
    
    [_buttonB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_container).offset(_container.frame.size.width/3);
        make.height.mas_equalTo(_container);
        make.width.mas_equalTo(_container.frame.size.width / 3 );
        make.centerY.mas_equalTo(_container);
    }];
    
    [_buttonC mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_container).offset(_container.frame.size.width/3*2);
        make.height.mas_equalTo(_container);
        make.width.mas_equalTo(_container.frame.size.width / 3 );
        make.centerY.mas_equalTo(_container);
    }];
    CGFloat paddingLeft = self.frame.size.width / 24;
    [_sliderLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self);
        make.height.mas_equalTo(4);
        make.width.mas_equalTo(self.frame.size.width / 4);
        make.left.mas_equalTo(paddingLeft);
    }];
    
    
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
