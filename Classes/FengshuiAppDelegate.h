//
//  FengshuiAppDelegate.h
//  Fengshui
//
//  Created by lipan on 11-11-28.
//  Copyright 2011 bupt. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FengshuiViewController;

@interface FengshuiAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    FengshuiViewController *viewController;
	bool created;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet FengshuiViewController *viewController;
@property (nonatomic, retain) NSString *url;
- (void) passValue:(int) value;
- (int) showValue;
- (void) setUrl:(NSString *)uu;
- (NSString *) loadUrl;
@end

