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
    
    // create some float color value properties and then set them here
    
}

- (IBAction)onSetCustomColorButtonTapped:(UIButton *)sender {
    
    // send custom color method to delegate as in first method above
    
}

@end
