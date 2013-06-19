//
//  TuringTeamCoolButton.m
//  PrettyButton
//
//  Created by Edward on 13-6-19.
//  Copyright (c) 2013年 LiHang. All rights reserved.
//

#import "TuringTeamCoolButton.h"
#import "TuringTeamCommon.h"
@implementation TuringTeamCoolButton
- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        self.opaque = NO;
        self.backgroundColor = [UIColor clearColor];
        _hue = 1.0;
        _saturation = 1.0;
        _brightness = 1.0;
    }
    return self;
}
//- (id)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        // Initialization code
//    }
//    return self;
//}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    //获取当前图形上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
//    //根据色彩，饱和度，亮度,透明度生成一个颜色对象
//    UIColor *color = [UIColor colorWithHue:self.hue saturation:self.saturation brightness:self.brightness alpha:1.0];
//    //用指定颜色在当前图形上下文中设置填充颜色
//    CGContextSetFillColorWithColor(context, color.CGColor);
//    //用当前图形上下文中的颜色填充指定的矩形
//    CGContextFillRect(context, self.bounds);
    UIColor *blackColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
    UIColor *highlightStart = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.4];
    UIColor *highlightStop = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.1];
    UIColor *shadowColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.5];
    
    UIColor *outerTop = [UIColor colorWithHue:self.hue saturation:self.saturation brightness:1.0*self.brightness alpha:1.0];
    UIColor *outerBottom = [UIColor colorWithHue:self.hue saturation:self.saturation brightness:0.80*self.brightness alpha:1.0];
    UIColor *innerStroke = [UIColor colorWithHue:self.hue saturation:self.saturation brightness:0.80*self.brightness alpha:1.0];
    UIColor *innerTop = [UIColor colorWithHue:self.hue saturation:self.saturation brightness:0.90*self.brightness alpha:1.0];
    UIColor *innerBottom = [UIColor colorWithHue:self.hue saturation:self.saturation brightness:0.70*self.brightness alpha:1.0];
    
    
    CGFloat outerMargin = 5.0f;
    //在原来的矩形内部挖出来一个边缘比原矩形小5像素的小矩形，5个像素的边缘后面绘制阴影
    CGRect outerRect = CGRectInset(self.bounds, outerMargin, outerMargin);
    //调用自定义的方法给矩形添加四个圆角,注意第二个参数，数越大圆角越大
    CGMutablePathRef outerPath = createRoundedRectForRect(outerRect, 6.0);
    
    if (self.state != UIControlStateHighlighted) {
        CGContextSaveGState(context);
        CGContextSetFillColorWithColor(context, outerTop.CGColor);
        CGContextSetShadowWithColor(context, CGSizeMake(0, 2), 3.0, shadowColor.CGColor);
        CGContextAddPath(context, outerPath);
        CGContextFillPath(context);
        CGContextRestoreGState(context);
    }
    
    CGContextSaveGState(context);
    CGContextAddPath(context, outerPath);
    CGContextClip(context);
    drawGlossAndGradient(context, outerRect, outerTop.CGColor, outerBottom.CGColor);
    CGContextRestoreGState(context);
    
}

- (void)setHue:(CGFloat)hue {
    _hue = hue;
    //重画整个矩形
    //This will force your view to redraw when the user changes the color of the button.
    [self setNeedsDisplay];
}
- (void)setSaturation:(CGFloat)saturation {
    _saturation = saturation;
    [self setNeedsDisplay];
}

- (void)setBrightness:(CGFloat)brightness {
    _brightness = brightness;
    [self setNeedsDisplay];
}
@end
