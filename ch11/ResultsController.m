//
//  ResultsController.m
//  ch11
//
//  Created by  on 4/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ResultsController.h"

@interface ResultsController ()

@end

@implementation ResultsController

@synthesize peaksCount;
@synthesize labelScore;
@synthesize ninjaImage;

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
    
    NSArray *hopAnimation;
    
    hopAnimation=[[NSArray alloc] initWithObjects:
                  [UIImage imageNamed:@"ninja01.gif"],
                  [UIImage imageNamed:@"ninja02.gif"],
                  [UIImage imageNamed:@"ninja03.gif"],
                  [UIImage imageNamed:@"ninja04.gif"],
                  [UIImage imageNamed:@"ninja05.gif"],
                  [UIImage imageNamed:@"ninja04.gif"],
                  [UIImage imageNamed:@"ninja03.gif"],
                  [UIImage imageNamed:@"ninja02.gif"],
                  [UIImage imageNamed:@"ninja01.gif"],
                  nil];
    
    self.ninjaImage.animationImages=hopAnimation;
    self.ninjaImage.animationDuration=1;


    [super viewDidLoad];
	// Do any additional setup after loading the view.

    [self.ninjaImage startAnimating];
    labelScore.text = [NSString stringWithFormat:@"Your Score: %d", peaksCount/2];
}

- (void)viewDidUnload
{
    [self setLabelScore:nil];
    [self setNinjaImage:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
