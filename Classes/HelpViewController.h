//
//  HelpViewController.h
//  Fengshui
//
//  Created by  on 12-1-4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HelpViewController : UIViewController

@property (retain, nonatomic) IBOutlet UIScrollView *sview;
@property (retain, nonatomic) IBOutlet UIImageView *img;
@property (retain, nonatomic) IBOutlet UIButton *button;
- (IBAction)return_back:(id)sender;
@end
