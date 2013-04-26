//
//  ArticleViewController.h
//  IForb
//
//  Created by вадим on 4/26/13.
//  Copyright (c) 2013 вадим. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArticleViewController : UIViewController {
    
    UIWebView* wview;
}

- (id)initWithIndex:(int)index;

//@property (strong, nonatomic) IBOutlet UIWebView *wView;
@property (assign, readwrite) int articleIndex;

@end
