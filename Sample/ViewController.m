//
//  ViewController.m
//  Sample
//
//  Created by kazuyuki takahashi on 06/02/13.
//  Copyright (c) 2013 kazuyuki takahashi. All rights reserved.
//

#import "ViewController.h"
#import "KonashiKit.h"
#import "KNSPWMLEDOut.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UILabel *valueLabel;
@property (strong, nonatomic) IBOutlet UIProgressView *progress;
@property (strong, nonatomic) IBOutlet UISlider *ledSlider;
@property (strong, nonatomic) KNSDigitalOut *out;
@property (strong, nonatomic) KNSDigitalIn *input;
@property (strong, nonatomic) KNSAnalogueIn *analogueIn;
@property (strong, nonatomic) KNSPWMLEDOut *pwmLedOut;
@end


@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.progress.progress = 0;

    [[KNS sharedInstance] find:^{
        //self.out = [[KNSDigitalOut alloc] initWithPin:kKNSPin_PIO1];
        self.pwmLedOut = [[KNSPWMLEDOut alloc] initWithPin:kKNSPin_PIO1];

        self.input = [[KNSDigitalIn alloc] initWithPin:kKNSPin_PIO0];

        UILabel *label = self.valueLabel;
        [self.input addListener:^(KNSHighLow value) {
            label.text = (value == kKNSHigh) ? @"High" : @"Low";
        }];

        self.analogueIn = [[KNSAnalogueIn alloc] initWithPin:kKNSPin_AIO2 requestInterval:0.1];
        UIProgressView *progress = self.progress;
        [self.analogueIn addListener:^(int value) {
            progress.progress = (float)value / [KNSAnalogueIn analogueReference];
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

- (IBAction)led
{
    [self.pwmLedOut setDutyRatio:(int)self.ledSlider.value];
}

@end