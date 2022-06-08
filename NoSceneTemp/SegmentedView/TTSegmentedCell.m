//
//  TTSegmentedCell.m
//  NoSceneTemp
//
//  Created by 肖扬 on 2022/6/8.
//

#import "TTSegmentedCell.h"
#import "Masonry.h"

@implementation TTSegmentedCell

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
        
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title {
    self = self.init;
    UILabel *label = UILabel.new;
    label.text = title;
    _titleLabel = label;
    [self addSubview:_titleLabel];
    return self;
}

- (void)layoutSubviews {
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).offset(10);
        make.right.mas_equalTo(self).offset(10);
        make.topMargin.mas_equalTo(self).offset(10);
        make.bottomMargin.mas_equalTo(self).offset(10);
    }];
}

@end
