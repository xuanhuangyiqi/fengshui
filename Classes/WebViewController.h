//
//  WebViewController.h
//  Fengshui
//
//  Created by  on 12-1-14.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FengshuiAppDelegate.h"

@interface WebViewController : UIViewController
@property (retain, nonatomic) NSString *uu;
@property (retain, nonatomic) IBOutlet UIWebView *webview;
- (IBAction)return_back:(id)sender;
- (void) setUrl;
@end
