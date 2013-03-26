//
//  ViewSpot.m
//  toursj
//
//  Created by lk on 13-2-8.
//  Copyright (c) 2013年 yipin. All rights reserved.
//

#import "ViewSpot.h"

@implementation ViewSpot

@synthesize KeyName=_KeyName;
@synthesize imageName=_imageName;
@synthesize name=_name;
@synthesize picNames=_picNames;
@synthesize description=_description;
@synthesize latitude=_latitude;
@synthesize longitude=_longitude;
@synthesize category=_category;

-(id)initWithDictionary : (NSDictionary *) viewSpot
{
    self=[super init];
    if (self) {
        [self setImageName:[viewSpot valueForKey:@"imageName"]];
        [self setLatitude:[[viewSpot valueForKey:@"latitude"] floatValue]];
        [self setLongitude:[[viewSpot valueForKey:@"longitude"] floatValue]];
        [self setDescription:[viewSpot valueForKey:@"description"]];
        [self setCategory:[viewSpot valueForKey:@"category"]];
        [self setName:[viewSpot valueForKey:@"name"]];
        [self setPicNames:[viewSpot valueForKey:@"picNames"]];
    }
    return self;
}
@end
