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
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    //Touch gestures below top bar should not make the page turn.
    //EDITED Check for only Tap here instead.
    if ([gestureRecognizer isKindOfClass:[UITapGestureRecognizer class]]) {
//        CGPoint touchPoint = [touch locationInView:self.view];
//        if (touchPoint.y > 40) {
//            return NO;
//        }
//        else if (touchPoint.x > 50 && touchPoint.x < 430) {//Let the buttons in the middle of the top bar receive the touch
//            return NO;
//        }
    }
    return response;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    for (UIGestureRecognizer *gR in self.view.gestureRecognizers) {
        gR.delegate = self;
    }
    
    response = YES;
    
    NSString *appFile = [[NSBundle mainBundle] pathForResource:@"Details019" ofType:@"plist"];
    NSDictionary* artlist = [[NSDictionary alloc] initWithContentsOfFile:appFile];

    maxIndex = artlist.count - 1;
    
    
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
    
    
    mbut = [UIButton buttonWithType:UIButtonTypeCustom];
    [mbut addTarget:self action:@selector(menuPressed:) forControlEvents:UIControlEventTouchUpInside];
//    UIImage *buttonImage = [UIImage imageNamed:@"button_price.png"];
//    [but setBackgroundImage:buttonImage forState:UIControlStateNormal];
    mbut.frame = CGRectMake(150, 200, 468, 605);
    [self.view addSubview:mbut];
    

    horview = [[UIView alloc] initWithFrame:CGRectMake(-384, HOR_Y, 384, 965)];
    [self.view addSubview:horview];
    UIImageView* v1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 384, 965)];
    v1.image = [UIImage imageNamed:@"pad_vertical_back_v.png"];
    [horview addSubview:v1];
    
    int hor_height = 90;
    UIScrollView* scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 384, 965)];
    //    scrollView.contentSize = CGSizeMake(384, 965);
    //    [scrollView setPagingEnabled:YES];
    scrollView.showsHorizontalScrollIndicator = NO;
    
    //    scrollView.delegate = self;
    [horview addSubview:scrollView];
    
    int hor_cnt = 0;
    
    for(int u = 0; u < artlist.count; u++) {
        
        NSDictionary* d = [artlist objectForKey:[NSString stringWithFormat:@"item%d", u + 1]];
        int vis = ((NSNumber*)[d valueForKey:@"visible"]).intValue;
        int page = ((NSNumber*)[d valueForKey:@"page"]).intValue;
        NSString* rubric = ((NSString*)[d objectForKey:@"rubric"]);
        NSString* article = ((NSString*)[d objectForKey:@"article"]);
        
        if(vis == 1) {
            
            hor_cnt++;
            
            UIButton* but = [UIButton buttonWithType:UIButtonTypeCustom];
            [but addTarget:self action:@selector(horPressed:) forControlEvents:UIControlEventTouchUpInside];
            but.tag = u + 1;
            but.frame = CGRectMake(9, (hor_cnt - 1) * hor_height + 5, 380, 74);
            [scrollView addSubview:but];
            
            UIImageView* v1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 74, 74)];
            v1.image = [UIImage imageNamed:[NSString stringWithFormat:@"ph-%03d.jpeg", page]];
            [but addSubview:v1];
            
            UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(100, 6, 270, 30)];
            lbl.backgroundColor = [UIColor clearColor];
            lbl.font = [UIFont fontWithName:@"FreeSet" size:12];
            lbl.textColor = [UIColor grayColor];
            lbl.text = rubric;
            [but addSubview:lbl];
            
            UILabel *lbl1 = [[UILabel alloc] initWithFrame:CGRectMake(100, 38, 270, 30)];
            lbl1.backgroundColor = [UIColor clearColor];
            lbl1.font = [UIFont fontWithName:@"FreeSet" size:12];
            lbl1.textColor = [UIColor whiteColor];
            lbl1.text = article;
            [but addSubview:lbl1];
        }
        
        
        
    }
    
    scrollView.contentSize = CGSizeMake(384, hor_height * hor_cnt);
    
    vertview = [[UIView alloc] initWithFrame:CGRectMake(-10000, HOR_Y, 768, 965)];
    vertview.alpha = 0;
    [self.view addSubview:vertview];
    UIImageView* vv1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 768, 965)];
    vv1.image = [UIImage imageNamed:@"pad_horizontal_back_v.png"];
    [vertview addSubview:vv1];
    
    NSDictionary* d = [artlist objectForKey:[NSString stringWithFormat:@"item%d", 1]];
    NSString* rubric = ((NSString*)[d objectForKey:@"rubric"]);
    NSString* article = ((NSString*)[d objectForKey:@"article"]);

    lbltop = [[UILabel alloc] initWithFrame:CGRectMake(40, 30, 670, 30)];
    lbltop.backgroundColor = [UIColor clearColor];
    lbltop.font = [UIFont fontWithName:@"FreeSet" size:12];
    lbltop.textColor = [UIColor grayColor];
    lbltop.text = rubric;
    [vertview addSubview:lbltop];
    
    lbltop1 = [[UILabel alloc] initWithFrame:CGRectMake(40, 60, 670, 30)];
    lbltop1.backgroundColor = [UIColor clearColor];
    lbltop1.font = [UIFont fontWithName:@"FreeSet" size:12];
    lbltop1.textColor = [UIColor whiteColor];
    lbltop1.text = article;
    [vertview addSubview:lbltop1];
    
    
