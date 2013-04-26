//
//  PdfViewController.m
//  IForb
//
//  Created by Zul on 4/25/13.
//  Copyright (c) 2013 вадим. All rights reserved.
//

#import "PdfViewController.h"

@interface PdfViewController ()

@end

@implementation PdfViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *appFile = [[NSBundle mainBundle] pathForResource:@"Details019" ofType:@"plist"];
    NSDictionary* artlist = [[NSDictionary alloc] initWithContentsOfFile:appFile];
 
    maxIndex = artlist.count - 1;
    
//    ArticleViewController *startingViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ArticleViewController"];
    ArticleViewController *startingViewController = [[ArticleViewController alloc] initWithIndex:0];
//    startingViewController.articleIndex = 0;

//    next = [self.storyboard instantiateViewControllerWithIdentifier:@"ArticleViewController"];
    next = [[ArticleViewController alloc] initWithIndex:1];
//    next.articleIndex = 1;
    prev = nil;
    
    NSArray *viewControllers = @[startingViewController];
    [self setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:NULL];
    
    self.delegate = self;
    self.dataSource = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    int index = ((ArticleViewController*)viewController).articleIndex;
    
    if(index < 1)
        return nil;
    
    ArticleViewController *aViewController = prev;
    
    if((index - 1) < 1) {
        
        prev = nil;
    }
    else {
        
//        prev = [self.storyboard instantiateViewControllerWithIdentifier:@"ArticleViewController"];
//        prev.articleIndex = (index - 2);
        prev = [[ArticleViewController alloc] initWithIndex:index - 2];
    }
    
    next = (ArticleViewController*)viewController;
    return aViewController;

}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    int index = ((ArticleViewController*)viewController).articleIndex;
    
    if(index >= maxIndex)
        return nil;
    
    ArticleViewController *aViewController = next;
    
    if((index + 1) >= maxIndex) {
        
        next = nil;
    }
    else {
        
//        next = [self.storyboard instantiateViewControllerWithIdentifier:@"ArticleViewController"];
//        next.articleIndex = (index + 2);
        next = [[ArticleViewController alloc] initWithIndex:index + 2];

    }
    
    prev = (ArticleViewController*)viewController;
    return aViewController;
}

@end
