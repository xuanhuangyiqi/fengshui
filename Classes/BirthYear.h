//
//  BirthYear.h
//  Fengshui
//
//  Created by  on 11-12-13.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FengshuiViewController.h"

@interface BirthYear : UITableViewController
{
    NSMutableArray *dataItems;
    FengshuiViewController *father;
}
@property (retain, nonatomic) FengshuiViewController *father;
- (IBAction)return_click:(id)sender;
@end
