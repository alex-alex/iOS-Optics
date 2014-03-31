//
//  MirrorViewController.h
//  optika
//
//  Created by Alex Studnicka on 22/03/14.
//  Copyright (c) 2014 Alex Studnicka. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MirrorConstructionView.h"

@interface MirrorViewController : UIViewController {
	__weak IBOutlet UISegmentedControl *_mirrorTypeControl;
	
	__weak IBOutlet UILabel *_focusPowerTitleLabel;
	__weak IBOutlet UISlider *_focusSlider;
	__weak IBOutlet UISlider *_distanceSlider;
	__weak IBOutlet UISlider *_sizeSlider;
	
	__weak IBOutlet UILabel *_focusLabel;
	__weak IBOutlet UILabel *_distanceLabel;
	__weak IBOutlet UILabel *_sizeLabel;
	
	__weak IBOutlet MirrorConstructionView *_constructionView;
}

- (IBAction)controlChanged:(UISegmentedControl *)sender;
- (IBAction)sliderValueChanged:(UISlider *)sender;

@end
