//
//  MapViewController.m
//  toursj
//
//  Created by ZhenzhenXu on 2/25/13.
//  Copyright (c) 2013 yipin. All rights reserved.
//

#import "MapViewController.h"
#import "SBJson.h"
#import "FindedAnnotation.h"

@interface MapViewController ()
@property (nonatomic, strong) NSDictionary *data;
@end

@implementation MapViewController

@synthesize data=_data;
@synthesize mapView=_mapView;
@synthesize receivedData=_receivedData;

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
    if ([self.data valueForKeyPath:@"longitude"]) {
        double longitude = [[self.data valueForKeyPath:@"longitude"] doubleValue];
        double latitude = [[self.data valueForKeyPath:@"latitude"] doubleValue];
        NSString *title=[self.data valueForKeyPath:@"name"];
        
        FindedAnnotation *annotation=[[FindedAnnotation alloc] initWithCoordinate:CLLocationCoordinate2DMake(latitude, longitude) withTitle:title];
        [_mapView removeAnnotations:_mapView.annotations];
        [_mapView addAnnotation:annotation];
        
        //I zoom my map to the area in question.
        [self zoomMapAndCenterAtLatitude:latitude andLongitude:longitude];
    } else {
        NSMutableString *urlString = [NSMutableString stringWithFormat:@"http://ajax.googleapis.com/ajax/services/search/local?v=1.0&q=%@",[[self.data valueForKey:@"address"] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        
        //Create NSURL string from a formate URL string.
        NSURL *url = [NSURL URLWithString:urlString];
        
        //Setup and start an async download.
        //Note that we should test for reachability!.
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
        NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
        if (connection) {
            // Create the NSMutableData to hold the received data.
            _receivedData = [NSMutableData data];
            
        } else {
            // Inform the user that the connection failed.
        }
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    // This method is called when the server has determined that it
    // has enough information to create the NSURLResponse.
    [_receivedData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    // Append the new data to receivedData.
    [_receivedData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"Connection failed! Error - %@ %@",[error localizedDescription],[[error userInfo] objectForKey:NSURLErrorFailingURLStringErrorKey]);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection

{
    //The string received from google's servers
    NSString *jsonString = [[NSString alloc] initWithData:_receivedData encoding:NSUTF8StringEncoding];
    //JSON Framework magic to obtain a dictionary from the jsonString.
    NSDictionary *responseData = [[jsonString JSONValue] objectForKey:@"responseData"];
    //Now we need to obtain our coordinates
    
    NSArray *results  = [responseData objectForKey:@"results"];
    if (results&&results.count>0) {
        //I put my coordinates in my array.
        double longitude = [[[results objectAtIndex:0] valueForKeyPath:@"lng"] doubleValue];
        double latitude = [[[results objectAtIndex:0] valueForKeyPath:@"lat"] doubleValue];
        NSString *title=[self.data valueForKeyPath:@"name"];
        
        FindedAnnotation *annotation=[[FindedAnnotation alloc] initWithCoordinate:CLLocationCoordinate2DMake(latitude, longitude) withTitle:title];
        [_mapView removeAnnotations:_mapView.annotations];
        [_mapView addAnnotation:annotation];
        
        //I zoom my map to the area in question.
        [self zoomMapAndCenterAtLatitude:latitude andLongitude:longitude];
    }
    
}

- (void) zoomMapAndCenterAtLatitude:(double) latitude andLongitude:(double) longitude
{
    MKCoordinateRegion region;
    region.center.latitude  = latitude;
    region.center.longitude = longitude;
    
    //Set Zoom level using Span
    MKCoordinateSpan span;
    span.latitudeDelta  = .005;
    span.longitudeDelta = .005;
    region.span = span;
    [_mapView setRegion:region animated:YES];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    MKPinAnnotationView *pinView = nil;
    
    NSString *defaultPinID = @"Annotation";
    pinView = (MKPinAnnotationView *)[_mapView dequeueReusableAnnotationViewWithIdentifier:defaultPinID];
    if ( pinView == nil ){
        pinView = [[MKPinAnnotationView alloc]
                   initWithAnnotation:annotation reuseIdentifier:defaultPinID];
    }
    pinView.pinColor = MKPinAnnotationColorGreen;
    pinView.canShowCallout = YES;
    pinView.animatesDrop = NO;
    
    return pinView;
}

@end
