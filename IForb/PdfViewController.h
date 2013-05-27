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

@interface PdfViewController : UIViewController <UIPageViewControllerDataSource, UIPageViewControllerDelegate, UIGestureRecognizerDelegate, UIScrollViewDelegate> {

    
    int maxIndex;
//    NSMutableArray* arr;
//    NSMutableArray* arr1;
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
    
//    UIPageViewController* pppViewController;
//    UIPageViewController* bbbViewController;
//    UIPageViewController* pppViewController1;
//    UIPageViewController* bbbViewController1;

    UIImageView* topview;
    UILabel* title2;
    UIScrollView* scrollVie;
    
    NSMutableDictionary* cache;
//    NSMutableDictionary* cache_p;
    NSMutableDictionary* cache1;
//    NSMutableDictionary* cache1_p;
}

@property (strong, nonatomic) UIPageViewController *pageViewController;
//@property (strong, nonatomic) ArticleViewController *currentViewController;
@property (assign, readwrite) int curIndex;

-(void) preload;

@end
