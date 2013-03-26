//
//  ViewSpotAnnotation.h
//  toursj
//
//  Created by lk on 13-2-18.
//  Copyright (c) 2013年 yipin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface ViewSpotAnnotation : NSObject <MKAnnotation>

+(ViewSpotAnnotation *) annotationForViewSpot : (NSDictionary *) viewSpot;
@property (nonatomic,strong) NSDictionary *viewSpot;
@property (nonatomic,strong) NSString *imageName;
@property (nonatomic,strong) NSString *categoryImage;
@property (readwrite) NSInteger tag;
@end
