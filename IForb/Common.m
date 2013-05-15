//
//  Common.m
//  NozzleRush
//
//  Created by Abdul Jaleel Malik on 27/03/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Common.h"

@implementation Common

+ (Common*) instance  {
	
	static Common* instance;
	
	@synchronized(self) {
		
		if(!instance) {
			
			instance = [[Common alloc] init];
            
            [instance init1];
            
		}
	}
	return instance;
}

- (void) init1 {
    
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];

    self.yourViewController = (PdfViewController *)[mainStoryboard instantiateViewControllerWithIdentifier:@"PdfViewController1"];
    [self.yourViewController preload];
    self.yourViewController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
}

- (id) init {
	
	self = [super init];
	if(self !=nil) {
        

        
    }
	return self;	
}

@end
