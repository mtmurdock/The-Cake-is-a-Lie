//
//  MMAppDelegate.m
//  TheCakeIsALie
//
//  Created by Matthew Murdock on 1/17/12.
//  Copyright (c) 2012 Matthew Murdock. All rights reserved.
//

#import "MMAppDelegate.h"

@implementation MMAppDelegate

@synthesize window = _window, label = _label;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    // read in plist of quotes.
    NSString* path = [[NSBundle mainBundle] pathForResource:@"quotes" ofType:@"plist"];
    NSDictionary* dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    _strings = (NSArray*)[dict objectForKey:@"Root"];
    
    // init label and add to window. 
    self.label = [[UILabel alloc] init];
    [self.label setFont:[UIFont systemFontOfSize:30]];
    [self.window addSubview:self.label];
    
    // set up repeating timer
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(backgroundTask:) userInfo:nil repeats:true];
    
    return YES;
}

- (void) backgroundTask:(id) sender
{
    // if is not visible, start the next animation.
    if (!CGRectIntersectsRect(self.window.bounds, self.label.frame)) {
        int index = arc4random() % _strings.count;
        [self.label setText:[_strings objectAtIndex:index]];
        // determine size of view
        CGSize textSize = [[self.label text] sizeWithFont:[self.label font]];
        // choose a random y value.
        int y = arc4random() % (int)(self.window.bounds.size.height - textSize.height);
        CGRect rect = CGRectMake(self.window.bounds.size.width, y, textSize.width, textSize.height);
        [self.label setFrame:rect];
    }
    
    //  move label to the left
    CGRect newRect = self.label.frame;
    newRect.origin.x -= 150;
    
    // animate the transformation
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    
    [self.label setFrame:newRect];
    
    [UIView commitAnimations];
}

- (void)dealloc
{
    [_window release];
    [_label release];
    [_strings release];
    [_timer release];
    [super dealloc];
}

@end
