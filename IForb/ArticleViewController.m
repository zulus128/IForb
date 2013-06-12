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

//        index = index + 1;
        
        self.articleIndex = index;
        bside = YES;
        if (index == 0 || index % 2 == 0)
            bside = NO;

        NSLog(@"articleIndex = %d", self.articleIndex);
        
        NSString *path;
        
        if (isVert) {
            self.wview = [[UIWebView alloc] initWithFrame:CGRectMake(-13, 0, 767, 1004)];
//            self.wview = [[UIWebView alloc] initWithFrame:CGRectMake(!bside?-13:-1536/2, 0, 1536, 1004)];
        path = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat: @"p-%03d", /*page*/self.articleIndex+1] ofType:@"pdf"];
        }
        else {
//            self.wview = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 512, 748)];//749
            self.wview = [[UIWebView alloc] initWithFrame:CGRectMake(-13, 0, 1024, 768)];//749
            
            NSArray* sp = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            NSString* docpath = [sp objectAtIndex: 0];

            int ind = self.articleIndex;
            if(bside)
                ind-=1;

            path = [docpath stringByAppendingPathComponent:[NSString stringWithFormat: @"%03d-%03d.pdf", ind, ind + 1]];

        }

        self.wview.delegate = self;
        self.wview.scrollView.delegate = self;
        
        [self hideShadows];

//        self.wview.backgroundColor = [UIColor whiteColor];

        
//        NSString *path = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat: @"p-%03d", /*page*/self.articleIndex+1] ofType:@"pdf"];
//        NSString *path = [[NSBundle mainBundle] pathForResource:@"03" ofType:@"pdf"];
        
//        int ind = self.articleIndex;
//        if(bside)
//            ind-=1;
//        
//        NSLog(@"Loading %03d-%03d.pdf", ind, ind+1);

//        NSString *path = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat: @"%03d-%03d", ind, ind + 1] ofType:@"pdf"];

        NSURL *targetURL = [NSURL fileURLWithPath:path];
        NSURLRequest *request = [NSURLRequest requestWithURL:targetURL];
        //    NSLog(@"Path = %@", path);
        [self.wview loadRequest:request];
        
        self.wview.userInteractionEnabled = YES;
        self.wview.multipleTouchEnabled = YES;
        
        self.wview.backgroundColor = [UIColor whiteColor];
        self.wview.opaque = NO;
        
        self.wview.scalesPageToFit = YES;
        self.wview.scrollView.bouncesZoom = NO;
        [self.wview.scrollView setBounces: NO];
//        self.wview.scrollView.scrollEnabled = YES;
        self.wview.scrollView.scrollEnabled = NO;
//        self.wview.hidden = YES;

//        self.view.clipsToBounds = YES;
        
    }
    return self;
}

- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view {
    
    NSLog(@"scrollViewWillBeginZooming %@", view);

    [scrollView setScrollEnabled:YES];
}


- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(float)scale
{
    
    NSLog(@"scrollViewDidEndZooming");

    [self hideShadows];

    if(scale == 1)
        [scrollView setScrollEnabled:NO];
}

-(void)stopScroll {
    
    self.wview.scrollView.scrollEnabled = NO;

}
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    
//    float z = scrollView.zoomScale;
//    NSLog(@"%f, %f, %f", scrollView.contentOffset.x, z, scrollView.contentSize.width);
//    
//}


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

//    self.wview.scrollView.minimumZoomScale = 3;

    [super viewDidAppear:animated];
    


    [self hideShadows];
}

- (void) webViewDidFinishLoad:(UIWebView *)webView
{
    
//    NSLog(@"webViewDidFinishLoad");

    [self.view addSubview:self.wview];

    webView.backgroundColor = [UIColor whiteColor];
    webView.opaque = NO;
    


    [self performSelector:@selector(hideShadows) withObject:nil afterDelay:0.05f];
    [self performSelector:@selector(hideShadows) withObject:nil afterDelay:0.2f];
    [self performSelector:@selector(hideShadows) withObject:nil afterDelay:0.6f];
    [self performSelector:@selector(hideShadows) withObject:nil afterDelay:1.6f];
    [self performSelector:@selector(hideShadows) withObject:nil afterDelay:2.6f];
    [self performSelector:@selector(hideShadows) withObject:nil afterDelay:5.2f];

    [self hideShadows];

    [webView.scrollView setScrollEnabled:NO];


//    webView.scrollView.maximumZoomScale = 3;
//    webView.scrollView.zoomScale = 3;

    
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
