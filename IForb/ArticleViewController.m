//
//  ArticleViewController.m
//  IForb
//
//  Created by вадим on 4/26/13.
//  Copyright (c) 2013 вадим. All rights reserved.
//

#import "ArticleViewController.h"

@interface ArticleViewController ()

@end

@implementation ArticleViewController

- (id)initWithIndex:(int)index {
    
    self = [super init];
    if (self) {

        
        self.articleIndex = index;
        
        NSLog(@"articleIndex = %d", self.articleIndex);
        
        NSString *appFile = [[NSBundle mainBundle] pathForResource:@"Details019" ofType:@"plist"];
        NSDictionary* artlist = [[NSDictionary alloc] initWithContentsOfFile:appFile];
        NSDictionary* d = [artlist objectForKey:[NSString stringWithFormat:@"item%d", self.articleIndex + 1]];
        int page = ((NSNumber*)[d valueForKey:@"page"]).intValue;
        
        wview = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 768, 1005)];

        NSString *path = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat: @"p-%03d", page] ofType:@"pdf"];
        NSURL *targetURL = [NSURL fileURLWithPath:path];
        NSURLRequest *request = [NSURLRequest requestWithURL:targetURL];
        [wview loadRequest:request];
        
        [self.view addSubview:wview];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
