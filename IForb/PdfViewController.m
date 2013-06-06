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

//-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
//    if ([gestureRecognizer isKindOfClass:[UITapGestureRecognizer class]]) {
//    }
//    return YES;
//}

- (void) handleSingleTap : (UIGestureRecognizer*) sender {
    
    NSLog(@"single");
    [self menuPressed:nil];
    
}

- (void) handleDoubleTap : (UIGestureRecognizer*) sender {
    
    NSLog(@"double");
    
}

-(void) preload {
    
    NSLog(@"---preload");

    maxIndex = 124;//artlist.count - 1;

    cache = [[NSMutableDictionary alloc] init];
    cache1 = [[NSMutableDictionary alloc] init];
    
    
//    self.documents = [NSMutableArray array];
//    for (int i = 1; i <= maxIndex; i++) {
//        
//        [self.documents addObject:[NSString stringWithFormat:@"p-%03d.pdf", i]];
//    }
    
}

//-(NSInteger) numberOfPreviewItemsInPreviewController: (QLPreviewController *) controller {
//    
//    NSLog(@"numberOfPreviewItemsInPreviewController %d", [self.documents count]);
//
//    return [self.documents count];
//}
//
//- (id <QLPreviewItem>) previewController: (QLPreviewController *) controller previewItemAtIndex: (NSInteger) index {
//    
//    NSLog(@"previewController %@", [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:[self.documents objectAtIndex:index] ofType:nil]]);
//    
//    return [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:[self.documents objectAtIndex:index] ofType:nil]];
//}

//- (void)viewDidAppear:(BOOL)animated {
//    
//    QLPreviewController *preview = [[QLPreviewController alloc] init];
//    preview.dataSource = self;
//    preview.delegate = self;
//    //preview.currentPreviewItemIndex = 0;
//    [self presentViewController:preview animated:NO completion:nil];
//    
//    
//
//}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    NSLog(@"didLoad");
    
    UITapGestureRecognizer *doubleTapGestureRecognizer = [[UITapGestureRecognizer alloc]
                                                          initWithTarget:self action:@selector(handleDoubleTap:)];
    doubleTapGestureRecognizer.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:doubleTapGestureRecognizer];
    
    UITapGestureRecognizer *singleTapGestureRecognizer = [[UITapGestureRecognizer alloc]
                                                          initWithTarget:self action:@selector(handleSingleTap:)];
    singleTapGestureRecognizer.numberOfTapsRequired = 1;
    [singleTapGestureRecognizer requireGestureRecognizerToFail: doubleTapGestureRecognizer];
    [self.view addGestureRecognizer:singleTapGestureRecognizer];
    
    response = YES;
    
    NSString *appFile = [[NSBundle mainBundle] pathForResource:@"Details019" ofType:@"plist"];
    NSDictionary* artlist = [[NSDictionary alloc] initWithContentsOfFile:appFile];

    self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:@{UIPageViewControllerOptionInterPageSpacingKey:[NSNumber numberWithFloat: 0]}];

    self.pageViewController.delegate = self;
    
    NSArray *viewControllers = @[[[ArticleViewController alloc] initWithIndex:1 isVerical:YES]];
//    NSArray *viewControllers = @[[self getCacheVert:0]];
    self.curIndex = 0;
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:NULL];
    
    self.pageViewController.dataSource = self;
    
    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];
    
    self.pageViewController.view.frame = CGRectMake(13, 0, 742, 1004);

    
    sview = [[UIView alloc] initWithFrame:CGRectMake(0, -47, 768, 47)];
    [self.view addSubview:sview];
    topview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 47)];
    topview.image = [UIImage imageNamed:@"pad_title_h.png"];
    [sview addSubview:topview];
    
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
    //[sview addSubview:vmbut];
    
    title2 = [[UILabel alloc] initWithFrame:CGRectMake(270, 0, 580, 40)];
    title2.backgroundColor = [UIColor clearColor];
    title2.font = [UIFont fontWithName:@"FreeSet" size:13];
    title2.textColor = [UIColor whiteColor];
//    title2.text = [NSString stringWithFormat:@"Forbes Kazakhstan     %@", [Common instance].title];
    [sview addSubview:title2];
    
