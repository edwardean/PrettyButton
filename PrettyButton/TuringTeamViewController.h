//
//  TuringTeamViewController.h
//  PrettyButton
//
//  Created by Edward on 13-6-19.
//  Copyright (c) 2013年 LiHang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TuringTeamCoolButton;

@interface TuringTeamViewController : UIViewController

@property (nonatomic, strong) IBOutlet TuringTeamCoolButton *coolButton;

- (IBAction)hueValueChanged:(id)sender;
- (IBAction)saturationValueChanged:(id)sender;
- (IBAction)brightnessValueChanged:(id)sender;
- (IBAction)gotoGitHub:(id)sender;
@end
