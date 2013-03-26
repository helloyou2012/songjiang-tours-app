//
//  Feedback.m
//  toursj
//
//  Created by lk on 13-2-8.
//  Copyright (c) 2013年 yipin. All rights reserved.
//

#import "Feedback.h"
#import "FeedbackItem.h"

@interface Feedback ()

@end

@implementation Feedback

@synthesize send=_send;
@synthesize tapGestureRecgnizer=_tapGestureRecgnizer;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.navigationController.navigationItem.title=@"意见反馈";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    //recgnizer
    [self.view addGestureRecognizer:self.tapGestureRecgnizer];
    //key board
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
#ifdef __IPHONE_5_0
    
    float version = [[[UIDevice currentDevice] systemVersion] floatValue];
    NSLog(@"%f",version);
    if (version >= 5.0) {
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillChangeFrameNotification object:nil];
        
    }
    
#endif

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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat rowHeight=100.0f;
    switch ([indexPath row]) {
        case 0:
            //first line
            rowHeight=130.0f;
            break;
            
        case 1:
            rowHeight=80.0f;
            break;
            
        default:
            break;
    }
    return rowHeight;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"feedbackIdentifier";
    FeedbackItem *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if (cell == nil) {
		cell = [[FeedbackItem alloc] initWithStyle:UITableViewCellStyleDefault
                               reuseIdentifier:CellIdentifier];
        //        cell.textLabel=@"a";
	}
    
    CGRect frame=[cell.contact frame];
    switch ([indexPath row]) {
        case 0:
            //first line
            cell.title.text=@"您的意见：";
            frame.size.height=100;
            cell.textComment.layer.borderColor=[[UIColor grayColor]CGColor];
            cell.textComment.layer.cornerRadius=5;
            cell.textComment.layer.borderWidth=1;
            [cell.textComment setHidden:NO];
            [cell.textComment setFrame:frame];
            [cell.contact removeFromSuperview];
            break;            
        case 1:
            cell.title.text=@"您的联系方式：";
//            frame.size.height=0;
            [cell.contact setFrame:frame];
            [cell.contact setPlaceholder:@"在此输入您的联系方式"];
            break;
            
        default:
            break;
    }
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

#pragma mark - Text view delegate

//-(void)textFieldDidBeginEditing:(UITextField *)textField
//{
//    UITableView *tableView=self.view;
////    tableView 
//}

- (void)viewDidUnload {
    [self setSend:nil];
    [self setTapGestureRecgnizer:nil];
    [super viewDidUnload];
}
- (IBAction)sendMsg:(id)sender {
}

#pragma mark Responding to keyboard events

- (void)keyboardWillShow:(NSNotification *)notification {
    CGRect dstFrame=self.view.frame;
    dstFrame.origin.y-=13;
    [self.view setFrame:dstFrame];
    
    //自定义return键
    //    UIButton *doneBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    //    [doneBtn setFrame:CGRectMake(320-78, 480-46, 78, 46)];
    //    [doneBtn setBackgroundColor:[UIColor blueColor]];
    //    [doneBtn setTitle:@"abcd" forState:UIControlStateNormal];
    //    [doneBtn addTarget:self action:@selector(publishQuan:) forControlEvents:UIControlEventTouchUpInside];
    //    // locate keyboard view
    //    UIWindow* tempWindow = [[[UIApplication sharedApplication] windows] objectAtIndex:1];
    //
    //
    //
    //    if (doneBtn.superview == nil)
    //    {
    //        [tempWindow addSubview:doneBtn];    // 注意这里直接加到window上
    //    }
    
}
- (void)keyboardWillHide:(NSNotification *)notification {
    CGRect dstFrame=self.view.frame;
    dstFrame.origin.y+=13;
    [self.view setFrame:dstFrame];
}


@end
