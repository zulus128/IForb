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
        
        int number = ((NSString*)[titlelist objectForKey:s]).intValue;
        NSString* name = [NSString stringWithFormat:@"cover%03d.jpg", number];
        NSLog(@"str = %@", name);
        
        UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(X + x * X_INTERVAL, Y + y * Y_INTERVAL, 195, 277)];
        img.image = [UIImage imageNamed:name];
        [self.sv addSubview:img];

    }
    
    self.sv.contentSize = CGSizeMake(768, maxY * Y_INTERVAL);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
