//
//  CommentsTVC.m
//  toursj
//
//  Created by lk on 13-2-9.
//  Copyright (c) 2013年 yipin. All rights reserved.
//

#import "CommentsTVC.h"
#import "Utility.h"
#import "CommentItem.h"
#import <QuartzCore/QuartzCore.h>

@interface CommentsTVC ()

@property (nonatomic,retain) NSDictionary *commentList;
@property (nonatomic,retain) NSArray *keys;
-(IBAction)commentDetail:(id)sender;
@end

@implementation CommentsTVC

@synthesize commentList=_commentList;
@synthesize keys=_keys;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [Utility customizeNavBar:self.navigationController.navigationBar];
    self.commentList=[Utility getDictionaryFormPlistFile:@"Comments"];
    self.keys=[[self.commentList allKeys]sortedArrayUsingSelector:@selector(compare:)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.commentList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"commentIdentifier";
    CommentItem *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (nil==cell) {
        cell=[[CommentItem alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CommentItem"];
    }
    // Configure the cell...
    NSDictionary *valueHere=[self.commentList valueForKey:[self.keys objectAtIndex:[indexPath row]]];
    cell.title.text=[valueHere valueForKey:@"title"];
    cell.content.text=[valueHere valueForKey:@"description"];
    [cell.littlePic setImage:[UIImage imageNamed:[valueHere valueForKey:@"littlepic"]]];
    
    //是否设置边框以及是否可见
    [cell.littlePic.layer setMasksToBounds:YES];
    //设置边框圆角的弧度
    //[cell.littlePicImage.layer setCornerRadius:4.0];
    //设置阴影
    cell.littlePic.clipsToBounds=NO;
    cell.littlePic.layer.shadowColor=[[UIColor darkGrayColor] CGColor];
    cell.littlePic.layer.shadowRadius = 1.f;
    cell.littlePic.layer.shadowOffset = CGSizeMake(2.f, 2.f);
    cell.littlePic.layer.shadowOpacity = 0.3f;
    //设置边框线的宽
    [cell.littlePic.layer setBorderWidth:2.0f];
    //设置边框线的颜色
    UIColor *bgcolor=[UIColor colorWithRed:0.9f green:0.9f blue:0.9f alpha:1.0f];
    [cell.littlePic.layer setBorderColor:[bgcolor CGColor]];
    
    cell.tag=[indexPath row];
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
//    [self performSegueWithIdentifier:@"<#string#>" sender:self];
}
-(void)commentDetail:(id)sender
{
    
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UITableViewCell *cell=sender;
    NSString *key=[self.keys objectAtIndex:cell.tag];
    [segue.destinationViewController setValue:[self.commentList valueForKey:key] forKey:@"commentData"];
}
@end
