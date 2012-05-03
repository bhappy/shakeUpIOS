//
//  AppDelegate.h
//  ch11
//
//  Created by  on 4/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FBConnect.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, FBSessionDelegate> {
    Facebook *facebook;
}

@property (nonatomic, retain) Facebook *facebook;
@property (strong, nonatomic) UIWindow *window;

@end
