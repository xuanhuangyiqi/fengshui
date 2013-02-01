
#import "FengshuiAppDelegate.h"
#import "ThirdViewController.h"
#import "WebViewController.h"
#import "JSON.h"
#import <UIKit/UIKit.h>

@interface ThirdViewController : UIViewController
{
    NSMutableData *responseData;

}
@property (retain, nonatomic) IBOutlet UIScrollView *result;
@property (retain, nonatomic) IBOutlet UIActivityIndicatorView *inc;
@property (retain, nonatomic) IBOutlet UILabel *title;
@property (retain, nonatomic) IBOutlet UILabel *description;
@property (retain, nonatomic) IBOutlet UILabel *rela;
@property (retain, nonatomic) NSMutableArray *ns;

@property (retain, nonatomic) NSString *tempNS;

-(IBAction)enterUrl1;
-(IBAction)enterUrl2;
-(IBAction)enterUrl:(NSString *)u;

- (IBAction)return_back:(id)sender;
@end
