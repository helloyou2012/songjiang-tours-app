//
//  TourDetail.h
//  toursj
//
//  Created by lk on 13-2-8.
//  Copyright (c) 2013年 yipin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TourDetail : UIViewController<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate,UISearchDisplayDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) IBOutlet UISearchDisplayController *searchDiplay;

@end
