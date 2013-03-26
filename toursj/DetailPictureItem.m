//
//  DetailPictureItem.m
//  toursj
//
//  Created by lk on 13-2-19.
//  Copyright (c) 2013年 yipin. All rights reserved.
//

#import "DetailPictureItem.h"

@implementation DetailPictureItem

@synthesize pic=_pic;

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
