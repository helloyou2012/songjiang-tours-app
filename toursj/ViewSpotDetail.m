//
//  ViewSpotDetail.m
//  toursj
//
//  Created by lk on 13-2-18.
//  Copyright (c) 2013年 yipin. All rights reserved.
//

#import "ViewSpotDetail.h"
#import "TourConstant.h"
#import "DetailContentItem.h"
#import "DetailPictureItem.h"
#import "CommentDetailItem.h"
#import "AddFavouriteItem.h"
#import "SVProgressHUD.h"

@interface ViewSpotDetail () <UIActionSheetDelegate>

@property (nonatomic,strong) NSDictionary *data;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *shareButton;
- (IBAction)addFavourite:(id)sender;
- (IBAction)shareClick:(id)sender;

@end

@implementation ViewSpotDetail

@synthesize data=_data;
@synthesize shareButton=_shareButton;

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
    NSString *key=KEY_NAME;
    [self.navigationItem setTitle:[_data valueForKey:key]];}

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

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([indexPath row] == 0) {
        return 120;
    } else if([indexPath row] == 1){
        UITableViewCell *cell=[self tableView:tableView cellForRowAtIndexPath:indexPath];
        return cell.frame.size.height;
    }else if([indexPath row] == 2){
        return 130;
    }else if ([indexPath row] == 3){
        return 90;
    }
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *picCellIdentifier = @"detailPictureIdentifier";
    static NSString *CellIdentifier = @"detailContentIdentifier";
    static NSString *contentCellIdentifier = @"commentDetailIdentifier";
    static NSString *addFavCellIdentifier = @"addFavIdentifier";
    UITableViewCell *cell = nil;
    if ([indexPath row] == 0) {
        cell=[tableView dequeueReusableCellWithIdentifier:picCellIdentifier];
        if (cell == nil) {
            cell = [[DetailPictureItem alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:picCellIdentifier];
        }
        [((DetailPictureItem *)cell).pic setImage:[UIImage imageNamed:[ self.data valueForKey:@"pic"]]];
    }else if([indexPath row] == 2){
        cell=[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[DetailContentItem alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        NSString *text=[self.data valueForKey:@"price"];
        text = (text == nil)? @"无" : text;
        [((DetailContentItem *)cell).priceLabel setText: text];
        text = [self.data valueForKey:@"address"];
        text = (text == nil)? @"无" : text;
        [((DetailContentItem *)cell).addressLabel setText:text];
        text = [self.data valueForKey:@"contact"];
        text = (text == nil)? @"无" : text;
        [((DetailContentItem *)cell).contactLabel setText:text];
        text = [self.data valueForKey:@"category"];
        text = (text == nil)? @"无" : text;
        [((DetailContentItem *)cell).categoryLabel setText:text];
    }else if ([indexPath row] ==1){
        cell = [[CommentDetailItem alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:contentCellIdentifier];
        NSString *contentText=[self.data valueForKey:@"description"];
        [(CommentDetailItem*)cell createTextView:contentText];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }else if ([indexPath row] == 3){
        cell = [tableView dequeueReusableCellWithIdentifier:addFavCellIdentifier];
        if (cell == nil) {
            cell = [[AddFavouriteItem alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:addFavCellIdentifier];
        }
    NSMutableArray *favouriteArray = [[NSUserDefaults standardUserDefaults] valueForKey:FAVOURITE_KEY];
    if ([favouriteArray containsObject:self.data]) {
        [((AddFavouriteItem *)cell).addFavourite setEnabled:NO];
        [((AddFavouriteItem *)cell).addFavourite setTitle:@"已收藏" forState:UIControlStateNormal];
    }else{
        
        [((AddFavouriteItem *)cell).addFavourite addTarget:self action:@selector(addFavourite:) forControlEvents:UIControlEventTouchUpInside];
    }
        [((AddFavouriteItem *)cell).mapLocation addTarget:self action:@selector(mapLocation:) forControlEvents:UIControlEventTouchUpInside];

    }
    
    // Configure the cell...
    
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

- (IBAction)addFavourite:(id)sender {
    NSUserDefaults *persistenceData=[NSUserDefaults standardUserDefaults];
     
    NSArray *fav = [persistenceData arrayForKey:FAVOURITE_KEY];
    NSMutableArray *MutableFav=nil;
    if ([fav containsObject:self.data]) {
        return;
    } else {
        if (fav == nil) {
            fav = [NSMutableArray array];
        }
        MutableFav = [NSMutableArray arrayWithArray:fav];
        [MutableFav addObject:_data];
        [[NSUserDefaults standardUserDefaults] setValue:MutableFav forKey:FAVOURITE_KEY];
        [SVProgressHUD showSuccessWithStatus:@"收藏成功！"];
    }
//    [persistenceData f];
}

- (IBAction)shareClick:(id)sender {
    UIActionSheet *shareSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"发送短信",@"发给微信好友",@"发给QQ好友",@"分享到微信朋友圈",@"分享到微博",@"发送邮件", nil];
    [shareSheet showFromBarButtonItem:sender animated:YES];
}

- (void)mapLocation:(id) sender{
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [segue.destinationViewController setValue:self.data forKey:@"data"];
}

- (void)viewDidUnload {
    [self setShareButton:nil];
    [super viewDidUnload];
}
@end
