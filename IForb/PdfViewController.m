//
//  PdfViewController.m
//  IForb
//
//  Created by Zul on 4/25/13.
//  Copyright (c) 2013 вадим. All rights reserved.
//

#import "PdfViewController.h"
#import "LibViewController.h"
#import "ViewController.h"
#import "Common.h"

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
 
    maxIndex = 24;//artlist.count - 1;
    
    
    arr = [[NSMutableArray alloc]init];
    
    for (int i = 0; i <= maxIndex; i++) {
        [arr addObject:[[ArticleViewController alloc] initWithIndex:i]];
    }
//    NSDictionary *options =
//    [NSDictionary dictionaryWithObject:
//     [NSNumber numberWithInteger:UIPageViewControllerSpineLocationMin]
//                                forKey: UIPageViewControllerOptionSpineLocationKey];
//    UIPageViewController* pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl
//                                                              navigationOrientation:UIPageViewControllerNavigationOrientationVertical options:options];

    
//    ArticleViewController *startingViewController = [[ArticleViewController alloc] initWithIndex:0];
    
    NSArray *viewControllers = @[[arr objectAtIndex:0]];//@[startingViewController];
    [self setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:NULL];
    
    self.delegate = self;
    self.dataSource = self;

//    [[pageViewController view] setFrame:[[self view] bounds]];
//    [self.view addSubview:pageViewController.view];

    sview = [[UIView alloc] initWithFrame:CGRectMake(0, -47, 768, 47)];
    [self.view addSubview:sview];
    UIImageView* v = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 768, 47)];
    v.image = [UIImage imageNamed:@"pad_title_v.png"];
    [sview addSubview:v];
    
    UIButton* lbut = [UIButton buttonWithType:UIButtonTypeCustom];
    [lbut addTarget:self action:@selector(libPressed:) forControlEvents:UIControlEventTouchUpInside];
    UIImage *buttonImage = [UIImage imageNamed:@"button_library.png"];
    [lbut setBackgroundImage:buttonImage forState:UIControlStateNormal];
    lbut.frame = CGRectMake(11, 0, 40, 40);
    [sview addSubview:lbut];
    
    UIButton* bbut = [UIButton buttonWithType:UIButtonTypeCustom];
    [bbut addTarget:self action:@selector(braPressed:) forControlEvents:UIControlEventTouchUpInside];
    UIImage *buttonImage1 = [UIImage imageNamed:@"button_browser.png"];
    [bbut setBackgroundImage:buttonImage1 forState:UIControlStateNormal];
    bbut.frame = CGRectMake(51, 0, 40, 40);
    [sview addSubview:bbut];
    
    UIButton* hbut = [UIButton buttonWithType:UIButtonTypeCustom];
    [hbut addTarget:self action:@selector(hlpPressed:) forControlEvents:UIControlEventTouchUpInside];
    UIImage *buttonImage2 = [UIImage imageNamed:@"button_help.png"];
    [hbut setBackgroundImage:buttonImage2 forState:UIControlStateNormal];
    hbut.frame = CGRectMake(91, 0, 40, 40);
    [sview addSubview:hbut];
    
    UIButton* hmbut = [UIButton buttonWithType:UIButtonTypeCustom];
    [hmbut addTarget:self action:@selector(hmPressed:) forControlEvents:UIControlEventTouchUpInside];
    UIImage *buttonImage3 = [UIImage imageNamed:@"button_menu_v.png"];
    [hmbut setBackgroundImage:buttonImage3 forState:UIControlStateNormal];
    hmbut.frame = CGRectMake(131, 0, 40, 40);
    [sview addSubview:hmbut];
    
    UIButton* vmbut = [UIButton buttonWithType:UIButtonTypeCustom];
    [vmbut addTarget:self action:@selector(vmPressed:) forControlEvents:UIControlEventTouchUpInside];
    UIImage *buttonImage4 = [UIImage imageNamed:@"button_menu_h.png"];
    [vmbut setBackgroundImage:buttonImage4 forState:UIControlStateNormal];
    vmbut.frame = CGRectMake(171, 0, 40, 40);
    [sview addSubview:vmbut];
    
    UILabel* title2 = [[UILabel alloc] initWithFrame:CGRectMake(270, 0, 580, 40)];
    title2.backgroundColor = [UIColor clearColor];
    title2.font = [UIFont fontWithName:@"FreeSet" size:13];
    title2.textColor = [UIColor whiteColor];
    title2.text = [NSString stringWithFormat:@"Forbes Kazakhstan     %@", [Common instance].title];
    [sview addSubview:title2];
    
    
    UIButton* but = [UIButton buttonWithType:UIButtonTypeCustom];
    [but addTarget:self action:@selector(menuPressed:) forControlEvents:UIControlEventTouchUpInside];
