//
//  PEViewController.m
//  PEActivityIndicator
//
//  Created by Pavel_Evsaev on 06/23/2016.
//  Copyright (c) 2016 Pavel_Evsaev. All rights reserved.
//

#import "PEViewController.h"
#import <PEActivityIndicator/PEActivityIndicatorView.h>

@interface PEViewController ()

@property (strong, nonatomic, readwrite) PEActivityIndicatorView *indicator;

@end

@implementation PEViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.indicator = [PEActivityIndicatorView new];
    self.indicator.center = self.view.center;
    [self.view addSubview:self.indicator];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.indicator startAnimating];
}

@end
