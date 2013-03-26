//
//  MapVC.m
//  toursj
//
//  Created by lk on 13-2-6.
//  Copyright (c) 2013年 yipin. All rights reserved.
//

#import "MapVC.h"
#import "TourConstant.h"
#import "Utility.h"
#import "ViewSpotAnnotation.h"

@interface MapVC () <MKMapViewDelegate>
@property (nonatomic,retain) NSDictionary *view_spot_list;
@property (nonatomic,retain) NSArray *viewSpotToDisplay;//contain id<MKAnnotation> objects
-(void)clickOnMap:(id)sender;
@end

@implementation MapVC
@synthesize mapView=_mapView;
@synthesize view_spot_list=_view_spot_list;
@synthesize viewSpotToDisplay=_viewSpotToDisplay;

-(void)updateMapView
{
    if (self.mapView.annotations) {
        [self.mapView removeAnnotations:self.mapView.annotations];
    }
    if (self.viewSpotToDisplay) {
        [self.mapView addAnnotations:self.viewSpotToDisplay];
    }
}

-(void)setViewSpotToDisplay:(NSArray *)viewSpotToDisplay
{
    _viewSpotToDisplay=viewSpotToDisplay;
    [self updateMapView];
}

-(void)setView_spot_list:(NSDictionary *)view_spot_list
{
    _view_spot_list=view_spot_list;
    //initial the viewSpotToDisplay
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:([view_spot_list.allKeys count]-1)];
    for (NSString *key in [view_spot_list allKeys]) {
        if (![key isEqualToString:PUSH_IDENTIFIER]) {
            [array addObject:[ViewSpotAnnotation annotationForViewSpot:[_view_spot_list valueForKey:key]]];
        }
    }
    [self setViewSpotToDisplay:array];
}
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
    [Utility customizeNavBar:self.navigationController.navigationBar];
    self.mapView.mapType=MKMapTypeStandard;
    self.mapView.showsUserLocation=YES;
    CLLocationCoordinate2D centerCoordinate=CLLocationCoordinate2DMake([TourConstant MAP_CENTER_LATITUDE], [TourConstant MAP_CENTER_LONGITUDE]);
    MKCoordinateSpan span=MKCoordinateSpanMake([TourConstant MAP_CENTER_LATITUDE_DELTA], [TourConstant MAP_CENTER_LONGITUDE_DELTA]);
    MKCoordinateRegion region=MKCoordinateRegionMake(centerCoordinate, span);
    region=[self.mapView regionThatFits:region];
    self.mapView.region=region;
    [self.mapView regionThatFits:region];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setView_spot_list:[Utility getDictionaryFormPlistFile:[TourConstant VIEW_SPOT_LIST_FILE_NAME]]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setMapView:nil];
    [self setView_spot_list:nil];
    [self setViewSpotToDisplay:nil];
    [self setView:nil];
    [super viewDidUnload];
}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    static NSString *identifier=ANNOTATION_IDENTIFIER;
    MKAnnotationView *aView=[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    if (!aView) {
        aView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
//        aView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        aView.canShowCallout=YES;
    }
    aView.annotation=annotation;
    ViewSpotAnnotation *annotationView=(ViewSpotAnnotation *)annotation;
    /*if the style of the pin is customed */
    //    [aView setImage:[UIImage imageNamed:annotationView.categoryImage]];
    //        aView.leftCalloutAccessoryView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
//    [(UIImageView *)aView.leftCalloutAccessoryView setImage:[UIImage imageNamed:annotationView.imageName ]];
    UIButton *btnClick = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    if ([annotation isKindOfClass:[ViewSpotAnnotation class]]) {
        [btnClick setTag:[annotationView tag]];
    }else{
        //自己的地点坐标
        return nil;
    }
    [btnClick addTarget:self action:@selector(clickOnMap:) forControlEvents:UIControlEventTouchUpInside];
    aView.rightCalloutAccessoryView = btnClick;
    return aView;
}
-(void)clickOnMap:(id)sender
{
    [self performSegueWithIdentifier:@"mapViewSpotDetailIdentifier" sender:sender];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSString *key=[[NSString alloc] initWithFormat:@"%d",((UIView *)sender).tag ];
    [segue.destinationViewController setValue:[_view_spot_list valueForKey:key] forKey:@"data"];
}
@end
