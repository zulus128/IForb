//
//  LibViewController.m
//  IForb
//
//  Created by Zul on 4/22/13.
//  Copyright (c) 2013 вадим. All rights reserved.
//

#import "LibViewController.h"

@interface LibViewController ()

@end

@implementation LibViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    NSString *appFile = [[NSBundle mainBundle] pathForResource:@"TitleList" ofType:@"plist"];
    titlelist = [[NSDictionary alloc] initWithContentsOfFile:appFile];

    float X = 30;
    float Y = 30;

    int maxY = 0;
    
    for(NSString* s in titlelist) {
        
        int t = [s substringFromIndex:4].intValue;
        int x = (t - 1) % COLUMNS;
        int y = (t - 1) / COLUMNS;
    
        if(y > maxY)
            maxY = y;
        
        NSArray* arr = (NSArray*)[titlelist objectForKey:s];
        int number = ((NSString*)[arr valueForKey:@"number"]).intValue;
        float price = ((NSString*)[arr valueForKey:@"price"]).floatValue;
        NSString* name = [NSString stringWithFormat:@"cover%03d.jpg", number];
        NSLog(@"str = %@", name);
        
        UIImageView *top = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 195, 19)];
        top.image = [UIImage imageNamed:@"cover_lib_top.png"];
        UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(0, 19, 195, 277)];
        img.image = [UIImage imageNamed:name];
        UIImageView *blue = [[UIImageView alloc] initWithFrame:CGRectMake(154, 1, 39, 15)];
        blue.image = [UIImage imageNamed:@"pad_library_price.png"];

        UIButton* but = [UIButton buttonWithType:UIButtonTypeCustom];
        [but addTarget:self action:@selector(butPressed:) forControlEvents:UIControlEventTouchUpInside];
        but.frame = CGRectMake(X + x * X_INTERVAL, Y + y * Y_INTERVAL, 195, 296);
        [but addSubview:top];
        [but addSubview:img];
        [but addSubview:blue];
        but.tag = number;
        [self.sv addSubview:but];
        
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(5, -5, 30, 30)];
        lbl.backgroundColor = [UIColor clearColor];
        lbl.font = [UIFont fontWithName:@"FreeSet" size:14];
        lbl.textColor = [UIColor whiteColor];
        lbl.text = [NSString stringWithFormat:@"%d", number];
        //        lbl.textAlignment = UITextAlignmentCenter;
        [but addSubview:lbl];
        
        UILabel *lbl_price = [[UILabel alloc] initWithFrame:CGRectMake(157, -6, 40, 30)];
        lbl_price.backgroundColor = [UIColor clearColor];
        lbl_price.font = [UIFont fontWithName:@"FreeSet" size:11];
        lbl_price.textColor = [UIColor whiteColor];
        lbl_price.text = [NSString stringWithFormat:@"$ %.2f", price];
        [but addSubview:lbl_price];
        

    }
    
    self.sv.contentSize = CGSizeMake(768, maxY * Y_INTERVAL);
}

-(void)butPressed:(id)sender {
    
    NSLog(@"%d selected", ((UIButton*)sender).tag);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
