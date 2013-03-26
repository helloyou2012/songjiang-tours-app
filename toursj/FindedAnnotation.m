//
//  FindedAnnotation.m
//  Maps
//
//  Created by HelloYou on 5/19/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "FindedAnnotation.h"

@implementation FindedAnnotation
@synthesize title=_title;
@synthesize coordinate=_coordinate;

- (id)initWithCoordinate:(CLLocationCoordinate2D)coordinate withTitle:(NSString*)title
{
    self = [super init];
    if (self) {
        _coordinate=coordinate;
        _title=title;
    }
    return self;
}

- (CLLocationCoordinate2D)coordinate;
{
    return _coordinate;
}

// required if you set the MKPinAnnotationView's "canShowCallout" property to YES
- (NSString *)title
{
    return _title;
}

// optional
- (NSString *)subtitle
{
    return nil;
}
@end
