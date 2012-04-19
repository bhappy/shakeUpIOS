//
//  ShakeViewController.h
//  ch11
//
//  Created by  on 4/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShakeViewController : UIViewController {
    int count;
}
@property (strong, nonatomic) IBOutlet UILabel *timerLabel;
@property (strong, nonatomic) NSTimer *theTimer;


- (void)countDown:(id)sender;

@end
