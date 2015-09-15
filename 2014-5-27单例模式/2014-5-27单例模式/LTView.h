//
//  LTView.h
//  2014-5-14UI组合
//
//  Created by lanou3g on 14-5-14.
//  Copyright (c) 2014年 lanou3g.com 蓝欧科技. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface LTView : UIView
{
    UILabel *_label;               //标签
    UITextField *_textField;       //输入框，可以继承，但不可以访问
}


@property (nonatomic, copy) NSString *labelText;   // 标签的文字
@property (nonatomic, retain)  UIColor *labelColor; // 标签的颜色
@property (nonatomic, copy) NSString *fieldText; // 输入框内容
@property (nonatomic,assign, getter = isSecureTextEntry) BOOL secureTextEntry;   // 设置是否以圆点的形式展示
@property (nonatomic, assign) id<UITextFieldDelegate> delegate;   // 输入框的代理


#pragma mark 初始化方法
- (instancetype)initWithFrame:(CGRect)frame withLableText
                             : (NSString *)text;











@end
