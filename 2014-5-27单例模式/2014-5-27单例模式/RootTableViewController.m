//
//  RootTableViewController.m
//  2014-5-27单例模式
//
//  Created by lanou3g on 14-5-27.
//  Copyright (c) 2014年 lanou3g.com 蓝欧科技. All rights reserved.
//

#import "RootTableViewController.h"
#import "PersonDataHandler.h"
#import "Person.h"
#import "SecondViewController.h"

@interface RootTableViewController ()

@end

@implementation RootTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}



- (void)viewWillAppear:(BOOL)animated
{
//    NSLog(@"%s", __FUNCTION__);
    [self.tableView reloadData];
}
- (void)viewDidAppear:(BOOL)animated
{
//    NSLog(@"%s", __FUNCTION__);
    
}
- (void)viewWillDisappear:(BOOL)animated
{
//    NSLog(@"%s", __FUNCTION__);
    
}

- (void)viewDidDisappear:(BOOL)animated
{
//    NSLog(@"%s", __FUNCTION__);
    
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    //  在左上角添加按钮
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithTitle:@"添加" style:UIBarButtonItemStylePlain target:self action:@selector(BarAction:)];
    self.navigationItem.rightBarButtonItem = barItem;
    [barItem release];
    
    UIBarButtonItem *leftBarItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(edit:)];
    self.navigationItem.leftBarButtonItem = leftBarItem;
    [leftBarItem release];
}

- (void)edit:(UIBarButtonItem *)sender
{
    if (self.tableView.editing == NO) {
        [self.tableView setEditing:YES animated:YES];
        sender.title = @"完成";
    } else {
//        self.tableView.editing = NO;
        [self.tableView setEditing:NO animated:NO];
        sender.title = @"编辑";
    }
}



#pragma mark 实现添加按钮
- (void)BarAction:(UIBarButtonItem *)sender;
{
    SecondViewController *secondController = [[[SecondViewController alloc] init] autorelease];
    [self.navigationController pushViewController:secondController animated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source
#pragma mark 设置分组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [PersonDataHandler sharedPersonDataHandler].dictionary.allKeys.count;
}

#pragma mark 设置每个分组中的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *allkeys = [PersonDataHandler sharedPersonDataHandler].dictionary.allKeys;
    NSString *key = allkeys[section];
    return [[PersonDataHandler sharedPersonDataHandler].dictionary[key] count];
}




 /*
 //  定义一个标志
 //  创建cell,置为空
 //  去重用队列里面查找是否有可重用的cell
 //  判断是否为空，为空，则创建
 //  使用
 //  返回
 */

#pragma mark 设置每行显示的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    
    NSArray *allkey = [PersonDataHandler sharedPersonDataHandler].dictionary.allKeys;
    NSString *key = allkey[indexPath.section];
    
    NSArray *array = [PersonDataHandler sharedPersonDataHandler].dictionary[key];
    Person *peson = array[indexPath.row];
    
    cell.textLabel.text = peson.name;
    cell.detailTextLabel.text = peson.address;
//    cell.accessoryType = UITableViewCellStyleSubtitle;
    return cell;
}


#pragma mark 设置分组标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [PersonDataHandler sharedPersonDataHandler].dictionary.allKeys[section];
}


#pragma mark 设置快速索引
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return [PersonDataHandler sharedPersonDataHandler].dictionary.allKeys;
}

- (void)test
{
    //  使用warning可以将写好的数据进行提示
// #warning 等待后台数据
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}



- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
//    [[PersonDataHandler sharedPersonDataHandler] moveFromSourceIndex:sourceIndexPath toIndex:destinationIndexPath];
    [[PersonDataHandler sharedPersonDataHandler] moveAtSourceIndex:sourceIndexPath toIndex:destinationIndexPath];

}


- (NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath
{
    if (sourceIndexPath.section == proposedDestinationIndexPath.section) {
        return proposedDestinationIndexPath;
    }
    return sourceIndexPath;
}

/*
 UITableViewCellEditingStyleNone,
 UITableViewCellEditingStyleDelete,
 UITableViewCellEditingStyleInsert
*/

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return UITableViewCellEditingStyleDelete;
    } else {
        return UITableViewCellEditingStyleInsert;
    }
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        NSLog(@"进行删除数据");
        [[PersonDataHandler sharedPersonDataHandler] deleteFromLiberay:indexPath];
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewAutomaticDimension];
    } else if (editingStyle == UITableViewCellEditingStyleInsert){
        NSLog(@"进行插入数据");
    } else {
        NSLog(@"不进行任何操作");
    }
}






- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%u", indexPath.section);
}


// Override to support conditional editing of the table view.
//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    // Return NO if you do not want the specified item to be editable.
//    return YES;
//}


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
