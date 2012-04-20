//
//  ShakeViewController.m
//  ch11
//
//  Created by  on 4/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ShakeViewController.h"

#define kUpdateFrequency	60.0

@interface ShakeViewController ()

@end

@implementation ShakeViewController
@synthesize timerLabel;
@synthesize theTimer;
@synthesize peaksCount;
@synthesize lastPeakX, lastPeakY, lastPeakZ;

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
    
    // setup accelerometer
    [[UIAccelerometer sharedAccelerometer] setUpdateInterval:1.0 / kUpdateFrequency];
	[[UIAccelerometer sharedAccelerometer] setDelegate:self];
    
    peaksCount = 0;
    lastPeakX = lastPeakY = lastPeakZ = 0.1;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ResultsController *resultsVC = segue.destinationViewController;
    resultsVC.peaksCount = peaksCount;
}

- (void)countDown:(id)sender {
    count--;
    if(count==0)
    {
        [self.theTimer invalidate];
        [self setTheTimer:nil];
        
        [self performSegueWithIdentifier:@"toResults" sender:self];
        
        [[UIAccelerometer sharedAccelerometer] setDelegate:nil];
        [super viewDidUnload];
    } else {
        self.timerLabel.text = [NSString stringWithFormat:@"%d", count];
    }
}

- (void)viewDidUnload
{
    [self setTheTimer:nil];
    [self setTimerLabel:nil];
    // Release any retained subviews of the main view.
}

// UIAccelerometerDelegate method, called when the device accelerates.
-(void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration
{
	// Update the accelerometer graph view
    if (fabs(acceleration.x) > 1.5) {
        if (acceleration.x * lastPeakX < 0) {
            lastPeakX = acceleration.x;
            peaksCount += 1;
        }
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}



@end
