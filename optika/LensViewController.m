//
//  LensesGraphicsViewController.m
//  optika
//
//  Created by Alex Studnicka on 21/03/14.
//  Copyright (c) 2014 Alex Studnicka. All rights reserved.
//

#import "LensViewController.h"

@implementation LensViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
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
	
	if (_focusPowerControl.selectedSegmentIndex == 0) {
		_focusLabel.text = [NSString stringWithFormat:@"%.2f cm", f];
	} else {
		_focusLabel.text = [NSString stringWithFormat:@"%.2f D", f];
	}
	_distanceLabel.text = [NSString stringWithFormat:@"%.2f cm", a];
	_sizeLabel.text = [NSString stringWithFormat:@"%.2f cm", y];
	
	if (_focusPowerControl.selectedSegmentIndex == 1) f = (1./f)*100.;
	if (_lensTypeControl.selectedSegmentIndex == 1) f = -f;
	
	[_constructionView setLensType:(int)_lensTypeControl.selectedSegmentIndex f:f a:a y:y];
	
}

#pragma mark - Actions

- (IBAction)controlChanged:(UISegmentedControl *)sender {
	if (_focusPowerControl.selectedSegmentIndex == 0) {
		_focusPowerTitleLabel.text = NSLocalizedString(@"FOCAL_LENGTH", nil);
	} else {
		_focusPowerTitleLabel.text = NSLocalizedString(@"OPTICAL_POWER", nil);
	}
	[self redraw];
}

- (IBAction)sliderValueChanged:(UISlider *)sender {
	[self redraw];
}

@end
