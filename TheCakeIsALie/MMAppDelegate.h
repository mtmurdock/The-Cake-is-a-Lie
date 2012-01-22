//
//  MMAppDelegate.h
//  TheCakeIsALie
//
//  Created by Matthew Murdock on 1/17/12.
//  Copyright (c) 2012 Matthew Murdock. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MMAppDelegate : UIResponder <UIApplicationDelegate>
{
    UILabel* _label;
    NSArray* _strings;
    NSTimer* _timer;
}

/**
 label for displaying the quotes to the user */
@property (nonatomic, retain) UILabel* label;

/**
 main window */
@property (strong, nonatomic) UIWindow *window;

/**
 backgroundTask is used along with NSTimer to create a repeating
 event. This event controlls the animation of label and reseting it 
 when it goes off the screen */
- (void) backgroundTask:(id)sender;

@end
