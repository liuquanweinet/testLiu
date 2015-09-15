//
//  SecondView.m
//  2014-5-27单例模式
//
//  Created by lanou3g on 14-5-27.
//  Copyright (c) 2014年 lanou3g.com 蓝欧科技. All rights reserved.
//

#import "SecondView.h"


#define KMargin 65
@implementation SecondView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self addViews];
    }
    return self;
}


- (void)addViews
{
    _lt1 = [[LTView alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.frame) + KMargin - 10, CGRectGetMinY(self.frame) + KMargin, 250, 20) withLableText:@"姓名"];
    _lt2 = [[LTView alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.frame) + KMargin - 10, CGRectGetMinY(self.frame) + 3 * KMargin / 2 , 250, 20) withLableText:@"年龄"];
    _lt3 = [[LTView alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.frame) + KMargin - 10, CGRectGetMinY(self.frame) + 2 * KMargin , 250, 20) withLableText:@"住址"];
    _lt4 = [[LTView alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.frame) + KMargin - 10, CGRectGetMinY(self.frame) + 5 * KMargin / 2, 250, 20) withLableText:@"首姓"];
    
    _b1 = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.frame) + 110, CGRectGetMinY(self.frame) + 3 *KMargin, 50, 20)];
    [_b1 setTitle:@"保存" forState:UIControlStateNormal];
    [_b1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    _b2 = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.frame) + 180, CGRectGetMinY(self.frame) + 3 *  KMargin, 50, 20)];
    [_b2 setTitle:@"取消" forState:UIControlStateNormal];
    [_b2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    
    [self addSubview:_b2];
    [self addSubview:_b1];
    [self addSubview:_lt1];
    [self addSubview:_lt2];
    [self addSubview:_lt3];
    [self addSubview:_lt4];
    [_lt1 release];
    [_lt2 release];
    [_lt3 release];
    [_lt4 release];
    
    
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
