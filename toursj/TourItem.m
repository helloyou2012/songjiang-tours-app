//
//  TourItem.m
//  toursj
//
//  Created by lk on 13-2-6.
//  Copyright (c) 2013年 yipin. All rights reserved.
//

#import "TourItem.h"

@implementation TourItem

@synthesize firstImage=_firstImage;
@synthesize firstLabel=_firstLabel;
@synthesize secondImage=_secondImage;
@synthesize secondLabel=_secondLabel;
@synthesize thirdImage=_thirdImage;
@synthesize thirdLabel=_thirdLabel;
@synthesize fourthImage=_fourthImage;
@synthesize fourthLabel=_fourthLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
