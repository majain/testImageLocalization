//
//  BAViewController.m
//  testLocal
//
//  Created by Mohit Jain on 10/9/13.
//  Copyright (c) 2013 Balluun. All rights reserved.
//

#import "BAViewController.h"

@interface BAViewController ()

@end

@implementation BAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
   // self.imgView.image = [UIImage imageNamed:LocalizedString(@"image")];
	// Do any additional setup after loading the view, typically from a nib.
    NSBundle *myBundle = LocalizationSetLanguage(@"en");

 //   self.imgView.image =  [UIImage imageWithContentsOfFile:[myBundle pathForResource:@"IMG" ofType:@"png"]];
    self.imgView.image = [[LocalizeHelper sharedLocalSystem] setImageFromBundle:myBundle imageNameIs:@"bg"];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
