//
//  ViewSpot.h
//  toursj
//
//  Created by lk on 13-2-8.
//  Copyright (c) 2013年 yipin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewSpot : NSObject
@property (nonatomic,retain) NSString *KeyName;
@property (nonatomic,retain) NSString *imageName;
@property (nonatomic,retain) NSString *name;
@property (nonatomic,retain) NSString *picNames;//用逗号隔开
@property (nonatomic,retain) NSString *description;
@property (readwrite) CLLocationDegrees latitude;
@property (readwrite) CLLocationDegrees longitude;
@property (nonatomic,retain) NSString *category;

-(id)initWithDictionary : (NSDictionary *) viewSpot;

@end
