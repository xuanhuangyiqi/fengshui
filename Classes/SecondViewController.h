//
//  SecondViewController.h
//  Fengshui
//
//  Created by  on 11-11-26.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

#import "FengshuiAppDelegate.h"
#import "ThirdViewController.h"
#import "JSON.h"

@interface SecondViewController : UIViewController
{
    int value;
    NSMutableData *responseData;
	CLLocationManager *locman;
    NSDictionary *items;
    NSString *addr1;    
    
}    
@property (retain, nonatomic) IBOutlet UIActivityIndicatorView *ind;
- (void)rota;
@property (assign, nonatomic) IBOutlet CLLocationManager *locman;
@property (retain, nonatomic) NSDictionary *items;
@property (retain, nonatomic) IBOutlet UILabel *Label1;
@property (retain, nonatomic) IBOutlet UILabel *Label2;
@property (retain, nonatomic) IBOutlet UILabel *Label3;
@property (retain, nonatomic) IBOutlet UILabel *Label4;
@property (retain, nonatomic) IBOutlet UILabel *Label5;
@property (retain, nonatomic) IBOutlet UILabel *Label6;
@property (retain, nonatomic) IBOutlet UILabel *Label7;
@property (retain, nonatomic) IBOutlet UILabel *Label8;
@property (retain, nonatomic) IBOutlet UILabel *Label9;
@property (retain, nonatomic) IBOutlet UILabel *Label10;
@property (retain, nonatomic) IBOutlet UILabel *Label11;
@property (retain, nonatomic) IBOutlet UILabel *Label12;
@property (retain, nonatomic) IBOutlet UILabel *Label13;
@property (retain, nonatomic) IBOutlet UILabel *Label14;
@property (retain, nonatomic) IBOutlet UILabel *Label15;
@property (retain, nonatomic) IBOutlet UILabel *Label16;
@property (retain, nonatomic) IBOutlet UILabel *Label17;
@property (retain, nonatomic) IBOutlet UILabel *Label18;
@property (retain, nonatomic) IBOutlet UILabel *Label19;
@property (retain, nonatomic) IBOutlet UILabel *Label20;
@property (retain, nonatomic) IBOutlet UILabel *Label21;
@property (retain, nonatomic) IBOutlet UILabel *Label22;
@property (retain, nonatomic) IBOutlet UILabel *Label23;
@property (retain, nonatomic) IBOutlet UILabel *Label24;

@property (retain, nonatomic) IBOutlet UIButton *button1;
@property (retain, nonatomic) IBOutlet UIButton *button2;
@property (retain, nonatomic) IBOutlet UIButton *button3;
@property (retain, nonatomic) IBOutlet UIButton *button4;
@property (retain, nonatomic) IBOutlet UIButton *button5;
@property (retain, nonatomic) IBOutlet UIButton *button6;
@property (retain, nonatomic) IBOutlet UIButton *button7;
@property (retain, nonatomic) IBOutlet UIButton *button8;

@property (retain, nonatomic) IBOutlet NSString *addr1;

@property (retain, nonatomic) NSArray *label_array;
- (IBAction)button1_click:(id)sender;
- (IBAction)button2_click:(id)sender;
- (IBAction)button3_click:(id)sender;
- (IBAction)button4_click:(id)sender;
- (IBAction)button5_click:(id)sender;
- (IBAction)button6_click:(id)sender;
- (IBAction)button7_click:(id)sender;
- (IBAction)button8_click:(id)sender;
- (IBAction)button9_click:(id)sender;
- (IBAction)button10_click:(id)sender;
- (IBAction)return_back:(id)sender;

-(IBAction)oUrl1:(id)sender;
-(IBAction)oUrl2:(id)sender;
-(IBAction)oUrl3:(id)sender;
-(IBAction)oUrl4:(id)sender;
-(IBAction)oUrl5:(id)sender;
-(IBAction)oUrl6:(id)sender;
-(IBAction)oUrl7:(id)sender;
-(IBAction)oUrl8:(id)sender;
@property (retain, nonatomic) IBOutlet UIImageView *center;
@end
