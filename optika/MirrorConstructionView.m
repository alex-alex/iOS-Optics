//
//  MirrorConstructionView.m
//  optika
//
//  Created by Alex Studnicka on 22/03/14.
//  Copyright (c) 2014 Alex Studnicka. All rights reserved.
//

#import "MirrorConstructionView.h"

@implementation MirrorConstructionView {
	int _mirrorType;
	float _f;
	float _a;
	float _y;
}

- (void)drawRect:(CGRect)rect {
	
	float f = _f;
	float a = _a;
	float y = _y;

	float a2;
	float Z;
	
	if (_mirrorType == 0) {
		a2 = a;
		Z = 1;
	} else {
		a2 = (a*f)/(a-f);
		Z = -(a2/a);
	}
	
	float y2 = y*Z;
	
	// -------------------------------
	
	CGRect frame = self.bounds;
	
	CGPoint center = CGPointMake(CGRectGetMidX(frame), CGRectGetMidY(frame));
	CGPoint objectPoint = CGPointMake(center.x-a, center.y-y);
	
	CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame), CGRectGetMaxX(frame), CGRectGetMaxY(frame));
	
	UIBezierPath *bg = [UIBezierPath new];
	[bg moveToPoint:CGPointMake(CGRectGetMinX(frame), CGRectGetMinY(frame))];
	[bg addLineToPoint:CGPointMake(CGRectGetMaxX(frame), CGRectGetMinY(frame))];
	[bg addLineToPoint:CGPointMake(CGRectGetMaxX(frame), CGRectGetMaxY(frame))];
	[bg addLineToPoint:CGPointMake(CGRectGetMinX(frame), CGRectGetMaxY(frame))];
	[UIColor.whiteColor set];
	[bg fill];
	
	UIBezierPath *optickaOsa = [UIBezierPath new];
	[optickaOsa moveToPoint:CGPointMake(CGRectGetMinX(frame), CGRectGetMidY(frame))];
	[optickaOsa addLineToPoint:CGPointMake(CGRectGetMaxX(frame), CGRectGetMidY(frame))];
	CGFloat lineDash4[4] = {4, 2, 1, 2};
	[optickaOsa setLineDash:lineDash4 count:4 phase:0];
	[UIColor.blackColor set];
	[optickaOsa stroke];
	
	UIBezierPath *mirror = [UIBezierPath new];
	[mirror moveToPoint:CGPointMake(CGRectGetMidX(frame), CGRectGetMidY(frame)-10000)];
	[mirror addLineToPoint:CGPointMake(CGRectGetMidX(frame), CGRectGetMidY(frame)+10000)];
	[UIColor.blackColor set];
	[mirror stroke];
	
	UIBezierPath *object = [UIBezierPath new];
	[object moveToPoint:CGPointMake(CGRectGetMidX(frame)-a, CGRectGetMidY(frame))];
	[object addLineToPoint:CGPointMake(CGRectGetMidX(frame)-a, CGRectGetMidY(frame)-y)];
	[UIColor.redColor set];
	[object stroke];
	
	UIBezierPath *obraz = [UIBezierPath new];
	[obraz moveToPoint:CGPointMake(CGRectGetMidX(frame)+a2, CGRectGetMidY(frame))];
	[obraz addLineToPoint:CGPointMake(CGRectGetMidX(frame)+a2, CGRectGetMidY(frame)-y2)];
	[UIColor.orangeColor set];
	[obraz stroke];
	
	if (_mirrorType == 0) {
		
		[UIColor.greenColor set];
		CGVector line1Vector = CGVectorMake(100, 0);
		
		UIBezierPath *line1 = [UIBezierPath new];
		[line1 moveToPoint:CGPointMake(objectPoint.x-10*line1Vector.dx, objectPoint.y-10*line1Vector.dy)];
		[line1 addLineToPoint:CGPointMake(objectPoint.x+10*line1Vector.dx, objectPoint.y+10*line1Vector.dy)];
		[line1 stroke];
		
		// --------------
		
		[UIColor.blueColor set];
		CGVector line2Vector = CGVectorMake(center.x-objectPoint.x, center.y-objectPoint.y);
		
		UIBezierPath *line2 = [UIBezierPath new];
		[line2 moveToPoint:CGPointMake(objectPoint.x-10*line2Vector.dx, objectPoint.y-10*line2Vector.dy)];
		[line2 addLineToPoint:center];
		[line2 addLineToPoint:CGPointMake(center.x-10*line2Vector.dx, center.y+10*line2Vector.dy)];
		[line2 stroke];
		
		UIBezierPath *line2A = [UIBezierPath new];
		CGFloat lineDash2[2] = {4, 2};
		[line2A setLineDash:lineDash2 count:2 phase:0];
		[line2A moveToPoint:center];
		[line2A addLineToPoint:CGPointMake(center.x+10*line2Vector.dx, center.y-10*line2Vector.dy)];
		[line2A stroke];
		
	} else {
		
		CGVector line1Vector = CGVectorMake(center.x-objectPoint.x, center.y-objectPoint.y);
		
		UIBezierPath *line1 = [UIBezierPath new];
		[line1 moveToPoint:CGPointMake(objectPoint.x-10*line1Vector.dx, objectPoint.y-10*line1Vector.dy)];
		[line1 addLineToPoint:CGPointMake(objectPoint.x+10*line1Vector.dx, objectPoint.y+10*line1Vector.dy)];
		[UIColor.greenColor set];
		[line1 stroke];
		
		// --------------
		
		CGVector line2Vector = CGVectorMake(center.x+f-center.x, y);
		
		UIBezierPath *line2 = [UIBezierPath new];
		[line2 moveToPoint:CGPointMake(objectPoint.x-10000, objectPoint.y)];
		[line2 addLineToPoint:CGPointMake(objectPoint.x+a, objectPoint.y)];
		
		UIBezierPath *line2A = [UIBezierPath new];
		CGFloat lineDash2[2] = {4, 2};
		[line2A setLineDash:lineDash2 count:2 phase:0];
		[line2A moveToPoint:CGPointMake(objectPoint.x+a, objectPoint.y)];
		
		if (_mirrorType == 1) {
			[line2 addLineToPoint:CGPointMake(objectPoint.x+a-10*line2Vector.dx, objectPoint.y-10*line2Vector.dy)];
			[line2A addLineToPoint:CGPointMake(objectPoint.x+a+10*line2Vector.dx, objectPoint.y+10*line2Vector.dy)];
		} else {
			[line2 addLineToPoint:CGPointMake(objectPoint.x+a+10*line2Vector.dx, objectPoint.y+10*line2Vector.dy)];
			[line2A addLineToPoint:CGPointMake(objectPoint.x+a-10*line2Vector.dx, objectPoint.y-10*line2Vector.dy)];
		}
		
		[UIColor.blueColor set];
		[line2 stroke];
		[line2A stroke];
		
	}
	
}

- (void)setMirrorType:(int)mirrorType f:(float)f a:(float)a y:(float)y {
	_mirrorType = mirrorType;
	_f = f;
	_a = a;
	_y = y;
	
	[self setNeedsDisplay];
}

@end
