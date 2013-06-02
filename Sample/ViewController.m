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
@property (strong, nonatomic) IBOutlet UILabel *valueLabel;
@property (strong, nonatomic) KNSDigitalOut *out;
@property (strong, nonatomic) KNSDigitalIn *input;
@end


@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [[KNS sharedInstance] find:^{
        self.out = [[KNSDigitalOut alloc] initWithPin:kKNSPin_PIO1];
        self.input = [[KNSDigitalIn alloc] initWithPin:kKNSPin_PIO0];

        UILabel *label = self.valueLabel;
        [self.input addListener:^(KNSHighLow value) {
            label.text = (value == kKNSHigh) ? @"High" : @"Low";
        }];
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