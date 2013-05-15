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

- (id)initWithIndex:(int)index  isVerical:(BOOL)isVert {
    
    self = [super init];
    if (self) {

        
        self.articleIndex = index;
        
        NSLog(@"articleIndex = %d", self.articleIndex);
        
//        CGRect f = self.view.frame;
        
        if (isVert)
            self.wview = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 768, 1005)];
        else
            self.wview = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 512, 749)];//749

//        self.wview = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, f.size.width, f.size.height)];
        
        self.wview.delegate = self;
        self.wview.scrollView.delegate = self;
        
//        [self.view addSubview:self.wview];
        
        [self hideShadows];

        self.wview.backgroundColor = [UIColor whiteColor];

        NSLog(@"Loading %d", self.articleIndex);
        
        NSString *path = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat: @"p-%03d", /*page*/self.articleIndex+1] ofType:@"pdf"];
        NSURL *targetURL = [NSURL fileURLWithPath:path];
        NSURLRequest *request = [NSURLRequest requestWithURL:targetURL];
        //    NSLog(@"Path = %@", path);
        [self.wview loadRequest:request];
        
        self.wview.userInteractionEnabled = YES;
        self.wview.multipleTouchEnabled = YES;
        
        self.wview.backgroundColor = [UIColor whiteColor];
        self.wview.opaque = NO;
        //        wview.alpha = 1;
        
        self.wview.scalesPageToFit = YES;
        self.wview.scrollView.bouncesZoom = NO;
        [self.wview.scrollView setBounces: NO];
        self.wview.scrollView.scrollEnabled = YES;
//        self.wview.hidden = YES;

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


//    NSLog(@"scrollViewDidEndZooming");
    [self hideShadows];

}

- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView {

    [self hideShadows];

    return YES;
}

- (void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:animated];
    
//    self.wview.frame = CGRectMake(0, 0, 768, 1005);
    self.wview.scrollView.zoomScale = 1.0f;
//    wview.scrollView.zoomScale = 1.0f;
    [self hideShadows];
    
    


}

//- (void)viewWillDisappear:(BOOL)animated {
//
//    [super viewWillDisappear:animated];
//    
//    self.wview.frame = CGRectMake(2000, 0, 768, 1005);
//    
//}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    [self hideShadows];
    
    [self.wview.scrollView setBounces: NO];
    self.wview.scrollView.scrollEnabled = YES;

}

- (void) webViewDidFinishLoad:(UIWebView *)webView
{
    
//    NSLog(@"webViewDidFinishLoad");

    [self.view addSubview:self.wview];

    webView.backgroundColor = [UIColor whiteColor];
    webView.opaque = NO;
    
    
    self.wview.scrollView.zoomScale = 1.0f;
    [self performSelector:@selector(hideShadows) withObject:nil afterDelay:0.2f];
    [self performSelector:@selector(hideShadows) withObject:nil afterDelay:0.6f];
    [self performSelector:@selector(hideShadows) withObject:nil afterDelay:1.6f];
    [self performSelector:@selector(hideShadows) withObject:nil afterDelay:2.6f];
    
    [self hideShadows];


}

//- (void)showWebView {
////    [window makeKeyAndVisible];
//    [self.wview setHidden:NO];
//}

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
    [self hideShadowInLayer:self.wview.layer];
    [CATransaction commit];
}

- (void)viewDidLoad
{

    [super viewDidLoad];
	// Do any additional setup after loading the view.

    


    
//    wview.autoresizingMask = UIViewAutoresizingNone;

    [self hideShadows];
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
