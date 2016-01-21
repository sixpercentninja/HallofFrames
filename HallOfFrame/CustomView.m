//
//  CustomView.m
//  HallOfFrame
//
//  Created by Steve Uffelman on 1/20/16.
//  Copyright © 2016 Andrew Chen. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

- (IBAction)onCustomViewButtonTapped:(UIButton *)sender {
    
    [self.delegate customView:self didTapButton:sender];    
}

- (IBAction)onSliderValueChange:(UISlider *)sender {
    
    if (sender.tag == 1) {
        self.redSliderValue = sender.value;
        
    } else if (sender.tag == 2) {
        self.blueSliderValue = sender.value;
        
    } else {
        self.greenSliderValue = sender.value;

    }
    
}

- (IBAction)onSetCustomColorButtonTapped:(UIButton *)sender {
    
    // send custom color method to delegate as in first method above
    [self.delegate customView:self
      didTapCustomColorButton:sender
                 withRedColor:self.redSliderValue
                withBlueColor:self.blueSliderValue
               withGreenColor:self.greenSliderValue];
}

@end
