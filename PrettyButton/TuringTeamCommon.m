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