//    UIImage *buttonImage = [UIImage imageNamed:@"button_price.png"];
//    [but setBackgroundImage:buttonImage forState:UIControlStateNormal];
    but.frame = CGRectMake(150, 200, 468, 605);
    [self.view addSubview:but];
    
    
}

-(void)libPressed:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];

    LibViewController *yourViewController = (LibViewController *)[storyboard instantiateViewControllerWithIdentifier:@"LibViewController"];
    yourViewController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:yourViewController animated:YES completion:nil];

}

-(void)braPressed:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    
    ViewController *yourViewController = (ViewController *)[storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    yourViewController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:yourViewController animated:YES completion:nil];
    
}

-(void)hlpPressed:(id)sender {
    
    NSLog(@"help");
    
}

-(void)hmPressed:(id)sender {
    
    NSLog(@"h menu");
    
}

-(void)vmPressed:(id)sender {
    
    NSLog(@"v menu");
    
}

-(void)menuPressed:(id)sender {
    
    NSLog(@"menu");
    
    if(!menuvisible) {
    
        [UIView animateWithDuration:0.35f delay:0.0 options:UIViewAnimationOptionCurveEaseIn
                     animations:^{ sview.frame = CGRectMake(0, 0, 768, 47); }
                     completion:^(BOOL finished) {
                     }];
    }
    else {
        
        [UIView animateWithDuration:0.35f delay:0.0 options:UIViewAnimationOptionCurveEaseIn
                         animations:^{ sview.frame = CGRectMake(0, -47, 768, 47); }
                         completion:^(BOOL finished) {
                         }];

    }
    
    menuvisible = !menuvisible;

}

- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray *)pendingViewControllers {
    
    [self hideMenuImmediate];

}

-(void)showMenu {

    [UIView animateWithDuration:0.35f delay:0.0 options:UIViewAnimationOptionCurveEaseIn
                     animations:^{ sview.frame = CGRectMake(0, 0, 768, 47); }
                     completion:^(BOOL finished) {
                         
                     }];
    
    menuvisible = YES;
}

-(void)hideMenu {
    
    [UIView animateWithDuration:0.35f delay:0.0 options:UIViewAnimationOptionCurveEaseIn
                     animations:^{ sview.frame = CGRectMake(0, -47, 768, 47); }
                     completion:^(BOOL finished) {
                         
                     }];
    
    menuvisible = NO;
    
}
-(void)hideMenuImmediate {
    
    sview.frame = CGRectMake(0, -47, 768, 47);    
    menuvisible = NO;
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    int index = ((ArticleViewController*)viewController).articleIndex;
    
    NSLog(@"current index in before= %d", index);
    
    if(index < 1)
        return nil;
    
 /*   ArticleViewController *aViewController = self.prev;
    
    if((index - 1) < 1) {
        
        self.prev = nil;
    }
    else {
        
//        prev = [self.storyboard instantiateViewControllerWithIdentifier:@"ArticleViewController"];
//        prev.articleIndex = (index - 2);
        self.prev = [[ArticleViewController alloc] initWithIndex:index - 2];
//        self.next = (ArticleViewController*)viewController;

    }

    self.next = [[ArticleViewController alloc] initWithIndex:index];
    
    return aViewController;
*/
//    return [[ArticleViewController alloc] initWithIndex:index - 1];
    
    return [arr objectAtIndex:(index - 1)];

}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    int index = ((ArticleViewController*)viewController).articleIndex;
    
    NSLog(@"current index in after = %d", index);

    if(index >= maxIndex)
        return nil;
 /*
    ArticleViewController *aViewController = self.next;
    
    if((index + 1) >= maxIndex) {
        
        self.next = nil;
    }
    else {
        
//        next = [self.storyboard instantiateViewControllerWithIdentifier:@"ArticleViewController"];
//        next.articleIndex = (index + 2);
        self.next = [[ArticleViewController alloc] initWithIndex:index + 2];
//        self.prev = (ArticleViewController*)viewController;

    }
    self.prev = [[ArticleViewController alloc] initWithIndex:index];
    
    return aViewController;
  */
//    return [[ArticleViewController alloc] initWithIndex:index + 1];
    return [arr objectAtIndex:(index + 1)];

}


@end
