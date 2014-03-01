//
//  AMViewController.m
//  ScrollingNavbarDemo
//
//  Created by Andrea on 08/11/13.
//  Copyright (c) 2013 Andrea Mazzini. All rights reserved.
//

#import "AMViewController.h"

@interface AMViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation AMViewController

- (void)viewDidLoad
{
	// Remember to set the navigation bar to be NOT translucent
	[self.navigationBar setTranslucent:NO];
    [self setTitle:@"Demo"];
	
	if ([self.navigationBar respondsToSelector:@selector(setBarTintColor:)]) {
        [self.navigationBar setBarTintColor:UIColorFromRGB(0x184fa2)];
    }
	
    // For better behavior set statusbar style to opaque on iOS < 7.0
    if (([[[UIDevice currentDevice] systemVersion] compare:@"7.0" options:NSNumericSearch] == NSOrderedAscending)) {
// Silence depracation warnings
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackOpaque];
#pragma clang diagnostic pop
    }
	
	UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0, 60, 320, 40)];
	[label setText:@"My content"];
	[label setTextAlignment:NSTextAlignmentCenter];
	[label setFont:[UIFont fontWithName:@"Futura" size:24]];
	[label setTextColor:[UIColor whiteColor]];
	[label setBackgroundColor:[UIColor clearColor]];
	[self.scrollView addSubview:label];
	[self.view setBackgroundColor:UIColorFromRGB(0x08245d)];
	[self.scrollView setBackgroundColor:UIColorFromRGB(0x08245d)];
	
	// Let's fake some content
	[self.scrollView setContentSize:CGSizeMake(320, 840)];
	
	// Set the barTintColor (if available). This will determine the overlay that fades in and out upon scrolling.
    if ([self.navigationBar respondsToSelector:@selector(setBarTintColor:)]) {
        [self.navigationBar setBarTintColor:UIColorFromRGB(0x184fa2)];
    }
	
	// Just call this line to enable the scrolling navbar
	[self followScrollView:self.scrollView];
}

@end
