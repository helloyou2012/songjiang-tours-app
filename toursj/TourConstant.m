//
//  TourConstant.m
//  toursj
//
//  Created by lk on 13-2-6.
//  Copyright (c) 2013年 yipin. All rights reserved.
//

#import "TourConstant.h"
@interface TourConstant ()

@end

@implementation TourConstant

+(CLLocationDegrees) MAP_CENTER_LATITUDE
{
    return 31.249162;
}

+(CLLocationDegrees) MAP_CENTER_LONGITUDE
{
    return 121.457899;
}
+(CLLocationDegrees) MAP_CENTER_LATITUDE_DELTA
{
    return 0.5;
}
+(CLLocationDegrees) MAP_CENTER_LONGITUDE_DELTA
{
    return 0.5;
}
+(NSString *)VIEW_SPOT_LIST_FILE_NAME
{
    return @"ViewSpots";
}
+(NSString *)MENU_ITEM_FILE_NAME
{
    return @"MenuItems";
}

@end
