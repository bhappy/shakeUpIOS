//
//  ResultsController.h
//  ch11
//
//  Created by  on 4/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultsController : UIViewController
@property(assign) int peaksCount;
@property (weak, nonatomic) IBOutlet UILabel *labelScore;

@end
