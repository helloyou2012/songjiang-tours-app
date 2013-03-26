//
//  TourDetail.m
//  toursj
//
//  Created by lk on 13-2-8.
//  Copyright (c) 2013年 yipin. All rights reserved.
//

#import "TourDetail.h"
#import "Utility.h"
#import "TourConstant.h"
#import "TourDetailItem.h"

@interface TourDetail ()

@property (nonatomic,retain) NSDictionary *tourData;//从上个view传过来的数据
@property (nonatomic,retain) NSDictionary *dictData;//各种实际的数据
//@property (nonatomic,retain) NSMutableDictionary *resultDict;//检索结果
@property (nonatomic,retain) NSMutableArray *resultKeyArray;
-(void)searchForString:(NSString *)searchStr;
@end

@implementation TourDetail

@synthesize tourData=_tourData;
@synthesize dictData=_dictData;
@synthesize resultKeyArray=_resultKeyArray;
@synthesize tableView=_tableView;
@synthesize searchBar=_searchBar;
@synthesize searchDiplay=_searchDiplay;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.navigationItem.title=[self.tourData valueForKey:@"name"];
    self.dictData=[Utility getDictionaryFormPlistFile:[self.tourData valueForKey:@"detailFileName"]];
//    self.resultDict=[NSMutableDictionary dictionary];
    self.resultKeyArray=[NSMutableArray array];
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
    NSInteger rowNum=0;
    if ([tableView isEqual:self.tableView]) {
        rowNum=[self.dictData.allKeys count]-1;
    }else if ([tableView isEqual:self.searchDiplay.searchResultsTableView]){
//        rowNum=[self.resultDict.allKeys count];
        rowNum=[self.resultKeyArray count];
    }
    return rowNum;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"tourDetailIdentifier";
    TourDetailItem *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell==nil) {
        cell=[[TourDetailItem alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    // Configure the cell...
    NSString *key=[NSString string];
    NSDictionary *valueHere=[NSDictionary dictionary];
    if ([tableView isEqual:self.tableView]) {
        key=[[NSString alloc]initWithFormat:@"%d",([indexPath row]+1) ];
        valueHere=[_dictData valueForKey:key];
    }else if ([tableView isEqual:self.searchDiplay.searchResultsTableView]){
        key=[self.resultKeyArray objectAtIndex:[indexPath row]];
        valueHere=[_dictData valueForKey:key];
    }
    
    [cell.nameLabel setText:[valueHere valueForKey:@"name"]];
    NSLog(@"nameis::::%@",[valueHere valueForKey:@"name"]);
    [cell.descriptionLabel setText:[valueHere valueForKey:@"description"]];
    [cell.littlePicImage setImage:[UIImage imageNamed:[valueHere valueForKey:@"littlepic"]]];
    //是否设置边框以及是否可见
    [cell.littlePicImage.layer setMasksToBounds:YES];
    //设置边框圆角的弧度
    //[cell.littlePicImage.layer setCornerRadius:4.0];
    //设置阴影
    cell.littlePicImage.clipsToBounds=NO;
    cell.littlePicImage.layer.shadowColor=[[UIColor darkGrayColor] CGColor];
    cell.littlePicImage.layer.shadowRadius = 1.f;
    cell.littlePicImage.layer.shadowOffset = CGSizeMake(2.f, 2.f);
    cell.littlePicImage.layer.shadowOpacity = 0.3f;
    //设置边框线的宽
    [cell.littlePicImage.layer setBorderWidth:2.0f];
    //设置边框线的颜色
    UIColor *bgcolor=[UIColor colorWithRed:0.9f green:0.9f blue:0.9f alpha:1.0f];
    [cell.littlePicImage.layer setBorderColor:[bgcolor CGColor]];
    
    NSString *tagStr=[valueHere valueForKey:@"tag"];
    cell.tag=[tagStr intValue];
    
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
//    TourDetailItem *c=[tableView cellForRowAtIndexPath:indexPath];
//    NSLog(@"%d,%@",[indexPath row],c.nameLabel.text);
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
- (void)viewDidUnload {
    [self setTableView:nil];
    [self setTourData:nil];
    [self setSearchBar:nil];
    [self setSearchDiplay:nil];
    [super viewDidUnload];
}
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
//    NSLog(searchText);
    [self searchForString:searchText];
}
-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    searchBar.showsCancelButton = YES;
    for (UIView* v  in [self.searchBar subviews]) {
        if ([v isKindOfClass:[UIButton class]]) {
            UIButton *cancleBtn=(UIButton*)v;
            [cancleBtn setTitle:@"取消" forState:UIControlStateNormal];
        }
    }

}
-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    return YES;
}
-(void)searchForString:(NSString *)searchStr
{
//    [self.resultDict removeAllObjects];
    [self.resultKeyArray removeAllObjects];
    for (NSString *key in [self.dictData allKeys]) {
        NSDictionary *dict=[self.dictData valueForKey:key];
        if (![key isEqualToString:@"pushIdentifier"]&&[[dict valueForKey:@"name"] rangeOfString:searchStr].length>0) {
            [self.resultKeyArray addObject:key];
        }
    }
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSString *key = [[NSString alloc] initWithFormat:@"%d" , ((UITableViewCell *)sender).tag ];
    [segue.destinationViewController setValue:[self.dictData valueForKey:key] forKey:@"data"];
}
@end
