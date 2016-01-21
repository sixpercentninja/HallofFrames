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

-(void) customView:(id)view didTapButton:(UIButton *)button;

@end

@interface CustomView : UIView

@property (nonatomic, assign) id <CustomViewDelegate> delegate;

@end