//    UIScrollView* scrollView1 = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 160, 768, 965)];
    UIScrollView* scrollView1 = [[UIScrollView alloc] initWithFrame:CGRectMake(285, 160, vert_width, 965)];
    scrollView1.clipsToBounds = NO;
    scrollView1.pagingEnabled = YES;
    scrollView1.delegate = self;
    [vertview addSubview:scrollView1];
    
    int vert_cnt = 0;
    int center_x = 0;//285;
    
    for(int u = 0; u < artlist.count; u++) {
        
        NSDictionary* d = [artlist objectForKey:[NSString stringWithFormat:@"item%d", u + 1]];
        int vis = ((NSNumber*)[d valueForKey:@"visible"]).intValue;
        int page = ((NSNumber*)[d valueForKey:@"page"]).intValue;
        NSString* rubric = ((NSString*)[d objectForKey:@"rubric"]);
        NSString* article = ((NSString*)[d objectForKey:@"article"]);
        
        if(vis == 1) {
            
            vert_cnt++;
            
            UIButton* but = [UIButton buttonWithType:UIButtonTypeCustom];
            [but addTarget:self action:@selector(vertPressed:) forControlEvents:UIControlEventTouchUpInside];
            but.tag = u + 1;
            but.frame = CGRectMake(center_x + (vert_cnt - 1) * vert_width, 0, 198, 2000);
            [scrollView1 addSubview:but];
            
//            NSString* vname = [NSString stringWithFormat:@"pv-%03d.jpeg", page];
            NSString *vname = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"pv-%03d", page] ofType:@"jpeg"];

//            NSLog(@"vname = %@", vname);
            UIImage* im = [UIImage imageWithContentsOfFile:vname];
            UIImageView* v1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, im.size.width / 2, im.size.height / 2)];
            v1.image = im;
            [but addSubview:v1];
            
        }
        
        
        
    }
    
    scrollView1.contentSize = CGSizeMake(center_x + vert_cnt * vert_width, 768);
    

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    NSLog(@"%f", scrollView.contentOffset.x);
    int t = scrollView.contentOffset.x / vert_width;

    NSString *appFile = [[NSBundle mainBundle] pathForResource:@"Details019" ofType:@"plist"];
    NSDictionary* artlist = [[NSDictionary alloc] initWithContentsOfFile:appFile];

    NSDictionary* d = [artlist objectForKey:[NSString stringWithFormat:@"item%d", t+1]];
    NSString* rubric = ((NSString*)[d objectForKey:@"rubric"]);
    NSString* article = ((NSString*)[d objectForKey:@"article"]);
    
    lbltop.text = rubric;
    lbltop1.text = article;

}

