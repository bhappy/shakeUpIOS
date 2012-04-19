//
//  ShakeViewController.m
//  ch11
//
//  Created by  on 4/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ShakeViewController.h"

@interface ShakeViewController ()

@end

@implementation ShakeViewController
@synthesize timerLabel;
@synthesize theTimer;

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
	// Do any additional setup after loading the view.
    count = 5;
    self.theTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDown:) userInfo:nil repeats:YES]; 
}

- (void)countDown:(id)sender {
    count--;
    //NSLog(@"count=%d", count);
    if(count==0)
    {
        [self.theTimer invalidate];
        [self setTheTimer:nil];
        [self performSegueWithIdentifier:@"toResults" sender:self];        
    } else {
        self.timerLabel.text = [NSString stringWithFormat:@"%d", count];
    }
}

- (void)viewDidUnload
{
    [self setTheTimer:nil];
    [self setTimerLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
