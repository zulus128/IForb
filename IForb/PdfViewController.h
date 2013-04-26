//
//  PdfViewController.h
//  IForb
//
//  Created by Zul on 4/25/13.
//  Copyright (c) 2013 вадим. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PdfViewController : UIPageViewController <UIPageViewControllerDataSource, UIPageViewControllerDelegate>

@property (strong, nonatomic) IBOutlet UIWebView *wView;

@end
