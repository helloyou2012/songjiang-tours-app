//
//  Utility.m
//  toursj
//
//  Created by lk on 13-2-7.
//  Copyright (c) 2013年 yipin. All rights reserved.
//

#import "Utility.h"
#import "PrettyKit.h"

@implementation Utility
+(NSDictionary *)getDictionaryFormPlistFile:(NSString *)filename
{
    NSString *path=[[NSBundle mainBundle] pathForResource:filename ofType:@"plist"];
    NSDictionary* dict=[[NSDictionary alloc] initWithContentsOfFile:path];
    return dict;
}
+(void)customizeNavBar :(UINavigationBar *) navigationBar
{
    PrettyNavigationBar *navBar = (PrettyNavigationBar *) navigationBar;
    
    navBar.topLineColor = [UIColor colorWithHex:0xFF1000];
    navBar.gradientStartColor = [UIColor colorWithHex:0xDD0000];
    navBar.gradientEndColor = [UIColor colorWithHex:0xAA0000];
    navBar.bottomLineColor = [UIColor colorWithHex:0x990000];
    navBar.tintColor = navBar.gradientEndColor;
    navBar.roundedCornerRadius = 5;
}
@end
