//
//  ArticleViewController.h
//  IForb
//
//  Created by вадим on 4/26/13.
//  Copyright (c) 2013 вадим. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <QuickLook/QuickLook.h>

@interface ArticleViewController : UIViewController <UIWebViewDelegate, UIScrollViewDelegate> {
    
    BOOL b;
}

- (id)initWithIndex:(int)index isVerical:(BOOL)isVert;

//@property (strong, nonatomic) IBOutlet UIWebView *wView;
@property (assign, readwrite) int articleIndex;
@property (nonatomic, retain) UIWebView* wview;



@end
