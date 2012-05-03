//
//  AppDelegate.h
//  ch11
//
//  Created by  on 4/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FBConnect.h"
#import "ViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, FBSessionDelegate, FBRequestDelegate> {
    Facebook *facebook;
    NSString *user_name;
}

@property (nonatomic, retain) Facebook *facebook;
@property (nonatomic, retain) NSString *user_name;
@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) IBOutlet ViewController *homeScreenVC;

@end