-(void)horPressed:(id)sender {
    
    int index = ((UIButton*)sender).tag;
    NSLog(@"horPressed %d", index);
    
    NSArray *viewControllers = @[[arr objectAtIndex:index-1]];//@[startingViewController];
    [self setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:NULL];
    
    [self hideMenuImmediate];
    [self.view bringSubviewToFront:mbut];
    [self.view bringSubviewToFront:sview];
    [self.view bringSubviewToFront:horview];
    [self.view bringSubviewToFront:vertview];
    
}

-(void)vertPressed:(id)sender {
    
    int index = ((UIButton*)sender).tag;
    NSLog(@"vertPressed %d", index);
    
    NSArray *viewControllers = @[[arr objectAtIndex:index-1]];//@[startingViewController];
    [self setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:NULL];
    
    [self hideMenuImmediate];
    [self.view bringSubviewToFront:mbut];
    [self.view bringSubviewToFront:sview];
    [self.view bringSubviewToFront:horview];
    [self.view bringSubviewToFront:vertview];
    
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
    
    if(!horvisible) {
        
        [self showMenuHor];
    }
    else {
        
        [self hideMenuHor];
    }

    
}

-(void)vmPressed:(id)sender {
    
    NSLog(@"v menu");
    
    if(!vertvisible) {
        
        [self showMenuVert];
    }
    else {
        
        [self hideMenuVert];
    }
    
}

-(void)menuPressed:(id)sender {
    
    NSLog(@"menu");
    
    if(!menuvisible) {
    
        [self showMenu];
    }
    else {
        
        [self hideMenu];
    }
    
//    menuvisible = !menuvisible;

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
    horview.frame = CGRectMake(-384, HOR_Y, 384, 965);
    vertview.alpha = 0;
    vertview.frame = CGRectMake(-10000, HOR_Y, 768, 965);

    menuvisible = NO;
    horvisible = NO;
    vertvisible = NO;
    response = YES;

    
}

-(void)showMenuHor {
    
    [self hideMenuVert];
    
    [UIView animateWithDuration:0.35f delay:0.1 options:UIViewAnimationOptionCurveEaseIn
                     animations:^{ horview.frame = CGRectMake(0, HOR_Y, 384, 965); }
                     completion:^(BOOL finished) {
                         
                     }];
    
    horvisible = YES;
}

-(void)hideMenuHor {
    
    [UIView animateWithDuration:0.35f delay:0.0 options:UIViewAnimationOptionCurveEaseIn
                     animations:^{ horview.frame = CGRectMake(-384, HOR_Y, 384, 965); }
                     completion:^(BOOL finished) {
                         
                     }];
    
    horvisible = NO;
    
}

-(void)showMenuVert {

    [self hideMenuHor];
    
    vertview.frame = CGRectMake(0, HOR_Y, 768, 965);

    [UIView animateWithDuration:0.35f delay:0.1 options:UIViewAnimationOptionCurveEaseIn
                     animations:^{ vertview.alpha = 1; }
                     completion:^(BOOL finished) {
                         
                     }];
    
    vertvisible = YES;
    
    response = NO;
}

-(void)hideMenuVert {
    

    [UIView animateWithDuration:0.35f delay:0.0 options:UIViewAnimationOptionCurveEaseIn
                     animations:^{ vertview.alpha = 0; }
                     completion:^(BOOL finished) {
                         
                         vertview.frame = CGRectMake(-10000, HOR_Y, 768, 965);

                     }];
    
    vertvisible = NO;
    
    response = YES;

    
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
