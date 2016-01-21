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
        NSLog(@"red slider at %f stored with value %f", sender.value, self.redSliderValue);
        
    } else if (sender.tag == 2) {
        self.blueSliderValue = sender.value;
        NSLog(@"red slider at %f stored with value %f", sender.value, self.redSliderValue);
        
    } else {
        self.greenSliderValue = sender.value;
        NSLog(@"red slider at %f stored with value %f", sender.value, self.redSliderValue);

    }
    
}

- (IBAction)onSetCustomColorButtonTapped:(UIButton *)sender {
    
    float redColorValue = self.redSliderValue;
    NSLog(@"red value = %f", redColorValue);
    
    float blueColorValue = self.blueSliderValue;
    NSLog(@"red value = %f", blueColorValue);
    
    float greenColorValue = self.greenSliderValue;
    NSLog(@"red value = %f", greenColorValue);
    
    // send custom color method to delegate as in first method above
    [self.delegate customView:self
      didTapCustomColorButton:sender
                 withRedColor:redColorValue
                withBlueColor:blueColorValue
               withGreenColor:greenColorValue];
}

@end
