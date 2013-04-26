//
//  PdfViewController.m
//  IForb
//
//  Created by Zul on 4/25/13.
//  Copyright (c) 2013 вадим. All rights reserved.
//

#import "PdfViewController.h"
#import "ArticleViewController.h"

@interface PdfViewController ()
@property (readonly, strong, nonatomic) NSArray *pageData;

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
	// Do any additional setup after loading the view.
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    _pageData = [[dateFormatter monthSymbols] copy];
    
    ArticleViewController *startingViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ArticleViewController"];
    
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
    
    ArticleViewController *aViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ArticleViewController"];

    return aViewController;

}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    ArticleViewController *aViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ArticleViewController"];
    
    return aViewController;
}

@end
