//
//  MirrorViewController.m
//  optika
//
//  Created by Alex Studnicka on 22/03/14.
//  Copyright (c) 2014 Alex Studnicka. All rights reserved.
//

#import "MirrorViewController.h"

@implementation MirrorViewController {
	float _oldFocusValue;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
	[self controlChanged:_mirrorTypeControl];
	[self redraw];
}

#pragma mark - Draw

- (void)redraw {
	
	float f = _focusSlider.value;
	float a = _distanceSlider.value;
	float y = _sizeSlider.value;
	
	f = roundf(f);
	a = roundf(a);
	y = roundf(y);
	
	_focusLabel.text = [NSString stringWithFormat:@"%.2f cm", f];
	_distanceLabel.text = [NSString stringWithFormat:@"%.2f cm", a];
	_sizeLabel.text = [NSString stringWithFormat:@"%.2f cm", y];
	
	f /= 2.0;
	if (_mirrorTypeControl.selectedSegmentIndex == 2) f = -f;
	
	[_constructionView setMirrorType:(int)_mirrorTypeControl.selectedSegmentIndex f:f a:a y:y];
	
}

#pragma mark - Actions

- (IBAction)controlChanged:(UISegmentedControl *)sender {
	
	if (_focusSlider.value > 0) _oldFocusValue = _focusSlider.value;
	
	if (_mirrorTypeControl.selectedSegmentIndex == 0) {
		_focusSlider.enabled = NO;
		_focusSlider.minimumValue = 0;
		_focusSlider.value = 0;
	} else {
		_focusSlider.minimumValue = 1;
		_focusSlider.value = _oldFocusValue;
		_focusSlider.enabled = YES;
	}
	
	[self redraw];
	
}

- (IBAction)sliderValueChanged:(UISlider *)sender {
	[self redraw];
}

@end
