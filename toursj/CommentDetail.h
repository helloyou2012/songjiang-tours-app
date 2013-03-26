//
//  CommentDetail.h
//  toursj
//
//  Created by lk on 13-2-9.
//  Copyright (c) 2013年 yipin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FTCoreTextView.h"

@interface CommentDetail : UIViewController<FTCoreTextViewDelegate>

@property (nonatomic, strong) FTCoreTextView *coreTextView;
@property (nonatomic, strong) IBOutlet UIScrollView *scrollView;
@end
