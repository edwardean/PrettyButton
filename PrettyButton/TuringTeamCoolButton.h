//
//  TuringTeamCoolButton.h
//  PrettyButton
//
//  Created by Edward on 13-6-19.
//  Copyright (c) 2013年 LiHang. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^MyBlock)(void);
@interface TuringTeamCoolButton : UIButton {
    MyBlock _block;
    NSString *_myName;
}

@property (nonatomic, assign) CGFloat hue;          //色彩
@property (nonatomic, assign) CGFloat saturation;   //饱和度
@property (nonatomic, assign) CGFloat brightness;   //亮度
@property (nonatomic, strong) NSString *yourName;
@end
