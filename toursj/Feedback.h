//
//  Feedback.h
//  toursj
//
//  Created by lk on 13-2-8.
//  Copyright (c) 2013年 yipin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface Feedback : UIViewController<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *send;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapGestureRecgnizer;

- (IBAction)sendMsg:(id)sender;

@end
