//
//  TourConstant.h
//  toursj
//
//  Created by lk on 13-2-6.
//  Copyright (c) 2013年 yipin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

#define NUMBER_OF_MENU_PER_ROW 4;
#define KEY_IMAGE_NAME @"imageName"
#define KEY_TAG @"tag"
#define KEY_IS_HAS_SEARCH_BAR @"isHasSearchBar"
#define KEY_NAME @"name";
#define KEY_DESCRIPTION @"description"
#define KEY_LATITUDE @"latitude"
#define KEY_LONGITUDE @"longitude"
#define KEY_CATEGORY @"category"
#define ANNOTATION_IDENTIFIER @"annotationIdentifier"
#define PUSH_IDENTIFIER @"pushIdentifier"

#define FAVOURITE_KEY @"favourite"

@interface TourConstant : NSObject

+(CLLocationDegrees) MAP_CENTER_LATITUDE;
+(CLLocationDegrees) MAP_CENTER_LONGITUDE;
+(CLLocationDegrees) MAP_CENTER_LATITUDE_DELTA;
+(CLLocationDegrees) MAP_CENTER_LONGITUDE_DELTA;


+(NSString *) VIEW_SPOT_LIST_FILE_NAME;
+(NSString *) MENU_ITEM_FILE_NAME;
@end
