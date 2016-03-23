//
//  RootCollectionViewController.m
//  HallOfFrame
//
//  Created by Andrew Chen on 1/20/16.
//  Copyright © 2016 Andrew Chen. All rights reserved.
//

#import "RootCollectionViewController.h"
#import "PhotoCollectionViewCell.h"
#import "CustomView.h"

@interface RootCollectionViewController () <UICollectionViewDelegate, UICollectionViewDataSource, CustomViewDelegate>

@property NSIndexPath *lastCellTappedIndexPath;
@property (strong, nonatomic) IBOutlet UICollectionView *cView;

@end

@implementation RootCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
  [super viewDidLoad];
  
  // initialize photo and background color arrays with default values
  self.collectionImages = [NSArray arrayWithObjects:[UIImage imageNamed:@"1"], [UIImage imageNamed:@"2"],[UIImage imageNamed:@"3"],[UIImage imageNamed:@"4"],[UIImage imageNamed:@"5"], nil];
  self.collectionColors = [NSMutableArray arrayWithObjects:[UIColor blackColor], [UIColor blackColor], [UIColor blackColor], [UIColor blackColor], [UIColor blackColor], nil];
  
  [self.collectionView reloadData];
}

// set number of cells based on photo array length
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
  return self.collectionImages.count;
}

// format cells based on images and colors stored in arrays
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  
  // initialize each cell with image view from custom cell class
  PhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PhotoCell" forIndexPath:indexPath];
  UIImageView *collectionImageView = (UIImageView *)[cell viewWithTag:100];
  
  // set properties of cells based on array values
  collectionImageView.image = [self.collectionImages objectAtIndex:indexPath.row];
  cell.backgroundColor = [self.collectionColors objectAtIndex:indexPath.row];
  return cell;
}

// set photo background as primary color based on button title
-(void)customView:(id)view didTapButton:(UIButton *)button {
  
  UIColor *newColor = [UIColor new];
  
  if ([button.titleLabel.text isEqualToString:@"Red"]) {
    newColor = [UIColor redColor];
    
  } else if ([button.titleLabel.text isEqualToString:@"Green"]) {
    newColor = [UIColor greenColor];
    
  } else { // only other option is blue
    newColor = [UIColor blueColor];
  }
  
  // stores new color value in color array
  [self.collectionColors replaceObjectAtIndex:self.lastCellTappedIndexPath.row withObject:newColor];
  
  // dismiss .xib and refresh collection view
  [view removeFromSuperview];
  [self.cView reloadData];
  
}


// set photo background to custom color based on sliders
-(void)customView:(id)view didTapCustomColorButton:(UIButton *)button withRedColor:(float)redColorValue withBlueColor:(float)blueColorValue withGreenColor:(float)greenColorValue {
  
  // stores new color value in color array
  UIColor *newColor = [UIColor colorWithRed:redColorValue
                                      green:greenColorValue
                                       blue:blueColorValue
                                      alpha:1];
  [self.collectionColors replaceObjectAtIndex:self.lastCellTappedIndexPath.row withObject:newColor];
  
  // dismiss .xib and refresh collection view
  [view removeFromSuperview];
  [self.cView reloadData];
}

// bring in .xib upon photo tapped
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
  
  // summon .xib from CustomView class
  CustomView *customView = [CustomView new];
  customView = [[[NSBundle mainBundle] loadNibNamed:@"View" owner:customView options:nil] lastObject];
  customView.frame = self.view.frame;
  customView.delegate = self;
  [self.view addSubview:customView];
  
  // store last cell tapped as target for background color changes
  self.lastCellTappedIndexPath = indexPath;
}


@end
