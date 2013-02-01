

#import "ThirdViewController.h"

@implementation ThirdViewController
@synthesize result;
@synthesize inc;
@synthesize title;
@synthesize description;
@synthesize rela;
@synthesize ns;
int wid;
int firstheight;
int resultSignal;
- (void) initResult:(int)num
{
    [result setBackgroundColor:[UIColor clearColor]];
   
    [result setCanCancelContentTouches:NO];
    result.clipsToBounds = YES;
    result.indicatorStyle = UIScrollViewIndicatorStyleBlack;

   // [result setBackgroundColor:[UIColor blackColor]];
}
- (void)makeConnect:(int)type{
        FengshuiAppDelegate *delegate = (FengshuiAppDelegate *)[[UIApplication sharedApplication] delegate];
    int value = [delegate showValue];
    wid = value;
    NSLog(@"%d", value);
    responseData = [NSMutableData data];
    NSString *astring = [[NSString alloc] initWithString:[NSString stringWithFormat:@"http://www.yucezhijia.com/fengshui/more.php?id=%d&type=%d", value, type]];

    NSString *url = [NSString stringWithFormat:astring];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    //[[NSURLConnection alloc] initWithRequest:request delegate:self];
    responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    if (responseData != nil )
    {
    }
    
}
- (void)viewDidLoad{
	 
    resultSignal = 0;
    [super viewDidLoad];
    [self makeConnect:0];

}
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [responseData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [responseData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
  
}
- (NSString *)delspace:(NSString *) str
{
    
    NSString *trimStr = [str stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    trimStr = [trimStr stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    trimStr = [trimStr stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    return trimStr;
}
//- (void)connectionDidFinishLoading:(NSURLConnection *)connection

- (void) receive
{
    NSString *responseString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    
    if (resultSignal == 1)
    {
        UILabel *xiangguan = [[UILabel alloc] initWithFrame:CGRectMake(10, firstheight+20, 100, 20)];
        [xiangguan setBackgroundColor:[UIColor clearColor]];
        NSString *sstr = [[NSString alloc] initWithFormat:@"相关物品:" ];
        [xiangguan setText:sstr];
        UIFont *t_font = [UIFont fontWithName:@"Arial" size:14];
        [xiangguan setFont:t_font];
        [result addSubview:xiangguan];
    
        
        
        NSArray *items = [responseString JSONValue];
        int num = [items count];
        [self initResult:num];
 
        

        NSDictionary *x;
        int i = 0, xx = -firstheight, yy = 30;
        UIFont *font = [UIFont fontWithName:@"Arial" size:13];
        self.ns=[NSMutableArray arrayWithCapacity:100];
        for ( x in items )
        {
         
            i += 1;
            NSURL *url = [NSURL URLWithString:[x objectForKey:@"pic"]];
            NSData *data = [NSData dataWithContentsOfURL:url];
            UIImage *image = [[UIImage alloc] initWithData:data];
            UIButton *imgButton = [[UIButton alloc] initWithFrame:CGRectMake(50-yy, 150*i-100-xx, 100, 100)];                        
            [imgButton setImage:image forState:UIControlStateNormal];
        
            NSString *u = [x objectForKey:@"xiangxilianjie"];
            [self.ns addObject:u];
            NSLog(@"%d", [self.ns count]);
            [imgButton setTag:i-1];
            [imgButton addTarget:self action:@selector(enterUrl:) forControlEvents:UIControlEventTouchDown];
        
            [result addSubview:imgButton];
                      
            NSString *pic_name = [x objectForKey:@"pic_title"];
            CGSize size = CGSizeMake(MAXFLOAT ,15);
            CGSize labelsize = [pic_name sizeWithFont:font constrainedToSize:size lineBreakMode:UILineBreakModeCharacterWrap];
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(70-yy, i*150-xx+5, labelsize.width , labelsize.height)];
            label.text = [x objectForKey:@"pic_title"];
            [label setBackgroundColor:[UIColor clearColor]];
            [label setFont:font];
            [label setCenter:CGPointMake(100-yy, i*150-xx+5+10)];
            [result addSubview:label];
            
                
            UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(160-yy, i*150-100-xx, 70, 20)];
            label2.text = @"旺度";
            [label2 setFont:font];
            label2.backgroundColor = [UIColor clearColor];
            [result addSubview:label2];
            
            UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(160-yy, i*150-60-xx, 70, 20)];
            label3.text = @"描述:";
            [label3 setFont:font];
            label3.backgroundColor = [UIColor clearColor];
         //   [result addSubview:label3];
   
            UILabel *label4 = [[UILabel alloc] initWithFrame:CGRectMake(160-yy, i*150-85-xx, 170, 35)];
            label4.text = [self delspace:[x objectForKey:@"pic_miaoshu"]];
            label4.backgroundColor = [UIColor clearColor];
            [label4 setNumberOfLines:0]; 
            [label4 setFont:font];
            label4.lineBreakMode = UILineBreakModeWordWrap;   
            [result addSubview:label4];

 
            
            NSString *trimStr = [[x objectForKey:@"pic_jieshao"] stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
            //   trimStr = [trimStr stringByReplacingOccurrencesOfString:@"\r" withString:@""];
            //trimStr = [trimStr stringByReplacingOccurrencesOfString:@"\n" withString:@""];     
            
            CGSize t_size = CGSizeMake(170,MAXFLOAT);
            
            CGSize t_labelsize = [trimStr sizeWithFont:font constrainedToSize:t_size lineBreakMode:UILineBreakModeCharacterWrap];        
            NSLog(@"hegiht: %lf", t_labelsize.height);
            UILabel *label5 = [[UILabel alloc] initWithFrame:CGRectMake(160-yy, i*150-55-xx, 170, t_labelsize.height)];
            label5.text = [x objectForKey:@"pic_jieshao"];
            [label5 setNumberOfLines:0]; 
            label5.lineBreakMode = UILineBreakModeWordWrap;   
            [label5 setFont:font];
            label5.backgroundColor = [UIColor clearColor];
            [result addSubview:label5];
            
            int zhishu;
            [[NSScanner scannerWithString:[x objectForKey:@"zhishu"]] scanHexInt:&zhishu];
            
         
            
                for (int k = 0; k < zhishu; ++k )
                {
                    UIImageView *starView = [[UIImageView alloc] initWithImage:
                                             [UIImage imageNamed:@"third_star.png"]
                                             ];
                    starView.frame = CGRectMake(200+k*22-yy, i*150-100-xx, 12, 12);
                    [result addSubview:starView];
                }
            
            
        }
        [inc stopAnimating];
        [result setContentSize:CGSizeMake(300, 150*num+50+firstheight)];
    }
    else
    {
        resultSignal = 1;
        NSDictionary *items = [responseString JSONValue];
        [title setText:[items objectForKey:@"class_name"]];
        
        NSString *trimStr = [items objectForKey:@"jieshao"];
       //   trimStr = [trimStr stringByReplacingOccurrencesOfString:@"\r" withString:@""];
        //trimStr = [trimStr stringByReplacingOccurrencesOfString:@"\n" withString:@""];     

        
        UIFont *font = [UIFont fontWithName:@"Arial" size:14];
        CGSize size = CGSizeMake(310,MAXFLOAT);
        
        CGSize labelsize = [trimStr sizeWithFont:font constrainedToSize:size lineBreakMode:UILineBreakModeCharacterWrap];
        description = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, labelsize.width, labelsize.height)];

        [description setLineBreakMode:UILineBreakModeCharacterWrap];
        [description setBackgroundColor:[UIColor clearColor]];
        [description setText:trimStr];
        [description setFont:font];
        description.numberOfLines = 0;
        [result addSubview:description];
        firstheight = description.frame.size.height;
        firstheight += 10;

        
        [result setScrollEnabled:YES];
        [self makeConnect:1];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (void)viewDidUnload {
    [self setTitle:nil];
    [self setResult:nil];
    [self setDescription:nil];
    [self setInc:nil];
    [super viewDidUnload];

}

-(IBAction)enterUrl1{
	NSString *url = @"http://www.yucezhijia.com/fengshui/user/message.asp";
    WebViewController *web = [[WebViewController alloc] initWithNibName:@"WebViewController" bundle:nil];
	web.uu = url;
    [self presentModalViewController:web animated:YES];
     }
-(IBAction)enterUrl:(id)sender{
    int tid = [sender tag];
    NSString *url = [self.ns objectAtIndex:tid];
  //  FengshuiAppDelegate *delegate = (FengshuiAppDelegate *)[[UIApplication sharedApplication] delegate];
//	NSString *uurl = @"http://www.yucezhijia.com/fengshui/user/message.asp";
    WebViewController *web = [[WebViewController alloc] initWithNibName:@"WebViewController" bundle:nil];
	web.uu = url;
    [self presentModalViewController:web animated:YES];

 }             
-(IBAction)enterUrl2{
	NSString *url = [[NSString alloc] initWithFormat: @"http://www.yucezhijia.com/fengshui/shop/shop.asp?id=%d", wid];
    WebViewController *web = [[WebViewController alloc] initWithNibName:@"WebViewController" bundle:nil];
	web.uu = url;
    [self presentModalViewController:web animated:YES];
}
- (IBAction)return_back:(id)sender {
	
    [self dismissModalViewControllerAnimated:YES];
}
@end
