//
//  ImpressionDetail.m
//  toursj
//
//  Created by lk on 13-2-5.
//  Copyright (c) 2013年 yipin. All rights reserved.
//

#import "ImpressionDetail.h"
#import "PrettyKit.h"

@interface ImpressionDetail ()

@property (nonatomic,retain) NSDictionary *data;

- (void)fillTheScrollView :(UIScrollView *)scrollView
               usingArray :(NSArray *)array;
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView;
@end

@implementation ImpressionDetail

@synthesize scrollView=_scrollView;
@synthesize data=_data;
@synthesize descriptionLabel=_descriptionLabel;

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
    
    self.navigationItem.title=[self.data valueForKey:@"name"];
    [self fillTheScrollView:self.scrollView usingArray:[self.data valueForKey:@"pics"]];
//    [self.navigationController setWantsFullScreenLayout:YES];
//    [self customeNavigationBar:self.navigationController.navigationBar];
    //display the text of description
    [self scrollViewDidEndDecelerating:self.scrollView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setScrollView:nil];
    [self setDescriptionLabel:nil];
    [super viewDidUnload];
}

- (void)fillTheScrollView :(UIScrollView *)scrollView
               usingArray :(NSArray *)array
{
    for (NSDictionary *pic in array) {
        CGRect frame=scrollView.frame;
//        frame.size.height-=44;
        NSInteger pageNum=[array indexOfObject:pic];
        frame.origin.x=frame.size.width*pageNum;
//        frame.size.height-=10;
        UIImageView *tempImgeView=[[UIImageView alloc]initWithFrame:frame];
        UIImage *img=[UIImage imageNamed:[pic valueForKey:@"imageName"] ];
//        img set
        [tempImgeView setImage:img];
        
        
        //        [self.guideImgViews addObject:tempImgeView];
        [scrollView addSubview:tempImgeView];
        frame=tempImgeView.frame;
    }
    
    [scrollView setScrollsToTop:NO];
    // a page is the width of the scroll view
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width *(array.count), scrollView.frame.size.height-44);
//    CGRect rect_screen=[[UIScreen mainScreen]bounds];

}

-(void) customeNavigationBar :(UINavigationBar*)navigationBar
{
    PrettyNavigationBar *navBar = (PrettyNavigationBar *) navigationBar;
    
    navBar.topLineColor = [UIColor colorWithHex:0xFF1000];
    navBar.gradientStartColor = [UIColor colorWithHex:0xDD0000];
    navBar.gradientEndColor = [UIColor colorWithHex:0xAA0000];
    navBar.bottomLineColor = [UIColor colorWithHex:0x990000];
    navBar.tintColor = navBar.gradientEndColor;
    navBar.roundedCornerRadius = 8;
    navBar.alpha=0.2;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGPoint point=[scrollView contentOffset];
    NSInteger page=(NSInteger)(point.x/scrollView.frame.size.width );
    NSArray *array=[self.data valueForKey:@"pics"];
    [self.descriptionLabel setText:[[array objectAtIndex:page]valueForKey:@"description"]];
    [self.descriptionLabel removeFromSuperview];
    [self.view addSubview:self.descriptionLabel];
}

@end
