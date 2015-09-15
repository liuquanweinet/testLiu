//
//  LTView.m
//  2014-5-14UI组合
//
//  Created by lanou3g on 14-5-14.
//  Copyright (c) 2014年 lanou3g.com 蓝欧科技. All rights reserved.
//

#import "LTView.h"

@implementation LTView

- (void)dealloc
{
    [_label release];
    [_textField release];
    

    [super dealloc];
}


#pragma mark 重写initWithFrame:
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        //  添加上label
        _label = [[UILabel alloc] initWithFrame: CGRectMake(0, 0, frame.size.width / 3 * 1, frame.size.height)];
        _label.backgroundColor = [UIColor grayColor];
        
        _textField = [[UITextField alloc] initWithFrame:CGRectMake(frame.size.width / 3, 0, frame.size.width / 3 * 2, frame.size.height)];
        _textField.borderStyle = UITextBorderStyleRoundedRect;
        _textField.textColor = [UIColor redColor];
        _textField.textAlignment = NSTextAlignmentCenter;
        _textField.enabled = YES;
        
        [self addSubview:_textField];
        [self addSubview:_label];
    }
    return self;
}


#pragma mark 初始化的时候初始值赋值为1
- (instancetype)initWithFrame:(CGRect)frame withLableText:(NSString *)text
{
    self = [self initWithFrame:frame];   // 在self里面调用initWithFrame,也就是将传进来的参数展示在label上
    if (self) {
        _label.text = text;
        _textField.placeholder = @"hehe";
    }
    return self;
}


#pragma mark 重写setter和getter方法
- (void)setLabelText:(NSString *)labelText
{
    _label.text = labelText;
}



- (NSString *)labelText
{
    return _label.text;
}


#pragma mark labelTextColor的getter和setterfangfa
- (void)setLabelColor:(UIColor *)labelColor
{
    _label.textColor = labelColor;
}

- (UIColor *)labelColor
{
    return _label.textColor;
}

#pragma mark 文本框的setter和getter方法
- (void)setFieldText:(NSString *)fieldText
{
    _textField.text = fieldText;
}

- (NSString *)fieldText
{
    return  _textField.text;
}

#pragma makr 文本框设置密码的setter和getter方法
-(void)setSecureTextEntry:(BOOL)secureTextEntry
{
    _textField.secureTextEntry = secureTextEntry;
}


- (BOOL)isSecureTextEntry
{
    return _textField.secureTextEntry;
}

#pragma mark 文本框delegate的setter和getter方法
- (void)setDelegate:(id<UITextFieldDelegate>)delegate
{
    _textField.delegate  = delegate;
}

- (id<UITextFieldDelegate>)delegate
{
    return _textField.delegate;
}








@end
