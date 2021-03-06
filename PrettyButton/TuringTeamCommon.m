//
//  TuringTeamCommon.m
//  PrettyButton
//
//  Created by Edward on 13-6-19.
//  Copyright (c) 2013年 LiHang. All rights reserved.
//

#import "TuringTeamCommon.h"

CGMutablePathRef createRoundedRectForRect(CGRect rect, CGFloat radius) {
    CGMutablePathRef path = CGPathCreateMutable();
    
    //起始点在矩形上边线中点
    CGPathMoveToPoint(path, NULL, CGRectGetMidX(rect), CGRectGetMinY(rect));
    
    //在矩形右上角添加一段弧度
    CGPathAddArcToPoint(path, NULL, CGRectGetMaxX(rect), CGRectGetMinY(rect), CGRectGetMaxX(rect), CGRectGetMaxY(rect), radius);
    
    //在矩形右下角添加一段弧度
    CGPathAddArcToPoint(path, NULL, CGRectGetMaxX(rect), CGRectGetMaxY(rect), CGRectGetMinX(rect),CGRectGetMaxY(rect), radius);
    
    //在矩形左下角添加一段弧度
    CGPathAddArcToPoint(path, NULL, CGRectGetMinX(rect), CGRectGetMaxY(rect), CGRectGetMinX(rect), CGRectGetMinY(rect), radius);
    
    //在矩形左上角添加一段弧度
    CGPathAddArcToPoint(path, NULL, CGRectGetMinX(rect), CGRectGetMinY(rect), CGRectGetMaxX(rect), CGRectGetMinY(rect), radius);
    
    //闭合路径,这样形成了一个圆角矩形
    CGPathCloseSubpath(path);

    
    return path;
}

//绘画渐变色
void drawLinearGradient(CGContextRef context,CGRect rect,CGColorRef startColor,CGColorRef endColor) {
    
    //Get a color space with which we'll draw the gradient
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat locations[] = {0.0, 1.0};
    NSArray *colors = @[(__bridge_transfer id)startColor,(__bridge_transfer id)endColor];
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge_retained CFArrayRef)colors, locations);
    
    
    //First calulate the start and end point for where you want to draw the gradient
    CGPoint startPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMinY(rect));
    CGPoint endPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMaxY(rect));
    
    CGContextSaveGState(context);
    CGContextAddRect(context, rect);
    CGContextClip(context);
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    
    //Well,remember that Core Grphics is a state machine, and once you've set something it stays that way until you change it back.
    CGContextRestoreGState(context);
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
}

CGRect rectFor1PxStroke(CGRect rect){
    return CGRectMake(rect.origin.x + 0.5, rect.origin.y+0.5, rect.size.width-1, rect.size.height-1);
}

void draw1PxStroke(CGContextRef context, CGPoint startPoint, CGPoint endPoint, CGColorRef color) {
    
    //At the begining and end of the function, we save/restore the context so we don't leave any changes we made around.
    CGContextSaveGState(context);
    
    //设置画笔笔帽
    CGContextSetLineCap(context, kCGLineCapSquare);
    
    //设置描边颜色
    CGContextSetStrokeColorWithColor(context, color);
    
    //设置线条宽度
    CGContextSetLineWidth(context, 1.0);
    
    //根据所给点开始一个新的子路径
    CGContextMoveToPoint(context, startPoint.x + 0.5, startPoint.y + 0.5);
    
    //根据所给点在当前点上追加一段直线段
    CGContextAddLineToPoint(context, endPoint.x + 0.5, endPoint.y + 0.5);
    
    //绘画描边路径
    CGContextStrokePath(context);
    
    CGContextRestoreGState(context);
}

//模仿玻璃效果遮罩
void drawGlossAndGradient(CGContextRef context, CGRect rect, CGColorRef startColor, CGColorRef endColor) {
    
    drawLinearGradient(context, rect, startColor, endColor);
    
    UIColor *glossColor1 = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.35];
    UIColor *glossColor2 = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.1];
    
    CGRect tophalf = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height / 2);
    drawLinearGradient(context, tophalf, glossColor1.CGColor, glossColor2.CGColor);
}

CGMutablePathRef createArcPathFromBottomOfRect(CGRect rect, CGFloat arcHeight) {
    CGRect arcRect = CGRectMake(rect.origin.x, rect.origin.y + rect.size.height - arcHeight, rect.size.width, arcHeight);
    
    CGFloat arcRadius = (arcRect.size.height/2) + (pow(arcRect.size.width, 2)/(8*arcRect.size.height));
    
    CGPoint arcCenter = CGPointMake(arcRect.origin.x + arcRect.size.width/2, arcRect.origin.y+arcRadius);
    
    CGFloat angle = acos(arcRect.size.width/(2*arcRadius));
    CGFloat startAngle = radians(180) + angle;
    CGFloat endAngle = radians(360) - angle;
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddArc(path, NULL, arcCenter.x, arcCenter.y, arcRadius, startAngle, endAngle, 0);
    CGPathAddLineToPoint(path, NULL, CGRectGetMaxX(rect), CGRectGetMinY(rect));
    CGPathAddLineToPoint(path, NULL, CGRectGetMinX(rect), CGRectGetMinY(rect));
    CGPathAddLineToPoint(path, NULL, CGRectGetMinX(rect), CGRectGetMaxY(rect));
    
    return path;
    
}