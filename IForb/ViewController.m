//
//  ViewController.m
//  IForb
//
//  Created by вадим on 4/23/13.
//  Copyright (c) 2013 вадим. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "Common.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self.site loadRequest: [NSURLRequest requestWithURL: [NSURL URLWithString: @"http://www.forbes.kz"]
                                             cachePolicy: NSURLRequestReturnCacheDataElseLoad
                                         timeoutInterval: 10.0]];
    
    if([Common instance].first)
        return;
    
    [Common instance].first = YES;
    
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];

    if (!UIDeviceOrientationIsLandscape(self.interfaceOrientation)){


        UIViewController *screen = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController1"];
        [app.window setRootViewController:screen];
    }
    else {

        UIViewController *screen = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController2"];
        [app.window setRootViewController:screen];
        
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)bck:(id)sender {

    [self.site stopLoading];
    [self.site goBack];
}

-(IBAction)fwd:(id)sender {

    [self.site stopLoading];
    [self.site goForward];

}

-(IBAction)rfr:(id)sender {
    
    [self.site stopLoading];
    [self.site reload];
}

-(IBAction)lib:(id)sender {
    
}

//-(void) viewDidAppear:(BOOL)animated {
//
//    NSLog(@"didAppear");
//    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//
//    if (!UIDeviceOrientationIsLandscape(self.interfaceOrientation)){
//
//        
//        UIViewController *screen = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController1"];
//        [app.window setRootViewController:screen];
//    }
//    else {
//        
//        UIViewController *screen = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController2"];
//        [app.window setRootViewController:screen];
//        
//    }
//
//}

-(void)refreshButtons {
    
    [self.backbut setEnabled:self.site.canGoBack];
    [self.fwdbut setEnabled:self.site.canGoForward];

}

//- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
//    
//    NSLog(@"willRotate");
//    
//}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation{

    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];

    if (fromInterfaceOrientation == UIInterfaceOrientationLandscapeLeft || fromInterfaceOrientation == UIInterfaceOrientationLandscapeRight) {
    
    UIViewController *screen = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController1"];
    [app.window setRootViewController:screen];
    }
    else {
    
    UIViewController *screen = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController2"];
    [app.window setRootViewController:screen];
    
    }

}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)theRequest
 navigationType:(UIWebViewNavigationType)navigationType
{
	
    NSLog(@"shouldStartLoadWithRequest: %@", [theRequest URL]);
    
    if (navigationType == UIWebViewNavigationTypeLinkClicked) {
        NSLog(@"tapped: %@", [theRequest.URL absoluteString]);
	}
    
    [self refreshButtons];
    
    return YES; //YES - begin loading content
}

@end
