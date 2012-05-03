//
//  ViewController.m
//  ch11
//
//  Created by  on 4/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize btnSignIn;
@synthesize timerLabel;
@synthesize theTimer;
@synthesize textIntro;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    appDelegate.homeScreenVC = self;
}

- (void)viewDidUnload
{

    [self setTheTimer:nil];
    [self setTimerLabel:nil];
    [self setTextIntro:nil];
    [self setBtnSignIn:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self updateSignedUser];
}


- (IBAction)clickSignIn:(id)sender {
    // [self performSegueWithIdentifier:@"toLogin" sender:self];
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if (appDelegate.user_name) {
        [appDelegate.facebook logout];
        [defaults removeObjectForKey:@"SUUserName"];
        [defaults removeObjectForKey:@"FBAccessTokenKey"];
        [defaults removeObjectForKey:@"FBExpirationDateKey"];
        appDelegate.user_name = nil;
        [self updateSignedUser];
    } else {
        if ([defaults objectForKey:@"FBAccessTokenKey"] 
            && [defaults objectForKey:@"FBExpirationDateKey"]) {
            //appDelegate.facebook.accessToken = [defaults objectForKey:@"FBAccessTokenKey"];
            //appDelegate.facebook.expirationDate = [defaults objectForKey:@"FBExpirationDateKey"];
        }
        
        NSArray *permissions = [[NSArray alloc] initWithObjects:
                                @"user_about_me", @"user_birthday", @"user_location", @"email", @"friends_about_me", nil];
        
        if (![appDelegate.facebook isSessionValid]) {
            [appDelegate.facebook authorize:permissions];
        }
    }
}

- (void)updateSignedUser {
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    if (appDelegate.user_name) {
        textIntro.text = [NSString 
                          stringWithFormat:@"Hello, %@! You're signed in. Your scores will be recorded. Big brother watching you.", appDelegate.user_name];
        [btnSignIn setTitle:@"Logout" forState:UIControlStateNormal];
    } else {
        textIntro.text = @"Your task is to <blahblahblah>.  Good luck grasshopper. Sign in to save your score.";
        [btnSignIn setTitle:@"Sign In" forState:UIControlStateNormal];
    }
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
