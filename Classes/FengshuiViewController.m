//

#import "FengshuiViewController.h"
#import "FengshuiAppDelegate.h"

@implementation FengshuiViewController
@synthesize center;
@synthesize birthYear;
@synthesize direction;
@synthesize selector;
@synthesize detect;
@synthesize text;
@synthesize locman;
@synthesize custom;
@synthesize source;
@synthesize second;
@synthesize position;
@synthesize w;
@synthesize v;

UIButton *button;

- (CGRect)pickerFrameWithSize:(CGSize)size
{
	
	CGRect pickerRect = CGRectMake(	0.0, 0.0,320,216);
	return pickerRect;
}
-(void)finish_down:(id)sender
{

    custom.hidden = YES;
    button.hidden = YES;
}
- (void)createCustomPicker
{
    button = [[UIButton alloc] initWithFrame:CGRectMake(220, 215, 100, 30)];
    [button setBackgroundColor:[UIColor blackColor]];
    [button setTitle:@"完成" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(finish_down:) forControlEvents:UIControlEventTouchUpInside];
    button.hidden = false;
    
    
	custom = [[UIPickerView alloc] initWithFrame:[self pickerFrameWithSize:CGSizeZero]];
	custom.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
	
	// setup the data source and delegate for this picker
	source = [[CustomPickerDataSource alloc] init];
	[source setTt:self.direction];
	custom.dataSource = source;
	custom.delegate = source;
	CGSize pickerSize = CGSizeZero;
	custom.frame = [self pickerFrameWithSize:pickerSize];
	custom.showsSelectionIndicator = YES;
	// add this picker to our view controller, initially hidden
	custom.hidden = NO;
    
    
    [self.view addSubview:button];
	[self.view addSubview:custom];
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	if ( interfaceOrientation == UIInterfaceOrientationPortrait || interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown ) {
		return YES;
	}
	else {
		return NO;
	}
}
- (void)viewDidLoad
{

    [super viewDidLoad];
	direction.text = @"北";
}

- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading
{
    if ( newHeading.trueHeading < 0 )
        [self.center setTransform:CGAffineTransformMakeRotation(M_PI-newHeading.magneticHeading*M_PI/180.0)];
    else
        [self.center setTransform:CGAffineTransformMakeRotation(M_PI-newHeading.trueHeading*M_PI/180.0)];
  //  NSLog(@"%lf %lf", newHeading.trueHeading, newHeading.magneticHeading);
}

- (void)viewDidUnload
{
    [self setDetect:nil];
    [self setBirthYear:nil];
    [self setDirection:nil];
    [self setSelector:nil];
    [self setCenter:nil];
    [super viewDidUnload];

    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
    
	
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.locman = [[CLLocationManager alloc] init];	
    locman.delegate = self;
    if (locman.headingAvailable )
    {
        [locman startUpdatingHeading];
    }
	[w stopAnimating];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
    
}
/*
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}
*/
- (IBAction)enter_help:(id)sender {
    HelpViewController * sec = [[HelpViewController alloc] initWithNibName:@"HelpViewController" bundle:nil];
	[self presentModalViewController:sec animated:YES];
}
- (IBAction)send:(id)sender {
	[w startAnimating];
    FengshuiAppDelegate *delegate = (FengshuiAppDelegate *)[[UIApplication sharedApplication] delegate];
    int choice = 0;
    NSString *s = self.direction.text;
    
    if ( [s isEqualToString:@"北"] ) choice = 1;
    else if ( [s isEqualToString: @"东北"] ) choice = 2;
    else if ( [s isEqualToString: @"东"] ) choice = 3;
    else if ( [s isEqualToString: @"东南"] ) choice = 4;
    else if ( [s isEqualToString: @"南"] ) choice = 5;
    else if ( [s isEqualToString: @"西南"] ) choice = 6;
    else if ( [s isEqualToString: @"西"] ) choice = 7;
    else if ( [s isEqualToString: @"西北"] ) choice = 8;
	
    [delegate passValue:choice];
	SecondViewController * sec = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
	[self presentModalViewController:sec animated:YES];

}
- (IBAction)textFieldDoneEditing:(id)sender{
    [sender resignFirstResponder];
}

- (IBAction)chooseDirection:(id)sender {
    
  //  [self createCustomPicker];
    DirectChoose *choose = [[DirectChoose alloc] initWithNibName:@"DirectChoose" bundle:nil];
    [self presentModalViewController:choose animated:YES];
    choose.father = self;
}
- (IBAction)chooseBirthYear:(id)sender {

    BirthYear *choose = [[BirthYear alloc] initWithNibName:@"BirthYear" bundle:nil];
    [self presentModalViewController:choose animated:YES];
    choose.father = self;
}
- (IBAction)choosePosition:(id)sender {
    PositionChoose *choose = [[PositionChoose alloc] initWithNibName:@"PositionChoose" bundle:nil];
    [self presentModalViewController:choose animated:YES];
    choose.father = self;
}
-(void)dismiss:(id)inSender {
      [self.parentViewController dismissModalViewControllerAnimated:YES];
}
-(void)changeDirectionMethod:(NSString *)ns
{
    direction.text = ns;
}
-(void)changePositionMethod:(NSString *)ns
{
    position.text = ns;
}
-(void)changeYear:(NSString *)ns
{
    birthYear.text = ns;
}
@end

