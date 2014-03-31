//
//  LensConstructionView.m
//  optika
//
//  Created by Alex Studnicka on 22/03/14.
//  Copyright (c) 2014 Alex Studnicka. All rights reserved.
//

#import "LensConstructionView.h"

@implementation LensConstructionView{
	int _lensType;
	float _f;
	float _a;
	float _y;
}

- (void)drawRect:(CGRect)rect {
	
	float f = _f;
	float a = _a;
	float y = _y;

	float a2 = (a*f)/(a-f);
	float Z = -(a2/a);
	float y2 = y*Z;
	
	// -------------------------------
	
	CGRect frame = self.bounds;
	
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
	
	UIBezierPath *cocka = [UIBezierPath new];
	[cocka moveToPoint:CGPointMake(CGRectGetMidX(frame), CGRectGetMidY(frame)-10000)];
	[cocka addLineToPoint:CGPointMake(CGRectGetMidX(frame), CGRectGetMidY(frame)+10000)];
	[UIColor.blackColor set];
	[cocka stroke];
	
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
	
	UIBezierPath *line1 = [UIBezierPath new];
	[line1 moveToPoint:CGPointMake(CGRectGetMidX(frame)-a, CGRectGetMidY(frame)-y)];
	CGFloat dX = (CGRectGetMidX(frame)-(CGRectGetMidX(frame)-a));
	CGFloat dY = (CGRectGetMidY(frame)-(CGRectGetMidY(frame)-y));
	[line1 addLineToPoint:CGPointMake(CGRectGetMidX(frame)+10*dX, CGRectGetMidY(frame)+10*dY)];
	[line1 moveToPoint:CGPointMake(CGRectGetMidX(frame)-a, CGRectGetMidY(frame)-y)];
	[line1 addLineToPoint:CGPointMake(CGRectGetMidX(frame)-10*dX, CGRectGetMidY(frame)-10*dY)];
	[UIColor.greenColor set];
	[line1 stroke];
	
	UIBezierPath *line2 = [UIBezierPath new];
	[line2 moveToPoint:CGPointMake(CGRectGetMidX(frame)-10000, CGRectGetMidY(frame)-y)];
	[line2 addLineToPoint:CGPointMake(CGRectGetMidX(frame), CGRectGetMidY(frame)-y)];
	
	UIBezierPath *line2A = [UIBezierPath new];
	CGFloat lineDash2[2] = {4, 2};
	[line2A setLineDash:lineDash2 count:2 phase:0];
	[line2A moveToPoint:CGPointMake(CGRectGetMidX(frame), CGRectGetMidY(frame)-y)];
	
	if (_lensType == 0) {
		dX = (CGRectGetMidX(frame)+ABS(f)-CGRectGetMidX(frame));
		dY = (CGRectGetMidY(frame)-(CGRectGetMidY(frame)-y));
		[line2 addLineToPoint:CGPointMake(CGRectGetMidX(frame)+ABS(f)+10*dX, CGRectGetMidY(frame)+10*dY)];
		
		[line2A addLineToPoint:CGPointMake(CGRectGetMidX(frame)+ABS(f)-10*dX, CGRectGetMidY(frame)-10*dY)];
	} else {
		dX = (CGRectGetMidX(frame)-ABS(f)-CGRectGetMidX(frame));
		dY = (CGRectGetMidY(frame)-(CGRectGetMidY(frame)-y));
		[line2A addLineToPoint:CGPointMake(CGRectGetMidX(frame)-ABS(f)+10*dX, CGRectGetMidY(frame)+10*dY)];
		
		[line2 addLineToPoint:CGPointMake(CGRectGetMidX(frame)-ABS(f)-10*dX, CGRectGetMidY(frame)-10*dY)];
	}
	
	[UIColor.blueColor set];
	[line2 stroke];
	[line2A stroke];
	
}

- (void)setLensType:(int)lensType f:(float)f a:(float)a y:(float)y {
	_lensType = lensType;
	_f = f;
	_a = a;
	_y = y;
	
	[self setNeedsDisplay];
}

@end
