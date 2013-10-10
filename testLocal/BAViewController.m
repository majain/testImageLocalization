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
    self.imgView.image = [[LocalizeHelper sharedLocalSystem] setImage:@"bg"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
