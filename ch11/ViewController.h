//
//  ViewController.h
//  ch11
//
//  Created by  on 4/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    int count;
}

@property (strong, nonatomic) IBOutlet UILabel *timerLabel;
@property (strong, nonatomic) NSTimer *theTimer;
@property (weak, nonatomic) IBOutlet UITextView *textIntro;
- (IBAction)clickSignIn:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnSignIn;

- (void) updateSignedUser;

- (IBAction)pressReady:(id)sender;
- (void)countDown:(id)sender;
@end
