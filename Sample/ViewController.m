//
//  ViewController.m
//  Sample
//
//  Created by kazuyuki takahashi on 06/02/13.
//  Copyright (c) 2013 kazuyuki takahashi. All rights reserved.
//

#import "ViewController.h"
#import "KonashiKit.h"

@interface ViewController ()
@property (strong, nonatomic) KNSDigitalOut *out;
@end


@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [[KNS sharedInstance] find:^{
        self.out = [[KNSDigitalOut alloc] initWithPin:kKNSPin_PIO1];
    }];
}

- (IBAction)high
{
    [self.out write:kKNSHigh];
}

- (IBAction)low
{
    [self.out write:kKNSLow];
}

@end