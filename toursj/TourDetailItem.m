//
//  TourDetailItem.m
//  toursj
//
//  Created by lk on 13-2-11.
//  Copyright (c) 2013年 yipin. All rights reserved.
//

#import "TourDetailItem.h"

@implementation TourDetailItem

@synthesize nameLabel=_nameLabel;
@synthesize descriptionLabel=_descriptionLabel;
@synthesize littlePicImage=_littlePicImage;

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