//    NSLog(@"title = %@", [Common instance].title);
    
    
    mbut = [UIButton buttonWithType:UIButtonTypeCustom];
    [mbut addTarget:self action:@selector(menuPressed:) forControlEvents:UIControlEventTouchUpInside];
//    UIImage *buttonImage = [UIImage imageNamed:@"button_price.png"];
//    [but setBackgroundImage:buttonImage forState:UIControlStateNormal];
    mbut.frame = CGRectMake(150, 200, 468, 605);
//    [self.view addSubview:mbut];
    

    horview = [[UIView alloc] initWithFrame:CGRectMake(-384, HOR_Y, 384, 965)];
    [self.view addSubview:horview];
    UIImageView* v1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 384, 965)];
    v1.image = [UIImage imageNamed:@"pad_vertical_back_v.png"];
    [horview addSubview:v1];
    
    int hor_height = 90;
    scrollVie = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 384, 965)];
    scrollVie.showsHorizontalScrollIndicator = NO;
    
    //    scrollView.delegate = self;
    [horview addSubview:scrollVie];
    
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
            but.tag = page;//u + 1;
            but.frame = CGRectMake(9, (hor_cnt - 1) * hor_height + 5, 380, 74);
            [scrollVie addSubview:but];
            
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
    
    scrollVie.contentSize = CGSizeMake(384, hor_height * hor_cnt);
    
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
//        NSString* rubric = ((NSString*)[d objectForKey:@"rubric"]);
//        NSString* article = ((NSString*)[d objectForKey:@"article"]);
        
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

-(void) menuToTop {

    [self.view bringSubviewToFront:mbut];
    [self.view bringSubviewToFront:sview];
    [self.view bringSubviewToFront:horview];
    [self.view bringSubviewToFront:vertview];

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
//    NSLog(@"%f", scrollView.contentOffset.x);
    int t = scrollView.contentOffset.x / vert_width;

    NSString *appFile = [[NSBundle mainBundle] pathForResource:@"Details019" ofType:@"plist"];
    NSDictionary* artlist = [[NSDictionary alloc] initWithContentsOfFile:appFile];

    NSDictionary* d = [artlist objectForKey:[NSString stringWithFormat:@"item%d", t+1]];
    NSString* rubric = ((NSString*)[d objectForKey:@"rubric"]);
    NSString* article = ((NSString*)[d objectForKey:@"article"]);
    
    lbltop.text = rubric;
    lbltop1.text = article;

}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {


    [self menuToTop];
}

-(void)horPressed:(id)sender {
    
//    [self clearCache];
    
    int index = ((UIButton*)sender).tag;// - 1;
    NSLog(@"horPressed %d", index);
    
    NSArray *viewControllers = nil;
    
    if(ISLAND) {
        
        
        if (index == 0 || index % 2 == 0) {

            UIViewController *previousViewController = [self getCacheHor:(index - 1)];
            viewControllers = @[previousViewController, [self getCacheHor:index]];
  
        }
        else {
            UIViewController *nextViewController = [self getCacheHor:(index + 1)];
            viewControllers = @[[self getCacheHor:index], nextViewController];
            
        }
        

    }
    else {

        viewControllers = @[[self getCacheVert:index]];
        
//        viewControllers = @[[[ArticleViewController alloc] initWithIndex:index isVerical:YES]];

//        viewControllers = @[[[ArticleViewController alloc] initWithIndex:index isVerical:YES]];
//        [self getCacheVert:index];
    }

    self.curIndex = index;

    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:NULL];

    
    [self hideMenuImmediate];

    [self menuToTop];
    
}

-(void)vertPressed:(id)sender {
    
    int index = ((UIButton*)sender).tag;
    NSLog(@"vertPressed %d", index);
    
//    NSArray *viewControllers = @[[arr objectAtIndex:index-1]];//@[startingViewController];
//    [self setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:NULL];
    
    [self hideMenuImmediate];
    [self menuToTop];
    
}

-(void)libPressed:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];

    LibViewController *yourViewController = (LibViewController *)[storyboard instantiateViewControllerWithIdentifier:@"LibViewController1"];
    yourViewController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:yourViewController animated:YES completion:nil];

}

