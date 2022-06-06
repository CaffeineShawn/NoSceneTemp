//
//  TTInput.h
//  NoSceneTemp
//
//  Created by 肖扬 on 2022/6/6.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TTInputField : UIView
@property (nonatomic, copy) NSString *inputText;
@property (nonatomic, copy) NSString *labelText;
@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, copy) NSString *placeholder;
- (instancetype)initWithLabelText:(NSString *)labelText placeholder:(NSString *)placeholder;
@end

NS_ASSUME_NONNULL_END
