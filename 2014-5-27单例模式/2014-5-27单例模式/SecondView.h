//
//  SecondView.h
//  2014-5-27单例模式
//
//  Created by lanou3g on 14-5-27.
//  Copyright (c) 2014年 lanou3g.com 蓝欧科技. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LTView.h"
@interface SecondView : UIView
@property (nonatomic, retain) LTView *lt1;
@property (nonatomic, retain) LTView *lt2;
@property (nonatomic, retain) LTView *lt3;
@property (nonatomic, retain) LTView *lt4;

@property(nonatomic, retain) UIButton *b1;
@property(nonatomic, retain) UIButton *b2;

@end
