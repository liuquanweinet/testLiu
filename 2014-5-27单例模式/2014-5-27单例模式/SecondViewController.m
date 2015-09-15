//
//  SecondViewController.m
//  2014-5-27单例模式
//
//  Created by lanou3g on 14-5-27.
//  Copyright (c) 2014年 lanou3g.com 蓝欧科技. All rights reserved.
//

#import "SecondViewController.h"
#import "SecondView.h"
#import "Person.h"
#import "RootTableViewController.h"
#import "PersonDataHandler.h"

@interface SecondViewController ()

@property (nonatomic, retain) SecondView *secondView;

@end

@implementation SecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)loadView
{
    _secondView = [[[SecondView alloc] initWithFrame:[UIScreen mainScreen].bounds] autorelease];
    _secondView.backgroundColor = [UIColor cyanColor];
    self.view = _secondView;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [_secondView.b1 addTarget:self action:@selector(b1Action:) forControlEvents:UIControlEventTouchUpInside];
    [_secondView.b2 addTarget:self action:@selector(b2Action:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)b1Action: (UIButton *)sender
{
    Person *person = [[Person alloc] init];
    person.name = _secondView.lt1.fieldText;
    person.age = [_secondView.lt2.fieldText integerValue];
    person.address = _secondView.lt3.fieldText;
    person.firstName = _secondView.lt4.fieldText;
//    NSLog(@"%@", [PersonDataHandler sharedPersonDataHandler].dictionary);
    [[PersonDataHandler sharedPersonDataHandler] addPerson:person];
//     NSLog(@"%@", [PersonDataHandler sharedPersonDataHandler].dictionary);
    [person release];
    
//    [self.navigationController popToRootViewControllerAnimated:YES];
    [self.navigationController popViewControllerAnimated:YES];
    
}



- (void)b2Action: (UIButton *)sender
{
    _secondView.lt1.fieldText = nil;
    _secondView.lt2.fieldText = nil;
    _secondView.lt3.fieldText = nil;
    _secondView.lt4.fieldText = nil;
    [self.navigationController popToRootViewControllerAnimated:YES];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
