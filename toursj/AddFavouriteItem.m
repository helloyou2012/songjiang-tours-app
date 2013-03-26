//
//  AddFavouriteItem.m
//  toursj
//
//  Created by lk on 13-2-23.
//  Copyright (c) 2013年 yipin. All rights reserved.
//

#import "AddFavouriteItem.h"

@implementation AddFavouriteItem

@synthesize addFavourite=_addFavourite;
@synthesize voiceNavigation=_voiceNavigation;
@synthesize mapLocation=_mapLocation;

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
