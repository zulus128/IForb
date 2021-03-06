//
//  Common.h
//  NozzleRush
//
//  Created by Abdul Jaleel Malik on 27/03/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "PdfViewController.h"

@interface Common : NSObject {
    
}

+ (Common*) instance;

@property (assign, readwrite) int numberSelected;
@property (nonatomic, retain) NSString* title;
@property (nonatomic, retain) PdfViewController *yourViewController;

@property (assign, readwrite) BOOL first;
@property (assign, readwrite) BOOL firstLib;
@property (assign, readwrite) BOOL firstPdf;

@property (assign, readwrite) BOOL previewHidden;
@property (nonatomic, retain) NSString* previewTitle1;
@property (nonatomic, retain) NSString* previewTitle2;
@property (nonatomic, retain) NSString* previewTitle3;

@end
