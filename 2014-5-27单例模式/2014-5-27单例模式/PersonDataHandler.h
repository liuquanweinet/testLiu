//
//  PersonDataHandler.h
//  2014-5-27单例模式
//
//  Created by lanou3g on 14-5-27.
//  Copyright (c) 2014年 lanou3g.com 蓝欧科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
@interface PersonDataHandler : NSObject

@property (nonatomic, retain) NSMutableDictionary *dictionary;     //存放所有联系人的信息



#pragma mark 创建单例对象的方法
+ (PersonDataHandler *)sharedPersonDataHandler;
#pragma mark 添加联系人
- (void)addPerson :(Person *)person;

#pragma mark 数据库里面的数据移动
- (void)moveFromSourceIndex: (NSIndexPath *)sourceIndex toIndex :(NSIndexPath *)desIndex;
#pragma mark 删除数据库当中的数据
- (void)deleteFromLiberay: (NSIndexPath *)deletIndex;


#pragma mark 数据库里面数据的移动显示是删除，然后插入
- (void)moveAtSourceIndex: (NSIndexPath *)souceIndex toIndex :(NSIndexPath *)desIndex;

@end
