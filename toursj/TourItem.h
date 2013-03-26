//
//  TourItem.h
//  toursj
//
//  Created by lk on 13-2-6.
//  Copyright (c) 2013年 yipin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TourItem : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *firstImage;
@property (weak, nonatomic) IBOutlet UILabel *firstLabel;
@property (weak, nonatomic) IBOutlet UIButton *secondImage;
@property (weak, nonatomic) IBOutlet UILabel *secondLabel;
@property (weak, nonatomic) IBOutlet UIButton *thirdImage;
@property (weak, nonatomic) IBOutlet UILabel *thirdLabel;
@property (weak, nonatomic) IBOutlet UIButton *fourthImage;
@property (weak, nonatomic) IBOutlet UILabel *fourthLabel;

@end
