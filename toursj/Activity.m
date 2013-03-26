//
//  Activity.m
//  toursj
//
//  Created by lk on 13-2-8.
//  Copyright (c) 2013年 yipin. All rights reserved.
//

#import "Activity.h"
#import "ActivityModel.h"
//#import <RestKit/JSONKit.h>
#import "Utility.h"

@interface Activity ()

@property (nonatomic,retain) NSMutableArray *datalist;
@property (nonatomic,retain) NSDictionary *tourData;

@end

@implementation Activity

@synthesize datalist=_datalist;
@synthesize tourData=_tourData;


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
    NSString *filename=[self.tourData valueForKey:@"detailFileName"];
    NSString *path=[[NSBundle mainBundle] pathForResource:filename ofType:@"plist"];
    _datalist=[NSArray arrayWithContentsOfFile:path];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
//    [self sendRequest:0 andPageNumis:1];
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
    if (_datalist) {
        return _datalist.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ActivityCell";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    cell.tag=indexPath.row;
    // Configure the cell...
    NSDictionary *dict=[_datalist objectAtIndex:indexPath.row];
    cell.textLabel.text=[dict objectForKey:@"title"];
    cell.detailTextLabel.text=[dict objectForKey:@"description"];
    
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
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UITableViewCell *cell=sender;
    [segue.destinationViewController setValue:[_datalist objectAtIndex:cell.tag] forKey:@"commentData"];
}

/*
-(void)sendRequest:(NSInteger)maxActivityId andPageNumis:(NSInteger)pageNum
{
    RKObjectMapping* mapping=[RKObjectMapping mappingForClass:[ActivityModel class]];
//    [mapping mapKeyPathsToAttributes:@"id",@"activityid",@"aaddr",@"aaddr",@"acontent",@"acontent",@"atitle",@"atitle", nil];
    [mapping mapKeyPath:@"activityDomain" toAttribute:@"activityModel"];
    NSString *url=[[NSString alloc]initWithFormat:@"/activity/%d/%d",maxActivityId,pageNum];
//    [[RKClient sharedClient]get:url delegate:self];
//    [[RKObjectManager sharedManager] loadObjectsAtResourcePath:url delegate:self];
    [[RKClient sharedClient] get:url delegate:self];
//    NSLog([RKClient sharedClient]);
}

-(void)request:(RKRequest *)request didLoadResponse:(RKResponse *)response
{
    NSLog(@"%@",[request URL]);
    NSDictionary *data=[[response bodyAsString] objectFromJSONString];
    NSArray *dataArray=[data valueForKey:@"activityDomain"];
    for (NSDictionary* s in dataArray) {
        NSLog(@"%@",s);
//        NSDictionary *a=[s objectFromJSONString];
        [self.dataList addObject:s];
    }
    if ([response isJSON]) {
//        [response bodyAsJSON]
        NSLog(@"is json object:::::");
    }
//    NSLog(@"%@",[response bodyAsJSON]);
}
*/
@end
