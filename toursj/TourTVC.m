//
//  TourTVC.m
//  toursj
//
//  Created by lk on 13-2-5.
//  Copyright (c) 2013年 yipin. All rights reserved.
//

#import "TourTVC.h"
#import "Utility.h"
#import "TourConstant.h"
#import "TourItem.h"

@interface TourTVC ()
@property (nonatomic,retain) NSDictionary *menuList;
@property (readwrite) NSInteger numperrow;

-(void) displayImageInRowNum:(NSInteger) row
                     forCell:(TourItem *)cell;

@end

@implementation TourTVC
@synthesize menuList=_menuList;
@synthesize numperrow;

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
    NSLog(@"in viewdidload");
    [Utility customizeNavBar:self.navigationController.navigationBar];
    
    self.menuList=[Utility getDictionaryFormPlistFile:[TourConstant MENU_ITEM_FILE_NAME]];
    self.numperrow=NUMBER_OF_MENU_PER_ROW;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSInteger num=[self.menuList count];
    NSInteger c= (num%numperrow==0)?(num/numperrow):(1+num/numperrow);
    return c;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"tourCellIdentifier";
    TourItem *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if (cell == nil) {
		cell = [[TourItem alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:CellIdentifier];
//        cell.textLabel=@"a";
	}
    [self displayImageInRowNum:[indexPath row] forCell:cell];
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
-(void)displayImageInRowNum:(NSInteger)row forCell:(TourItem *)cell
{
    NSLog(@"%d",row);
    NSInteger num=[self.menuList count];
    NSArray *keys=[[self.menuList allKeys] sortedArrayUsingSelector:@selector(compare:)];
    for (NSInteger i=0; i<numperrow; i++) {
        if (numperrow*row+i+1>num) {
            break;
        }
        NSString *key=[keys objectAtIndex:numperrow*row+i];
        NSDictionary *valueHere=[self.menuList valueForKey:key] ;
        NSString *keyName=[valueHere valueForKey:@"name"];
        NSString *imageName=[valueHere valueForKey:KEY_IMAGE_NAME];
        NSInteger tagHere=[[valueHere valueForKey:KEY_TAG] intValue];
        
        switch (i) {
            case 0:
                [cell.firstLabel setText:keyName];
                [cell.firstImage setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
                [cell.firstImage addTarget:self action:@selector(tourDetail:) forControlEvents:UIControlEventTouchUpInside];
                [cell.firstImage setTag:tagHere];
                break;
                
            case 1:
                [cell.secondLabel setText:keyName];
                [cell.secondImage setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
                [cell.secondImage addTarget:self action:@selector(tourDetail:) forControlEvents:UIControlEventTouchUpInside];
                [cell.secondImage setTag:tagHere];
                break;
                
            case 2:
                [cell.thirdLabel setText:keyName];
                [cell.thirdImage setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
                [cell.thirdImage addTarget:self action:@selector(tourDetail:) forControlEvents:UIControlEventTouchUpInside];
                [cell.thirdImage setTag:tagHere];
                break;
                
            case 3:
                [cell.fourthLabel setText:keyName];
                [cell.fourthImage setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
                [cell.fourthImage addTarget:self action:@selector(tourDetail:) forControlEvents:UIControlEventTouchUpInside];
                [cell.fourthImage setTag:tagHere];
                break;
                
            default:
                break;
        }
    }
    
}

- (void)tourDetail:(id)sender
{
    UIButton *btn=(UIButton *)sender;
    NSLog(@"触发的button的tag是：：：：%d",btn.tag);
    NSDictionary *menu=[self.menuList valueForKey:[[NSString alloc] initWithFormat:@"%d",btn.tag]];
    NSString *pushIdentifier=[menu valueForKey:@"pushIdentifier"];
    [self performSegueWithIdentifier:pushIdentifier sender:sender];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UIButton *btn=(UIButton *)sender;
    NSLog(@"触发的button的tag是：：：：%d",btn.tag);
    UIViewController *destinatioin=segue.destinationViewController;
    NSDictionary* valueHere=[self.menuList valueForKey:[[NSString alloc] initWithFormat:@"%d",btn.tag]];
//    [destinatioin setValue:[valueHere valueForKey: @"name"] forKey:@"NavigationTitle"];
    [destinatioin setValue:valueHere forKey:@"tourData"];
}
@end
