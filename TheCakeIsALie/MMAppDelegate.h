//
//  MMAppDelegate.h
//  TheCakeIsALie
//
//  Created by Matthew Murdock on 1/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MMAppDelegate : UIResponder <UIApplicationDelegate>
{
    UILabel* _label;
    NSArray* _strings;
    NSTimer* _timer;
}

@property (nonatomic, retain) UILabel* label;
@property (strong, nonatomic) UIWindow *window;

- (void) backgroundTask:(id)sender;

@end
