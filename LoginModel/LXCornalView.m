//
//  LXCornalView.m
//  LoginModel
//
//  Created by Vincent Wang on 2017/8/10.
//  Copyright © 2017年 Subvin.inc. All rights reserved.
//

#import "LXCornalView.h"

@implementation LXCornalView
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextBeginPath(context);
    CGContextSetRGBStrokeColor(context, 1.0, 1.0, 1.0, 1.0f);
    CGContextSetRGBFillColor(context, 1.0, 1.0, 1.0, 1.0f);
    CGContextMoveToPoint(context, 0, 0);
    CGContextAddLineToPoint(context, 0, self.bounds.size.height);
    CGContextAddLineToPoint(context, self.bounds.size.width, self.bounds.size.height);
    CGContextAddLineToPoint(context, self.bounds.size.width, .0f);
    
    CGFloat bottomHeight = 45.0f;
    CGFloat radius = bottomHeight/2.0 + (1/(8.0f * bottomHeight)) * (self.bounds.size.width * self.bounds.size.width);
    
    CGFloat h2  = (radius - bottomHeight);
    CGFloat deep = (radius * radius)/(radius - bottomHeight);
    CGContextAddArcToPoint(context, self.bounds.size.width/2.0f , (deep - h2) , 0, 0, radius);
    
    CGContextFillPath(context);
    CGContextDrawPath(context, kCGPathFill);
    
}

@end
