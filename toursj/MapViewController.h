//
//  MapViewController.h
//  toursj
//
//  Created by ZhenzhenXu on 2/25/13.
//  Copyright (c) 2013 yipin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController<NSURLConnectionDelegate,MKMapViewDelegate>

@property (nonatomic,strong)IBOutlet MKMapView *mapView;
@property (nonatomic,strong) NSMutableData *receivedData;

- (void) zoomMapAndCenterAtLatitude:(double) latitude andLongitude:(double) longitude;

@end
