//
//  Video.m
//  toursj
//
//  Created by lk on 13-2-21.
//  Copyright (c) 2013年 yipin. All rights reserved.
//

#import "Video.h"

@interface Video ()

@property (nonatomic,retain) NSDictionary *tourData;

@end

@implementation Video

@synthesize tourData=_tourData;

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
