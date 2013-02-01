//
//  HelpViewController.m
//  Fengshui
//
//  Created by  on 12-1-4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "HelpViewController.h"

@implementation HelpViewController

@synthesize sview;
@synthesize img;
@synthesize button;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [img setFrame:CGRectMake(0, 0, 320, 1000)];
    
    [sview setContentSize:CGSizeMake(320, 1050)];
    [sview setScrollEnabled:YES];
    [sview setBackgroundColor:[UIColor clearColor]];
    [sview setCanCancelContentTouches:NO];
    sview.clipsToBounds = YES;
    sview.indicatorStyle = UIScrollViewIndicatorStyleBlack;
    
    [button setCenter:CGPointMake(165, 975)];
    // Do any additional setup after loading the view from its nib.
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
- (IBAction)return_back:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}
@end