-(void)braPressed:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    
    ViewController *yourViewController = (ViewController *)[storyboard instantiateViewControllerWithIdentifier:@"ViewController1"];
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
    
    title2.text = [NSString stringWithFormat:@"Forbes Kazakhstan     %@", [Common instance].title];

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
    
    [self showMenuHor];
}

-(void)hideMenu {
    
    [self hideMenuHor];
    
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
    
    [self menuToTop];

    [self hideMenuVert];
    
    [UIView animateWithDuration:0.35f delay:0.0 options:UIViewAnimationOptionCurveEaseIn
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

    [self menuToTop];

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
    
    if(index < (ISLAND?0:1))
        return nil;
    
    self.curIndex = index - 1;

    return UIInterfaceOrientationIsPortrait(self.interfaceOrientation)?[self getCacheVert:(index - 1)]:[self getCacheHor: (index - 1)];

}

-(ArticleViewController*) getCacheVert:(int) ind {
    
    NSLog(@"getCacheVert %d", ind);
    
    BOOL vert = YES;
    
    int min = ind - 3;
//    int min = ind;
    if(min < 0)
        min = 0;
    int max = ind + 3;
//    int max = ind;
    if(max > maxIndex)
        max = maxIndex;
    
//    self.view.frame = CGRectMake(0, 0, 768, 1005);
//    self.parentViewController.view.frame = CGRectMake(0, 0, 768, 1005);

    for (int i = min; i <= max; i++) {
        
        ArticleViewController* a1 = [cache objectForKey:[NSNumber numberWithInt:i]];
//        a1.view.hidden = YES;
        if(a1 != nil)
            continue;

        ArticleViewController* a = [[ArticleViewController alloc] initWithIndex:i isVerical:vert];
        UIPageViewController* pvViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl                                                                                 navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
        
        a.view.hidden = YES;
        NSArray *viewControllers1 = @[a];
        [pvViewController setViewControllers:viewControllers1 direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:NULL];
        pvViewController.view.hidden = YES;
        
        pvViewController.view.frame = CGRectMake(10000, 0, 768, 1004);
//        a.view.frame = CGRectMake(0, 0, 468, 1000);

        
//        CGRect t = a.view.frame;
//        CGRect t1 = pvViewController.view.frame;


        [self.pageViewController.view addSubview:pvViewController.view];
        
        
        [cache setObject:a forKey:[NSNumber numberWithInt:i]];
    }
    
    NSMutableArray* delarr = [[NSMutableArray alloc]init];
    for(NSNumber* n in cache) {

        if((n.intValue < min)||(n.intValue > max)) {

            [delarr addObject:n];
        
            ArticleViewController* contr = [cache objectForKey:n];
            [contr removeFromParentViewController];
            [contr.view removeFromSuperview];
            [contr.parentViewController.view removeFromSuperview];
        }

    }

//    NSLog(@"for deleting: %@", delarr);
    [cache removeObjectsForKeys:delarr];

    ArticleViewController* avc = [cache objectForKey:[NSNumber numberWithInt:ind]];

    [avc removeFromParentViewController];
    [avc.view removeFromSuperview];
    avc.view.hidden = NO;

//        CGRect t = avc.view.frame;
//    NSLog(@"frame w = %f, h = %f", t.size.width, t.size.height);

    return avc;
}

-(void) clearCache {

    NSMutableArray* delarr = [[NSMutableArray alloc]init];
    for(NSNumber* n in cache) {
        
        [delarr addObject:n];
        
        ArticleViewController* contr = [cache objectForKey:n];
        [contr removeFromParentViewController];
        [contr.view removeFromSuperview];
//        [contr.parentViewController.view removeFromSuperview];

    }
    
    [cache removeObjectsForKeys:delarr];

    NSMutableArray* delarr1 = [[NSMutableArray alloc]init];
    for(NSNumber* n in cache1) {
        
            [delarr1 addObject:n];
            
            ArticleViewController* contr = [cache1 objectForKey:n];
            [contr removeFromParentViewController];
            [contr.view removeFromSuperview];
//        [contr.parentViewController.view removeFromSuperview];

    }

    [cache1 removeObjectsForKeys:delarr1];

}

-(ArticleViewController*) getCacheHor:(int) ind {
    
    NSLog(@"getCacheHor %d", ind);

    BOOL vert = NO;
    int min = ind - 3;
    if(min < -1)
        min = -1;
    int max = ind + 3;
    if(max > maxIndex)
        max = maxIndex;
    
    for (int i = min; i <= max; i++) {
        
        ArticleViewController* a1 = [cache1 objectForKey:[NSNumber numberWithInt:i]];
//        a1.view.hidden = YES;

        if(a1 != nil)
            continue;
        
        ArticleViewController* a = [[ArticleViewController alloc] initWithIndex:i isVerical:vert];
        UIPageViewController* pvViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl                                                                                 navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
        
        a.view.hidden = YES;
        NSArray *viewControllers1 = @[a];
        [pvViewController setViewControllers:viewControllers1 direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:NULL];
        pvViewController.view.hidden = YES;
        pvViewController.view.frame = CGRectMake(10000, 0, 1024, 748);

        [self.pageViewController.view addSubview:pvViewController.view];
        
        [cache1 setObject:a forKey:[NSNumber numberWithInt:i]];
    }
    
    NSMutableArray* delarr = [[NSMutableArray alloc]init];
    for(NSNumber* n in cache1) {
        
        if((n.intValue < min)||(n.intValue > max)) {
            
            [delarr addObject:n];
            
            ArticleViewController* contr = [cache1 objectForKey:n];
            [contr removeFromParentViewController];
            [contr.view removeFromSuperview];
            [contr.parentViewController.view removeFromSuperview];

        }
        
    }
    
    //    NSLog(@"for deleting: %@", delarr);
    [cache1 removeObjectsForKeys:delarr];
    
    ArticleViewController* avc = [cache1 objectForKey:[NSNumber numberWithInt:ind]];
    [avc removeFromParentViewController];
    [avc.view removeFromSuperview];
    avc.view.hidden = NO;
//    avc.wview.scrollView.scrollEnabled = NO;

    
    
    return avc;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    int index = ((ArticleViewController*)viewController).articleIndex;
    
    NSLog(@"current index in after = %d", index);
    if(index >= maxIndex)
        return nil;

    self.curIndex = index + 1;

    return UIInterfaceOrientationIsPortrait(self.interfaceOrientation)?[self getCacheVert:(index + 1)]:[self getCacheHor: (index + 1)];

}

- (UIPageViewControllerSpineLocation)pageViewController:(UIPageViewController *)pageViewController spineLocationForInterfaceOrientation:(UIInterfaceOrientation)orientation {
    
    int index = self.curIndex;

    if (UIInterfaceOrientationIsPortrait(orientation)) {

//    NSLog(@"index from prev %d", index);

        NSArray *viewControllers = @[[self getCacheVert:index]];

        [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:NULL];

        [self menuToTop];

        title2.frame = CGRectMake(270, 0, 580, 40);
        scrollVie.frame = CGRectMake(0, 0, 384, 965);

        self.pageViewController.doubleSided = NO;
        return UIPageViewControllerSpineLocationMin;
    }
    
    
//    NSArray *viewControllers = nil;
//    NSLog(@"1index from prev %d", index);

//    if (index == 0 || index % 2 == 0) {
//        UIViewController *previousViewController = [self getCacheHor:(index - 1)];
//        viewControllers = @[previousViewController, [self getCacheHor:index]];
//    }
//    else {
//        UIViewController *nextViewController = [self getCacheHor:(index + 1)];
//        viewControllers = @[[self getCacheHor:index], nextViewController];
//        
//    }
//
//    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:NULL];
    
    NSArray *viewControllers = @[[self getCacheHor:index]];
    
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:NULL];

    [self menuToTop];

    title2.frame = CGRectMake(420, 0, 580, 40);
    scrollVie.frame = CGRectMake(0, 0, 384, 709);

    self.pageViewController.doubleSided = YES;

//    return UIPageViewControllerSpineLocationMid;
    return UIPageViewControllerSpineLocationMin;
}


//- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
//{
//    return YES;
//}

@end
