//
//  DetailContentItem.m
//  toursj
//
//  Created by lk on 13-2-19.
//  Copyright (c) 2013年 yipin. All rights reserved.
//

#import "DetailContentItem.h"

@implementation DetailContentItem

@synthesize priceLabel=_priceLabel;
@synthesize addressLabel=_addressLabel;
@synthesize contactLabel=_contactLabel;
@synthesize categoryLabel=_categoryLabel;

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
