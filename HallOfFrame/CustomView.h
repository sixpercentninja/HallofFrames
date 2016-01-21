//
//  CustomView.h
//  HallOfFrame
//
//  Created by Steve Uffelman on 1/20/16.
//  Copyright © 2016 Andrew Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CustomViewDelegate <NSObject>

@required

@optional

// method for tapping of R/G/B buttons
-(void) customView:(id)view didTapButton:(UIButton *)button;

// method for creation of custom color
-(void) customView:(id)view didTapCustomColorButton:(UIButton *)button withRedColor:(float)redColorValue withBlueColor:(float)blueColorValue withGreenColor:(float)greenColorValue;

@end

@interface CustomView : UIView

@property (weak, nonatomic) IBOutlet UISlider *redSlider;
@property (weak, nonatomic) IBOutlet UISlider *blueSlider;
@property (weak, nonatomic) IBOutlet UISlider *greenSlider;

@property (nonatomic, assign) id <CustomViewDelegate> delegate;

@end
