//
//  WebViewController.m
//  Fengshui
//
//  Created by  on 12-1-14.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "WebViewController.h"

@implementation WebViewController

@synthesize webview;
@synthesize uu;
- (void) setUrl
{
    NSURL *u =[NSURL URLWithString:self.uu];
    NSURLRequest *request =[NSURLRequest requestWithURL:u];
    [webview loadRequest:request];
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setUrl];
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
- (IBAction)return_back:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];   
}
@end
