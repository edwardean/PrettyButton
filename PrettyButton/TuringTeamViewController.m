//
//  TuringTeamViewController.m
//  PrettyButton
//
//  Created by Edward on 13-6-19.
//  Copyright (c) 2013年 LiHang. All rights reserved.
//

#import "TuringTeamViewController.h"
#import "TuringTeamCoolButton.h"
@interface TuringTeamViewController ()

@end

@implementation TuringTeamViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)hueValueChanged:(id)sender
{
    UISlider *slider = (UISlider *)sender;
    self.coolButton.hue = slider.value;
}

- (IBAction)saturationValueChanged:(id)sender
{
    UISlider *slider = (UISlider *)sender;
    self.coolButton.saturation = slider.value;
}

- (IBAction)brightnessValueChanged:(id)sender
{
    UISlider *slider = (UISlider *)sender;
    self.coolButton.brightness = slider.value;
}

- (IBAction)gotoGitHub:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/edwardean/PrettyButton"]];
}
@end
