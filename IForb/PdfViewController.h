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

@interface PdfViewController : UIPageViewController <UIPageViewControllerDataSource, UIPageViewControllerDelegate> {

    
    int maxIndex;
    NSMutableArray* arr;
    UIView* sview;
    UIView* horview;
    UIView* vertview;
    BOOL menuvisible;
    BOOL horvisible;
    BOOL vertvisible;
    UIButton* mbut;
}
//@property(nonatomic, retain) ArticleViewController *next;
//@property(nonatomic, retain) ArticleViewController *prev;

@end
