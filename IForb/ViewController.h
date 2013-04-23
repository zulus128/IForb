//
//  ViewController.h
//  IForb
//
//  Created by вадим on 4/23/13.
//  Copyright (c) 2013 вадим. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIWebViewDelegate>

@property (nonatomic, retain) IBOutlet UIWebView* site;
@property (nonatomic, retain) IBOutlet UIButton* backbut;
@property (nonatomic, retain) IBOutlet UIButton* fwdbut;
@property (nonatomic, retain) IBOutlet UIButton* refrbut;
@property (nonatomic, retain) IBOutlet UIButton* libbut;

-(IBAction)bck:(id)sender;
-(IBAction)fwd:(id)sender;
-(IBAction)rfr:(id)sender;
-(IBAction)lib:(id)sender;

@end
