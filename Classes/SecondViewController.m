
#import "SecondViewController.h"

@implementation SecondViewController
@synthesize ind;
@synthesize Label1;
@synthesize Label2;
@synthesize Label3;
@synthesize Label4;
@synthesize Label5;
@synthesize Label6;
@synthesize Label7;
@synthesize Label8;
@synthesize Label9;
@synthesize Label10;
@synthesize Label11;
@synthesize Label12;
@synthesize Label13;
@synthesize Label14;
@synthesize Label15;
@synthesize Label16;
@synthesize Label17;
@synthesize Label18;
@synthesize Label19;
@synthesize Label20;
@synthesize Label21;
@synthesize Label22;
@synthesize Label23;
@synthesize Label24;
@synthesize center;
@synthesize locman;
@synthesize items;

@synthesize button1;
@synthesize button2;
@synthesize button3;
@synthesize button4;
@synthesize button5;
@synthesize button6;
@synthesize button7;
@synthesize button8;
@synthesize addr1;
@synthesize label_array;
int resultSignal;

- (void)viewDidLoad
{

    self.label_array = [[NSArray alloc] initWithObjects:
                        Label1, Label2, Label3, Label4, Label5, Label6,
                        Label7, Label8, Label9, Label10,Label11,Label12,
                        Label13,Label14,Label15,Label16,Label17,Label18,
                        Label19,Label20,Label21,Label22,Label23,Label24,
                        nil ];
    [super viewDidLoad];
    resultSignal = 0;
    

	// Do anydditional setup after loading the view, typically from a nib.
    FengshuiAppDelegate *delegate = (FengshuiAppDelegate *)[[UIApplication sharedApplication] delegate];
    int Did = [delegate showValue];
    NSLog(@"did: %d", Did);
    responseData = [NSMutableData data];
    [responseData setLength:0];
    NSString *astring = [[NSString alloc] initWithString:[NSString stringWithFormat:@"http://www.yucezhijia.com/fengshui/json.php?id=%d",Did]];
    NSString *url = [NSString stringWithFormat:astring];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url ]];
   // [[NSURLConnection alloc] initWithRequest:request delegate:self];
	
    responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    if (responseData!= nil)
    {
        [self receive];
    }
	
	self.locman = [[CLLocationManager alloc] init];	
    locman.delegate = self;
    if (locman.headingAvailable)
    {
        [locman startUpdatingHeading];
    }
    else{

    }
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{

}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [responseData setLength:0];
    [responseData initWithData:data];
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
	
    self.locman = [[CLLocationManager alloc] init];	
    locman.delegate = self;
    if (locman.headingAvailable)
    {
        [locman startUpdatingHeading];
    }

}

- (void)rota
{
    UILabel *t_label;
    int x, y, r, font_size;
    for ( int it = 0; it < 24; ++it )
    {
       
         t_label = [label_array objectAtIndex:it];       

        
        if (it < 8 )
        {
            r = 117;
            font_size = 20;
        }
        else if ( it < 16)
        {
            r = 88;
            font_size = 10;
        }
        else{
            r = 65;
            font_size = 10;
        }
        
        UIFont *font = [UIFont systemFontOfSize:font_size];
        NSString * aString = [t_label.text copy];
        CGSize titleSize = [aString sizeWithFont:font constrainedToSize:CGSizeMake(1000.0f, font_size) lineBreakMode:UILineBreakModeCharacterWrap];
        [t_label setFrame:CGRectMake(0, 0, titleSize.width, titleSize.height)]; 

        
        x = 160; y = 180;
        x += r * sin((8-it%8)/4.0*M_PI);
        y += r * cos((8-it%8)/4.0*M_PI);
        [t_label setCenter:CGPointMake(x, y)];
        

        [t_label setTransform:CGAffineTransformMakeRotation(M_PI*((it%8)*0.25+1.0))];
        

        
    }

}
//- (void)connectionDidFinishLoading:(NSURLConnection *)connection
- (void)receive
{
    NSString *responseString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];

        [ind stopAnimating];

        self.items = [responseString JSONValue];  
        Label1.text = [items objectForKey:@"a"];
        Label2.text = [items objectForKey:@"b"];
        Label3.text = [items objectForKey:@"c"];
        Label4.text = [items objectForKey:@"d"];
        Label5.text = [items objectForKey:@"e"];
        Label6.text = [items objectForKey:@"f"];
        Label7.text = [items objectForKey:@"g"];
        Label8.text = [items objectForKey:@"h"];
    
        Label9.text = [items objectForKey:@"a_beizhu"];
        Label10.text = [items objectForKey:@"b_beizhu"];
        Label11.text = [items objectForKey:@"c_beizhu"];
        Label12.text = [items objectForKey:@"d_beizhu"];
        Label13.text = [items objectForKey:@"e_beizhu"];
        Label14.text = [items objectForKey:@"f_beizhu"];
        Label15.text = [items objectForKey:@"g_beizhu"];
        Label16.text = [items objectForKey:@"h_beizhu"];
    
        Label17.text = [items objectForKey:@"a_beizhu2"];
        Label18.text = [items objectForKey:@"b_beizhu2"];
        Label19.text = [items objectForKey:@"c_beizhu2"];
        Label20.text = [items objectForKey:@"d_beizhu2"];
        Label21.text = [items objectForKey:@"e_beizhu2"];
        Label22.text = [items objectForKey:@"f_beizhu2"];
        Label23.text = [items objectForKey:@"g_beizhu2"];
        Label24.text = [items objectForKey:@"h_beizhu2"];
        resultSignal = 1;
        
        self.addr1 = [items objectForKey:@"a_lianjie"];
        [self rota];
}

