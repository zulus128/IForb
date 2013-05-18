//
//  LibViewController.h
//  IForb
//
//  Created by Zul on 4/22/13.
//  Copyright (c) 2013 вадим. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PdfViewController.h"

#define COLUMNS (UIDeviceOrientationIsLandscape(self.interfaceOrientation)?4:3)
#define ISLAND (UIDeviceOrientationIsLandscape(self.interfaceOrientation))

//#define COLUMNS4 4
#define X_INTERVAL 255
#define Y_INTERVAL 325
#define XX2 30
#define YY2 30

@interface LibViewController : UIViewController <UIScrollViewDelegate> {
    
    NSDictionary* titlelist;
    UIPageControl* pageCon;
    UIView* sview;
    UIScrollView *scrollView;
    BOOL pageControlBeingUsed;
    UILabel *title0;
    UILabel *title1;
    UILabel *title2;
    UIButton* pbut;
    UIImageView* black;
    
}

@property (nonatomic, retain) IBOutlet UIScrollView* sv;
@property (strong, nonatomic) UIPageViewController *pageViewController;

-(IBAction)back:(id)sender;

@end
