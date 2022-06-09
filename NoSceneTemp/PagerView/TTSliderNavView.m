//
//  TTSliderNavView.m
//  NoSceneTemp
//
//  Created by 肖扬 on 2022/6/8.
//

#import "TTSliderNavView.h"
#import "Masonry.h"


@interface TTSliderNavView ()
@property (nonatomic, strong) UIButton *buttonA;
@property (nonatomic, strong) UIButton *buttonB;
@property (nonatomic, strong) UIButton *buttonC;
@property (nonatomic, strong) UIButton *buttonD;
@end

@implementation TTSliderNavView
- (instancetype)initWithButtonTitles:(NSArray <NSString *> *)buttonTitles {
    self = [super init];
    if (self) {
        _canInteract = YES;
        _container = UIScrollView.new;
        [self addSubview:_container];
        [self initButtonsWithTitles:buttonTitles];
        [self initSliderLabel];
        _container.showsHorizontalScrollIndicator = NO;
        _container.automaticallyAdjustsScrollIndicatorInsets = NO;
    }
    return self;
}


- (void)initHardcodedButtons {
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
    
    _buttonD = [UIButton buttonWithType:UIButtonTypeCustom];
    [_buttonD setTitle:@"DDD" forState:UIControlStateNormal];
    _buttonD.tag = 4;
    [_buttonD setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    [_buttonD setTitleColor:UIColor.redColor forState:UIControlStateSelected];
    [_container addSubview:_buttonA];
    [_container addSubview:_buttonB];
    [_container addSubview:_buttonC];
    [_container addSubview:_buttonD];
}

- (void)initSliderLabel {
    _sliderLabel = UILabel.new;
    _sliderLabel.backgroundColor = UIColor.systemRedColor;
    [_sliderLabel.layer setCornerRadius:2];
    [_sliderLabel setClipsToBounds:YES];
    [self.container addSubview:_sliderLabel];
}



- (instancetype)initWithHardcordedButtons {
    self = [super init];
    if (self) {
        _canInteract = YES;
        _container = UIScrollView.new;
        [self addSubview:_container];
        [self initHardcodedButtons];
        [self initSliderLabel];
        _container.showsHorizontalScrollIndicator = NO;
        _container.automaticallyAdjustsScrollIndicatorInsets = NO;
    }
    return self;
}

- (void)initButtonsWithTitles:(NSArray <NSString *> *)buttonTitles {
    NSMutableArray <UIButton *> *tmpButtonArray = @[].mutableCopy;
    [buttonTitles enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *button = UIButton.new;
        
        
        button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:obj forState:UIControlStateNormal];
        [button setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        [button setTitleColor:UIColor.redColor forState:UIControlStateSelected];
        [tmpButtonArray addObject:button];
        [_container addSubview:button];
        [button setTag:idx + 1000];
        NSLog(@"button tag: %zd", button.tag);
    }];
    _buttonArray = [tmpButtonArray copy];
    
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
//    [_buttonA mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(_container);
//        make.height.mas_equalTo(_container);
//        make.width.mas_equalTo(_container.frame.size.width / 3 );
//        make.centerY.mas_equalTo(_container);
//    }];
//
//    [_buttonB mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(_container).offset(_container.frame.size.width/3);
//        make.height.mas_equalTo(_container);
//        make.width.mas_equalTo(_container.frame.size.width / 3 );
//        make.centerY.mas_equalTo(_container);
//    }];
//
//    [_buttonC mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(_container).offset(_container.frame.size.width/3*2);
//        make.height.mas_equalTo(_container);
//        make.width.mas_equalTo(_container.frame.size.width / 3 );
//        make.centerY.mas_equalTo(_container);
//    }];
//
//    [_buttonD mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(_container).offset(_container.frame.size.width/3*3);
//        make.height.mas_equalTo(_container);
//        make.width.mas_equalTo(_container.frame.size.width / 3 );
//        make.centerY.mas_equalTo(_container);
//    }];
    CGFloat widthMetric = _container.frame.size.width / 3;
    [_buttonArray enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.mas_equalTo(_container).offset(widthMetric * idx);
                    make.height.mas_equalTo(_container);
                    make.width.mas_equalTo(widthMetric);
                    make.centerY.mas_equalTo(_container);
        }];
    }];
    CGFloat paddingLeft = self.frame.size.width / 24;
    [_sliderLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self);
        make.height.mas_equalTo(4);
        make.width.mas_equalTo(self.frame.size.width / 4);
        make.left.mas_equalTo(paddingLeft);
    }];
    _container.contentSize = CGSizeMake(4 * self.frame.size.width / 3, 0);
    
    
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
