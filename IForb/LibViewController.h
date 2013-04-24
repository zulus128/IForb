//
//  LibViewController.h
//  IForb
//
//  Created by Zul on 4/22/13.
//  Copyright (c) 2013 вадим. All rights reserved.
//

#import <UIKit/UIKit.h>

#define COLUMNS 3
#define X_INTERVAL 255
#define Y_INTERVAL 325

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
}

@property (nonatomic, retain) IBOutlet UIScrollView* sv;

@end
