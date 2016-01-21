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

@end
