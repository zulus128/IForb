//
//  PdfViewController.h
//  IForb
//
//  Created by Zul on 4/25/13.
//  Copyright (c) 2013 вадим. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ArticleViewController.h"

#define  HOR_Y 40
#define vert_width 208

@interface PdfViewController : UIPageViewController <UIPageViewControllerDataSource, UIPageViewControllerDelegate, UIGestureRecognizerDelegate, UIScrollViewDelegate> {

    
    int maxIndex;
    NSMutableArray* arr;
    NSMutableArray* arr1;
    UIView* sview;
    UIView* horview;
    UIView* vertview;
    BOOL menuvisible;
    BOOL horvisible;
    BOOL vertvisible;
    UIButton* mbut;
    BOOL response;
    
    UILabel *lbltop;
    UILabel *lbltop1;
    
    UIPageViewController* pppViewController;
    UIPageViewController* bbbViewController;
    UIPageViewController* pppViewController1;
    UIPageViewController* bbbViewController1;

}
//@property(nonatomic, retain) ArticleViewController *next;
//@property(nonatomic, retain) ArticleViewController *prev;
-(void) preload;
@end
