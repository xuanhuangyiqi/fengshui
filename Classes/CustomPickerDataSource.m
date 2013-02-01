

#import "CustomPickerDataSource.h"
#import "CustomView.h"

@implementation CustomPickerDataSource

@synthesize customPickerArray;
@synthesize x;

- (id)init
{
	// use predetermined frame size
	self = [super init];
	if (self)
	{
		// create the data source for this custom picker
		NSMutableArray *viewArray = [[NSMutableArray alloc] init];

		CustomView *bei = [[CustomView alloc] initWithFrame:CGRectZero];
		bei.title = @"北";
		[viewArray addObject:bei];
		

		CustomView *dongbei = [[CustomView alloc] initWithFrame:CGRectZero];
		dongbei.title = @"东北";
		[viewArray addObject:dongbei];


		CustomView *dong = [[CustomView alloc] initWithFrame:CGRectZero];
		dong.title = @"东";
		[viewArray addObject:dong];
	

		CustomView *dongnan = [[CustomView alloc] initWithFrame:CGRectZero];
		dongnan.title = @"东南";
		[viewArray addObject:dongnan];
        
		CustomView *nan = [[CustomView alloc] initWithFrame:CGRectZero];
		nan.title = @"南";
		[viewArray addObject:nan];
		
        
		CustomView *xinan = [[CustomView alloc] initWithFrame:CGRectZero];
		xinan.title = @"西南";
		[viewArray addObject:xinan];
        
        
		CustomView *xi = [[CustomView alloc] initWithFrame:CGRectZero];
		xi.title = @"西";
		[viewArray addObject:xi];
        
        
		CustomView *xibei = [[CustomView alloc] initWithFrame:CGRectZero];
		xibei.title = @"西北";
		[viewArray addObject:xibei];
        
        


		self.customPickerArray = viewArray;
	
	}
	return self;
}



#pragma mark -
#pragma mark UIPickerViewDataSource

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
	return [CustomView viewWidth];
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
	return [CustomView viewHeight];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
	return [customPickerArray count];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 1;
}
- (void)setTt:(UITextField *)ttext
{
    self.x = ttext;
 //   NSLog(@"%s 123", ttext.text );
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger) component
{
    NSString *s = @"";
    if ( row == 0 ) s = @"北";
    else if ( row == 1 ) s = @"东北";
    else if ( row == 2 ) s = @"东";
    else if ( row == 3 ) s = @"东南";
    else if ( row == 4 ) s = @"南";
    else if ( row == 5 ) s = @"西南";
    else if ( row == 6 ) s = @"西";
    else if ( row == 7 ) s = @"西北";
//	NSLog( s );
   // x.text = s;
	[x setText:s];
    NSLog(@"hello %d", row);
	NSLog(@"%s 12", x.text);
    
}


#pragma mark -
#pragma mark UIPickerViewDelegate

// tell the picker which view to use for a given component and row, we have an array of views to show
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row
		  forComponent:(NSInteger)component reusingView:(UIView *)view
{
	return [customPickerArray objectAtIndex:row];
}

@end
