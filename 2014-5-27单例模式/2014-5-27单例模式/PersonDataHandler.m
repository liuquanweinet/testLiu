//
//  PersonDataHandler.m
//  2014-5-27单例模式
//
//  Created by lanou3g on 14-5-27.
//  Copyright (c) 2014年 lanou3g.com 蓝欧科技. All rights reserved.
//

#import "PersonDataHandler.h"


static PersonDataHandler *personDataHandler = nil;
@implementation PersonDataHandler

- (void)dealloc
{
    [_dictionary release];
    [super dealloc];
}

#pragma mark 创建单例对象的方法
+ (PersonDataHandler *)sharedPersonDataHandler
{
    //  加一个互斥锁，组织是多个线程同时访问
    @synchronized(self){
        if (personDataHandler == nil) {
            personDataHandler = [[PersonDataHandler alloc] init];
            [personDataHandler initWithPersonData];
        }
    }
    return personDataHandler;
}

#pragma mark 初始化数据
- (void)initWithPersonData
{
    //  初始化字典
    self.dictionary = [NSMutableDictionary dictionary];
    Person *p1 = [self createPerson:@"张浩" withage:23 withAddress:@"河南省郑州" withFirstName:@"Z"];
    Person *p2 = [self createPerson:@"刘翔" withage:22 withAddress:@"河南省顺治" withFirstName:@"L"];
    Person *p3 = [self createPerson:@"王雨" withage:22 withAddress:@"河南省郑州" withFirstName:@"W"];
    Person *p4 = [self createPerson:@"王川" withage:21 withAddress:@"河南省宇宙" withFirstName:@"W"];
    Person *p5 = [self createPerson:@"王安石" withage:20 withAddress:@"河南省安阳" withFirstName:@"W"];
    [self addPerson:p1];
    [self addPerson:p2];
    [self addPerson:p3];
    [self addPerson:p4];
    [self addPerson:p5];
}




#pragma mark 添加联系人到字典里面
- (void)addPerson :(Person *)person
{
    //  拿到person对象的姓名首字母，并判断字典当中是否有相同的key，如果没有，则创建key,并把Person对象插入到字典当中, 如果有相同的key则直接插入到数组当中
    NSArray *allkeys = [_dictionary allKeys];
    if (![allkeys containsObject:person.firstName]) {
        //  字典的添加
        NSMutableArray *mulArray  = [NSMutableArray arrayWithObject:person];
        [self.dictionary setObject:mulArray forKey:person.firstName];
        //        [self.dictionary  :mulArray forKey:person.firstName];
    } else {
        [[self.dictionary objectForKey:person.firstName] addObject:person];
    }
}

#pragma mark 创建联系人
- (Person *)createPerson : (NSString *)name withage
                         : (NSUInteger)age withAddress
                         : (NSString *)address withFirstName
                         : (NSString *)firstName
{
    Person *p1 = [[Person alloc] init];
    p1.name = name;
    p1.age = age;
    p1.address = address;
    p1.firstName = firstName;
    return [p1 autorelease];
}

#pragma mark 数据库里面的数据移动
- (void)moveFromSourceIndex: (NSIndexPath *)sourceIndex toIndex :(NSIndexPath *)desIndex
{
    NSString *key1 = [self.dictionary allKeys][sourceIndex.section];
    NSString *key2 = [self.dictionary allKeys][desIndex.section];
    
    if ([key1 isEqualToString:key2]) {
        NSMutableArray *array = [self.dictionary objectForKey:key1];
        [array exchangeObjectAtIndex:sourceIndex.row withObjectAtIndex:desIndex.row];
    }
}

#pragma mark 删除数据库当中的数据
- (void)deleteFromLiberay: (NSIndexPath *)deletIndex
{
    NSString *str = [self.dictionary allKeys][deletIndex.section];
    NSLog(@"%@", str);
    NSMutableArray *array = [[[self.dictionary objectForKey:str]retain] autorelease];
    [array removeObjectAtIndex:deletIndex.row];
    NSLog(@"%@", array);
    NSLog(@"%u", [array retainCount]);
}



#pragma mark 数据库里面数据的移动显示是删除，然后插入
- (void)moveAtSourceIndex: (NSIndexPath *)souceIndex toIndex :(NSIndexPath *)desIndex
{
    NSString *key1 = [self.dictionary allKeys][souceIndex.section];
    NSMutableArray *array = [self.dictionary objectForKey:key1];
    Person *person1 = [[array[souceIndex.row] retain] autorelease];
    [array removeObject:person1];
    [array insertObject:person1 atIndex:desIndex.row];
}



@end
