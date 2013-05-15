//
//  LibViewController.m
//  IForb
//
//  Created by Zul on 4/22/13.
//  Copyright (c) 2013 вадим. All rights reserved.
//

#import "LibViewController.h"
#import "PdfViewController.h"
#import "AppDelegate.h"
#import "Common.h"

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
//        int x = (t - 1) % COLUMNS;
//        int y = (t - 1) / COLUMNS;

        int rows = titlelist.count / COLUMNS;
        int y = rows - (t - 1) / COLUMNS - 1;
        int x = (rows * COLUMNS - t) % COLUMNS;
    
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
        but.tag = number + (t << 16);
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
    
    sview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 768, 1005)];
    [self.view addSubview:sview];
    UIImageView* black = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 768, 1005)];
    black.image = [UIImage imageNamed:@"pad_shop_black_v.png"];
    sview.hidden = YES;
    [sview addSubview:black];
    UIImageView* back = [[UIImageView alloc] initWithFrame:CGRectMake(140.5, 103, 487, 799)];
    back.image = [UIImage imageNamed:@"pad_shop_back_v.png"];
    [sview addSubview:back];

    title0 = [[UILabel alloc] initWithFrame:CGRectMake(155, 112, 280, 20)];
    title0.backgroundColor = [UIColor clearColor];
    title0.font = [UIFont fontWithName:@"FreeSet" size:11];
    title0.textColor = [UIColor blueColor];
    title0.text = @"Forbes Kazakhstan";
    [sview addSubview:title0];
    
    title1 = [[UILabel alloc] initWithFrame:CGRectMake(155, 124, 280, 20)];
    title1.backgroundColor = [UIColor clearColor];
    title1.font = [UIFont fontWithName:@"FreeSet" size:11];
    title1.textColor = [UIColor blueColor];
    title1.text = @"";
    [sview addSubview:title1];
    
    title2 = [[UILabel alloc] initWithFrame:CGRectMake(155, 136, 280, 20)];
    title2.backgroundColor = [UIColor clearColor];
    title2.font = [UIFont fontWithName:@"FreeSet" size:11];
    title2.textColor = [UIColor blueColor];
    title2.text = @"Forbes Kazakhstan";
    [sview addSubview:title2];
    

    UIButton* cbut = [UIButton buttonWithType:UIButtonTypeCustom];
    [cbut addTarget:self action:@selector(cbutPressed) forControlEvents:UIControlEventTouchUpInside];
    UIImage *buttonImageNormal2 = [UIImage imageNamed:@"button_close.png"];
    [cbut setBackgroundImage:buttonImageNormal2 forState:UIControlStateNormal];
//    UIImage *buttonImageNormal21 = [UIImage imageNamed:@"button_close.png"];
//    [cbut setBackgroundImage:buttonImageNormal21 forState:UIControlStateHighlighted];
    cbut.frame = CGRectMake(124, 85, 34, 34);
    [sview addSubview:cbut];

    pbut = [UIButton buttonWithType:UIButtonTypeCustom];
    [pbut addTarget:self action:@selector(pbutPressed) forControlEvents:UIControlEventTouchUpInside];
    UIImage *buttonImage = [UIImage imageNamed:@"button_price.png"];
    [pbut setBackgroundImage:buttonImage forState:UIControlStateNormal];
    pbut.titleLabel.font = [UIFont fontWithName:@"FreeSet" size:13];
    pbut.frame = CGRectMake(530, 112, 85, 24);
    [sview addSubview:pbut];
    
    UIButton* pbut1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [pbut1 addTarget:self action:@selector(p1butPressed) forControlEvents:UIControlEventTouchUpInside];
    UIImage *buttonImage1 = [UIImage imageNamed:@"button_price.png"];
    [pbut1 setBackgroundImage:buttonImage1 forState:UIControlStateNormal];
    [pbut1 setTitle:@"Подписка" forState:UIControlStateNormal];
    pbut1.titleLabel.font = [UIFont fontWithName:@"FreeSet" size:13];
    pbut1.frame = CGRectMake(530, 138, 85, 24);
    [sview addSubview:pbut1];
    
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(140.5, 173, 483, 749)];
    scrollView.contentSize = CGSizeMake(483 * 3, 673);
    [scrollView setPagingEnabled:YES];
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.delegate = self;
    [sview addSubview:scrollView];
    
    UIImageView* pre1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 483, 673)];
    pre1.image = [UIImage imageNamed:@"cover019_pre1.jpeg"];
    UIImageView* pre2 = [[UIImageView alloc] initWithFrame:CGRectMake(483, 0, 483, 673)];
    pre2.image = [UIImage imageNamed:@"cover019_pre2.jpeg"];
    UIImageView* pre3 = [[UIImageView alloc] initWithFrame:CGRectMake(966, 0, 483, 673)];
    pre3.image = [UIImage imageNamed:@"cover019_pre3.jpeg"];
    
    [scrollView addSubview:pre1];
    [scrollView addSubview:pre2];
    [scrollView addSubview:pre3];

    pageCon = [[UIPageControl alloc] initWithFrame:CGRectMake(140.5, 852, 487, 50)];
    pageCon.numberOfPages = 3;
