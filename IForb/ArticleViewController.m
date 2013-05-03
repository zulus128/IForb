//
//  ArticleViewController.m
//  IForb
//
//  Created by вадим on 4/26/13.
//  Copyright (c) 2013 вадим. All rights reserved.
//

#import "ArticleViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ArticleViewController ()

@end

@implementation ArticleViewController

- (id)initWithIndex:(int)index {
    
    self = [super init];
    if (self) {

        
        self.articleIndex = index;
        
        NSLog(@"articleIndex = %d", self.articleIndex);
        
//        wview = [[UIWebView alloc] initWithFrame:CGRectMake(-10, -10, 788, 1025)];
        wview = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 768, 1005)];
        
        wview.delegate = self;
        wview.scrollView.delegate = self;
        
        [self.view addSubview:wview];
        
//        self.view.userInteractionEnabled = YES;
//        [wview setUserInteractionEnabled:NO];
        [self hideShadows];

    
    }
    return self;
}

//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    
//    NSLog(@"scrollViewDidScroll");
//    [self hideShadows];
//
//}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(float)scale {


    NSLog(@"scrollViewDidEndZooming");
    [self hideShadows];

}

- (void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:animated];
    
    wview.scrollView.zoomScale = 1.0f;
//    wview.scrollView.zoomScale = 1.0f;
    [self hideShadows];

}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    [self hideShadows];
}

- (void) webViewDidFinishLoad:(UIWebView *)webView
{
    webView.backgroundColor = [UIColor whiteColor];
    webView.opaque = NO;
    
    
    wview.scrollView.zoomScale = 1.1f;
    [self performSelector:@selector(hideShadows) withObject:nil afterDelay:0.1f];
    
    [self hideShadows];


}

- (void) hideShadowInLayer:(CALayer *) layer
{
    for (CALayer *l in layer.sublayers) {
        l.shadowOpacity = 0;
        [self hideShadowInLayer:l];
    }
}

- (void) hideShadows
{
    [CATransaction begin];
    [CATransaction setValue:(id) kCFBooleanTrue forKey:kCATransactionDisableActions];
    [self hideShadowInLayer:wview.layer];
    [CATransaction commit];
}

- (void)viewDidLoad
{

    [super viewDidLoad];
	// Do any additional setup after loading the view.

    
    NSLog(@"Loading %d", self.articleIndex);
    
//    NSString *appFile = [[NSBundle mainBundle] pathForResource:@"Details019" ofType:@"plist"];
//    NSDictionary* artlist = [[NSDictionary alloc] initWithContentsOfFile:appFile];
//    NSDictionary* d = [artlist objectForKey:[NSString stringWithFormat:@"item%d", self.articleIndex + 1]];
//    int page = ((NSNumber*)[d valueForKey:@"page"]).intValue;
    
    NSString *path = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat: @"p-%03d", /*page*/self.articleIndex+1] ofType:@"pdf"];
    NSURL *targetURL = [NSURL fileURLWithPath:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:targetURL];
//    NSLog(@"Path = %@", path);
    [wview loadRequest:request];


    wview.userInteractionEnabled = YES;
    wview.multipleTouchEnabled = YES;
    
    wview.backgroundColor = [UIColor whiteColor];
    wview.opaque = NO;
    //        wview.alpha = 1;
    
    wview.scalesPageToFit = YES;
    wview.scrollView.bounces = NO;
    wview.scrollView.scrollEnabled = YES;
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
//    
//    UITouch *touch = [[touches allObjects] objectAtIndex:0];
//    CGPoint finger = [touch locationInView:self.view];
//    int x = finger.x;
//    int y = finger.y;
//    
//    NSLog(@"touch %d %d", x, y);
//}

@end
