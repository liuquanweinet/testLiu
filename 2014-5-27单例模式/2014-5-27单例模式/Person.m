//
//  Person.m
//  2014-5-27单例模式
//
//  Created by lanou3g on 14-5-27.
//  Copyright (c) 2014年 lanou3g.com 蓝欧科技. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)dealloc
{
    [_address release];
    [_firstName release];
    [_name release];
    [super dealloc];
}







@end