//    pageControl.imageCurrent = [UIImage imageNamed:@"selected1.png"];
//    pageControl.imageNormal = [UIImage imageNamed:@"unselected1.png"];
    [pageCon addTarget:self action:@selector(pageAction:) forControlEvents:UIControlEventValueChanged];
    [sview addSubview:pageCon];
    
    if([Common instance].firstLib)
        return;
    
    [Common instance].firstLib = YES;
    
//    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    if (!UIDeviceOrientationIsLandscape(self.interfaceOrientation)){
        
        
        UIViewController *screen = [self.storyboard instantiateViewControllerWithIdentifier:@"LibViewController1"];
//        [app.window setRootViewController:screen];
        [self presentViewController:screen animated:YES completion:nil];

    }
    else {
        
        UIViewController *screen = [self.storyboard instantiateViewControllerWithIdentifier:@"LibViewController2"];
//        [app.window setRootViewController:screen];
        [self presentViewController:screen animated:YES completion:nil];
        
    }

}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation{
    
//    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    if (fromInterfaceOrientation == UIInterfaceOrientationLandscapeLeft || fromInterfaceOrientation == UIInterfaceOrientationLandscapeRight) {
        
        UIViewController *screen = [self.storyboard instantiateViewControllerWithIdentifier:@"LibViewController1"];
        [self presentViewController:screen animated:NO completion:nil];
    }
    else {
        
        UIViewController *screen = [self.storyboard instantiateViewControllerWithIdentifier:@"LibViewController2"];
        [self presentViewController:screen animated:NO completion:nil];
        
    }
    
}

- (void)scrollViewDidScroll:(UIScrollView *)sender {

    if(pageControlBeingUsed)
        return;
    CGFloat pageWidth = sender.frame.size.width;
    int page = floor((sender.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    pageCon.currentPage = page;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    pageControlBeingUsed = NO;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    pageControlBeingUsed = NO;
}

-(IBAction)back:(id)sender {
    
//    [self dismissModalViewControllerAnimated:YES];
}

-(void)pageAction:(UIPageControl*)sender {
    
    CGRect frame;
    frame.origin.x = scrollView.frame.size.width * sender.currentPage;
    frame.origin.y = 0;
    frame.size = scrollView.frame.size;
    pageControlBeingUsed = YES;
    [scrollView scrollRectToVisible:frame animated:YES];
}

-(void)butPressed:(id)sender {
    
    int num = ((UIButton*)sender).tag & 0xFFFF;
    int cnt = ((UIButton*)sender).tag >> 16;
//    NSLog(@"%d selected %d %d", num, cnt, ((UIButton*)sender).tag);
    
    NSDictionary* arr = (NSDictionary*)[titlelist objectForKey:[NSString stringWithFormat:@"item%d", cnt]];
    NSString* tit1 = (NSString*)[arr objectForKey:@"title1"];
    NSString* tit2 = (NSString*)[arr objectForKey:@"title2"];
    float price = ((NSString*)[arr valueForKey:@"price"]).floatValue;

    [Common instance].title = tit1;
    
    title1.text = tit1;
    title2.text = tit2;
    
    [pbut setTitle:[NSString stringWithFormat:@"$ %.2f", price] forState:UIControlStateNormal];
    
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSNumber* n = [userDefaults valueForKey:[NSString stringWithFormat:@"number%03d", [Common instance].numberSelected]];
    
    if(n == nil) {
    
        sview.hidden = NO;
    }
    else {
    

    [Common instance].numberSelected = num;
        
//    PdfViewController *yourViewController = (PdfViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"PdfViewController"];
//    [yourViewController preload];
//    yourViewController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:[Common instance].yourViewController animated:YES completion:nil];
    }

}

-(void)cbutPressed {
    
    NSLog(@"close");
    sview.hidden = YES;
    pageCon.currentPage = 0;
    [self pageAction:pageCon];
}

-(void)pbutPressed {
    
    NSLog(@"InApp pressed");
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:[NSNumber numberWithBool:YES] forKey:[NSString stringWithFormat:@"number%03d", [Common instance].numberSelected]];
    [userDefaults synchronize];

}

-(void)p1butPressed {
    
    NSLog(@"Subscr pressed");
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:[NSNumber numberWithBool:YES] forKey:[NSString stringWithFormat:@"number%03d", [Common instance].numberSelected]];
    [userDefaults synchronize];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
