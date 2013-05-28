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
        b = YES;
        if (index == 0 || index % 2 == 0)
            b = NO;

        NSLog(@"articleIndex = %d", self.articleIndex);
        
        if (isVert) {
//            self.wview = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 767, 1004)];
            self.wview = [[UIWebView alloc] initWithFrame:CGRectMake(b?-13:-768, 0, 1536, 1004)];
        }
        else {
//            self.wview = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 512, 748)];//749
            self.wview = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];//749
        }

        self.wview.delegate = self;
        self.wview.scrollView.delegate = self;
        
        [self hideShadows];

//        self.wview.backgroundColor = [UIColor whiteColor];

        NSLog(@"Loading %d", self.articleIndex);
        
//        NSString *path = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat: @"p-%03d", /*page*/self.articleIndex+1] ofType:@"pdf"];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"03" ofType:@"pdf"];
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
//        self.wview.scrollView.scrollEnabled = NO;
//        self.wview.hidden = YES;

        self.view.clipsToBounds = YES;
        
//        self.wview.scrollView sc
        
    }
    return self;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    float z = scrollView.zoomScale;
    NSLog(@"%f, %f, %f", scrollView.contentOffset.x, z, scrollView.contentSize.width);
    
//    if(scrollView.contentOffset.x < 389 * z)
//        scrollView.contentOffset = CGPointMake(389 * z, scrollView.contentOffset.y);

}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(float)scale {

//    NSLog(@"scrollViewDidEndZooming");
    [self hideShadows];

//    [scrollView setContentSize:CGSizeMake(768.0 * scale, 1004.0 * scale)];
//    [scrollView setClipsToBounds:YES];

}

- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView {

    [self hideShadows];

    return YES;
}

- (void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:animated];
    
    self.wview.scrollView.zoomScale = 1.00f;//1.03f
    [self hideShadows];
    
    


}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    [self hideShadows];
}

- (void) webViewDidFinishLoad:(UIWebView *)webView
{
    
//    NSLog(@"webViewDidFinishLoad");

    [self.view addSubview:self.wview];

    webView.backgroundColor = [UIColor whiteColor];
    webView.opaque = NO;

//    [webView.scrollView setContentSize:CGSizeMake(768.0, 1004.0)];
//    [webView.scrollView setClipsToBounds:YES];
    
    [self performSelector:@selector(hideShadows) withObject:nil afterDelay:0.05f];
    [self performSelector:@selector(hideShadows) withObject:nil afterDelay:0.2f];
    [self performSelector:@selector(hideShadows) withObject:nil afterDelay:0.6f];
    [self performSelector:@selector(hideShadows) withObject:nil afterDelay:1.6f];
    [self performSelector:@selector(hideShadows) withObject:nil afterDelay:2.6f];
    [self performSelector:@selector(hideShadows) withObject:nil afterDelay:5.2f];

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
    [self hideShadowInLayer:self.wview.layer];
    [CATransaction commit];
}

- (void)viewDidLoad
{

    [super viewDidLoad];

    [self hideShadows];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
