//
//  CommentDetailItem.h
//  toursj
//
//  Created by lk on 13-2-9.
//  Copyright (c) 2013年 yipin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FTCoreTextView.h"

@interface CommentDetailItem : UITableViewCell<FTCoreTextViewDelegate>

@property (strong, nonatomic) FTCoreTextView *coreTextView;

- (void)createTextView:(NSString*)text;
- (NSArray *)coreTextStyle;
@end
