//
//  TTSegmentedView.m
//  NoSceneTemp
//
//  Created by 肖扬 on 2022/6/8.
//

#import "TTSegmentedView.h"
#import "Masonry.h"
@implementation TTSegmentedView

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
        _containerView = UIScrollView.new;
    }
    return self;
}

- (void)layoutSubviews {
    UIView *container = (UIView *)_containerView;
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(50);
        make.width.mas_equalTo(200);
    }];
}

- (void)populateWithChildren:(NSArray<TTSegmentedCell *> *)childrenArray {
    _childrenArray = childrenArray;
    
    [childrenArray enumerateObjectsUsingBlock:^(TTSegmentedCell * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIView *childView = (UIView *)obj;
        
        if (idx >= 1) {
            [childView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(((UIView *)childrenArray[idx-1]).mas_right);
                make.top.mas_equalTo(_containerView);
                make.width.mas_equalTo(_containerView.frame.size.width / childrenArray.count);
                make.bottom.mas_equalTo(_containerView);
            }];
            if (idx == childrenArray.count - 1) {
                [childView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.right.mas_equalTo(_containerView.mas_right);
                }];
            }
        } else {
            [childView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(_containerView);
                make.top.mas_equalTo(_containerView);
                make.width.mas_equalTo(_containerView.frame.size.width / childrenArray.count);
                make.bottom.mas_equalTo(_containerView);
            }];
            
        }
    }];
    
    
    
}

@end
