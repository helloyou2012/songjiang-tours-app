//
//  ViewSpotAnnotation.m
//  toursj
//
//  Created by lk on 13-2-18.
//  Copyright (c) 2013年 yipin. All rights reserved.
//

#import "ViewSpotAnnotation.h"
#import "TourConstant.h"

@implementation ViewSpotAnnotation
@synthesize viewSpot = _viewSpot;
@synthesize categoryImage = _categoryImage;
@synthesize imageName = _imageName;
@synthesize tag = _tag;

+(ViewSpotAnnotation *)annotationForViewSpot:(NSDictionary *)viewSpot
{
    ViewSpotAnnotation *annotation=[[ViewSpotAnnotation alloc] init];
    [annotation setViewSpot:viewSpot];
    [annotation setImageName:[annotation.viewSpot valueForKey:KEY_IMAGE_NAME]];
    [annotation setCategoryImage:[annotation.viewSpot valueForKey:KEY_CATEGORY]];
    [annotation setTag:[[annotation.viewSpot valueForKey:KEY_TAG] intValue]];
    return annotation;
}

-(NSString *)title
{
    NSString *key=KEY_NAME;
    return [self.viewSpot valueForKey:key];
}

-(NSString *)subtitle
{
    NSString *key=KEY_DESCRIPTION;
    return [self.viewSpot valueForKey:key];
}

-(CLLocationCoordinate2D)coordinate
{
    CLLocationCoordinate2D coordinate;
    NSString *key=KEY_LATITUDE;
    coordinate.latitude=[[self.viewSpot valueForKey:key] doubleValue];
    key=KEY_LONGITUDE;
    coordinate.longitude=[[self.viewSpot valueForKey:key] doubleValue];
    return coordinate;
}
@end
