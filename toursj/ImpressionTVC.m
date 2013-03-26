//
//  ImpressionTVC.m
//  toursj
//
//  Created by lk on 13-2-5.
//  Copyright (c) 2013年 yipin. All rights reserved.
//

#import "ImpressionTVC.h"
#import "Utility.h"
#import "ImpressionItem.h"
#import "TourConstant.h"
#import "MWPhotoBrowser.h"

@interface ImpressionTVC () <MWPhotoBrowserDelegate>

@property (nonatomic,retain) NSDictionary *impressionList;
@property (nonatomic,strong) NSArray *picArray;
@end

@implementation ImpressionTVC

@synthesize impressionList=_impressionList;
@synthesize picArray=_picArray;

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
    self.impressionList=[Utility getDictionaryFormPlistFile:@"Impression"];
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
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"impressionCell";
    ImpressionItem *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.tag= [indexPath row];
    if (cell==nil) {
        cell=[[ImpressionItem alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    NSArray *keys=[[self.impressionList allKeys]sortedArrayUsingSelector:@selector(compare:)];
    NSDictionary *dict=[self.impressionList valueForKey:[keys objectAtIndex:[indexPath row]]];
    [cell.image setImage:[UIImage imageNamed: [dict valueForKey:KEY_IMAGE_NAME]]];
    [cell.title setText:[dict valueForKey:@"name"]];
    cell.tag=[indexPath row];
    // Configure the cell...
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
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
    
    NSArray *keys=[[self.impressionList allKeys] sortedArrayUsingSelector:@selector(compare:)];
    
    NSDictionary *dict=[self.impressionList valueForKey:[keys objectAtIndex:[indexPath row]]];
    [self setPicArray:[dict valueForKey:@"pics"]];
    MWPhotoBrowser *browser = [[MWPhotoBrowser alloc] initWithDelegate:self];
    [browser setToolbarItems:nil];
//    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:browser];
//    nc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self.navigationController pushViewController:browser animated:YES];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [self setHidesBottomBarWhenPushed:YES];
    NSArray *keys=[[self.impressionList allKeys] sortedArrayUsingSelector:@selector(compare:)];
    UITableViewCell *cell=sender;
    NSDictionary *dict=[self.impressionList valueForKey:[keys objectAtIndex:cell.tag]];
    [segue.destinationViewController setValue:dict forKey:@"data"];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [self setHidesBottomBarWhenPushed:NO];
}


#pragma mark - MWPhotoBrowserDelegate

- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser {
    return [_picArray count];
}

- (MWPhoto *)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index {
    if (index < _picArray.count)
    {
        NSDictionary *picDict = [self.picArray objectAtIndex:index];
        MWPhoto *mwPhoto = [[MWPhoto alloc] initWithImage:[UIImage imageNamed:[picDict valueForKey:KEY_IMAGE_NAME]]];
        [mwPhoto setCaption:[picDict valueForKey:KEY_DESCRIPTION]];
        return mwPhoto;
    }
    return nil;
}
@end
