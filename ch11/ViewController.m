//
//  ViewController.m
//  ch11
//
//  Created by  on 4/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize timerLabel;
@synthesize theTimer;

- (void)viewDidLoad
{

    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

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
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}



- (IBAction)pressReady:(id)sender {  
    count = 3;
    self.theTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDown:) userInfo:nil repeats:YES]; 
}


/*- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"PrepareForSegue");

}*/

- (void)countDown:(id)sender {
    count--;
    //NSLog(@"count=%d", count);
    if(count==0)
    {
        [self.theTimer invalidate];
        [self setTheTimer:nil];
        [self performSegueWithIdentifier:@"toGame" sender:self];        
    } else {
        self.timerLabel.text = [NSString stringWithFormat:@"%d", count];
    }
}



@end
