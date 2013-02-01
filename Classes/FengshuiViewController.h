//
//  FengshuiViewController.h
//  Fengshui
//
//  Created by  on 11-11-26.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "SecondViewController.h"
#import "FengshuiAppDelegate.h"
#import "CustomPickerDataSource.h"
#import "DirectChoose.h"
#import "BirthYear.h"
#import "PositionChoose.h"
#import "HelpViewController.h"



@interface FengshuiViewController : UIViewController
{
    CLLocationManager *locman;
	
//	IBOutlet UILabel *text;
//	IBOutlet UIImageView *center;
}
@property (retain, nonatomic) IBOutlet SecondViewController *second;
@property (retain, nonatomic) IBOutlet UIButton *detect;
@property (retain, nonatomic) IBOutlet UITextField *birthYear;
@property (retain, nonatomic) IBOutlet UITextField *direction;
@property (retain, nonatomic) IBOutlet UITextField *position;
@property (retain, nonatomic) IBOutlet UIPickerView *selector;
@property (assign, nonatomic) IBOutlet CLLocationManager *locman;
@property (retain, nonatomic) IBOutlet UIPickerView *custom;
@property (retain, nonatomic) IBOutlet CustomPickerDataSource *source;
@property (retain, nonatomic) IBOutlet UIImageView *center;
@property (retain, nonatomic) IBOutlet UILabel *text;
@property (retain, nonatomic) IBOutlet UIActivityIndicatorView *w;


@property (retain, nonatomic) IBOutlet UIView *v;

- (IBAction)send:(id)sender;
- (IBAction)textFieldDoneEditing:(id)sender;
- (IBAction)chooseDirection:(id)sender;
- (IBAction)choosePosition:(id)sender;
- (IBAction)changeView:(id)sender;
- (IBAction)enter_help:(id)sender;

-(void)changeDirectionMethod:(NSString *)ns;
-(void)changeYear:(NSString *)ns;
- (IBAction)chooseBirthYear:(id)sender;


@end
