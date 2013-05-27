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

@interface PdfViewController : UIViewController <UIPageViewControllerDataSource, UIPageViewControllerDelegate, UIGestureRecognizerDelegate, UIScrollViewDelegate, QLPreviewControllerDataSource, QLPreviewControllerDelegate> {

    int maxIndex;
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
    UIImageView* topview;
    UILabel* title2;
    UIScrollView* scrollVie;
    NSMutableDictionary* cache;
    NSMutableDictionary* cache1;
}

@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (assign, readwrite) int curIndex;

-(void) preload;

@property (nonatomic, retain) NSMutableArray *documents;
-(NSInteger) numberOfPreviewItemsInPreviewController: (QLPreviewController *) controller;
- (id <QLPreviewItem>) previewController: (QLPreviewController *) controller previewItemAtIndex: (NSInteger) index;

@end