/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

- (void)didReceiveMemoryWarning {

    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {

  //  [self setButton1:nil];

    [self setInd:nil];
    [self setLabel24:nil];
    [self setLabel23:nil];
    [self setLabel22:nil];
    [self setLabel21:nil];
    [self setLabel20:nil];
    [self setLabel19:nil];
    [self setLabel18:nil];
    [self setLabel17:nil];
    [self setLabel16:nil];
    [self setLabel15:nil];
    [self setLabel14:nil];
    [self setLabel13:nil];
    [self setLabel12:nil];
    [self setLabel11:nil];
    [self setLabel10:nil];
    [self setLabel9:nil];
    [self setLabel8:nil];
    [self setLabel7:nil];
    [self setLabel6:nil];
    [self setLabel5:nil];
    [self setLabel4:nil];
    [self setLabel3:nil];
    [self setLabel2:nil];
    [self setLabel1:nil];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)enterNextView
{
	ThirdViewController *third = [[ThirdViewController alloc] initWithNibName:@"ThirdViewController" bundle:nil];
	[self presentModalViewController:third animated:YES];
    
}
- (IBAction)return_back:(id)sender {

    [self dismissModalViewControllerAnimated:YES];
}
- (IBAction)button1_click:(id)sender {
    FengshuiAppDelegate *delegate = (FengshuiAppDelegate *)[[UIApplication sharedApplication] delegate];
    [delegate passValue:1];
    [self enterNextView];
}

- (IBAction)button2_click:(id)sender {
    FengshuiAppDelegate *delegate = (FengshuiAppDelegate *)[[UIApplication sharedApplication] delegate];
    [delegate passValue:2];
	[self enterNextView];
}

- (IBAction)button3_click:(id)sender {
    FengshuiAppDelegate *delegate = (FengshuiAppDelegate *)[[UIApplication sharedApplication] delegate];
    [delegate passValue:3];[self enterNextView];
}

- (IBAction)button4_click:(id)sender {
    FengshuiAppDelegate *delegate = (FengshuiAppDelegate *)[[UIApplication sharedApplication] delegate];
    [delegate passValue:4];[self enterNextView];
}

- (IBAction)button5_click:(id)sender {
    FengshuiAppDelegate *delegate = (FengshuiAppDelegate *)[[UIApplication sharedApplication] delegate];
    [delegate passValue:5];[self enterNextView];
}

- (IBAction)button6_click:(id)sender {
    FengshuiAppDelegate *delegate = (FengshuiAppDelegate *)[[UIApplication sharedApplication] delegate];
    [delegate passValue:6];[self enterNextView];
}

- (IBAction)button7_click:(id)sender {
    FengshuiAppDelegate *delegate = (FengshuiAppDelegate *)[[UIApplication sharedApplication] delegate];
    [delegate passValue:7];[self enterNextView];
}

- (IBAction)button8_click:(id)sender {
    FengshuiAppDelegate *delegate = (FengshuiAppDelegate *)[[UIApplication sharedApplication] delegate];
    [delegate passValue:8];[self enterNextView];
}

- (IBAction)button9_click:(id)sender {
    FengshuiAppDelegate *delegate = (FengshuiAppDelegate *)[[UIApplication sharedApplication] delegate];
    [delegate passValue:9];[self enterNextView];
}

- (IBAction)button10_click:(id)sender {
    FengshuiAppDelegate *delegate = (FengshuiAppDelegate *)[[UIApplication sharedApplication] delegate];
    [delegate passValue:10];[self enterNextView];
}
-(void)showPage:(NSString *)ns
{
    NSString *url = [items objectForKey:ns];
    WebViewController *web = [[WebViewController alloc] initWithNibName:@"WebViewController" bundle:nil];
	web.uu = url;
    [self presentModalViewController:web animated:YES];
}
-(IBAction)oUrl1:(id)sender{ [self showPage:@"a_lianjie"];}
-(IBAction)oUrl2:(id)sender{ [self showPage:@"b_lianjie"];}
-(IBAction)oUrl3:(id)sender{ [self showPage:@"c_lianjie"];}
-(IBAction)oUrl4:(id)sender{ [self showPage:@"d_lianjie"];}
-(IBAction)oUrl5:(id)sender{ [self showPage:@"e_lianjie"];}
-(IBAction)oUrl6:(id)sender{ [self showPage:@"f_lianjie"];}
-(IBAction)oUrl7:(id)sender{ [self showPage:@"g_lianjie"];}
-(IBAction)oUrl8:(id)sender{ [self showPage:@"h_lianjie"];}

-(void)dismiss:(id)inSender {
    //  如果是被 presentModalViewController 以外的实例调用，parentViewController 将是nil，下面的调用无效
    [self.parentViewController dismissModalViewControllerAnimated:YES];
}
- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading
{
    if ( newHeading.trueHeading < 0 )
        [self.center setTransform:CGAffineTransformMakeRotation(M_PI-newHeading.magneticHeading*M_PI/180.0)];
    else
        [self.center setTransform:CGAffineTransformMakeRotation(M_PI-newHeading.trueHeading*M_PI/180.0)];

}
@end
