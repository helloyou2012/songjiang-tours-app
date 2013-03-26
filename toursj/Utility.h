//
//  Utility.h
//  toursj
//
//  Created by lk on 13-2-7.
//  Copyright (c) 2013年 yipin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utility : NSObject
+(NSDictionary *)getDictionaryFormPlistFile:(NSString *) filename;
+(void) customizeNavBar :(UINavigationBar *) navigationBar;
@end
