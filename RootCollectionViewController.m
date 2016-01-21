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
    
    self.collectionImages = [NSArray arrayWithObjects:[UIImage imageNamed:@"1"], [UIImage imageNamed:@"2"],[UIImage imageNamed:@"3"],[UIImage imageNamed:@"4"],[UIImage imageNamed:@"5"], nil];
    
    self.collectionColors = [NSMutableArray arrayWithObjects:[UIColor blackColor], [UIColor redColor], [UIColor blackColor], [UIColor blackColor], [UIColor blackColor], nil];
    
    [self.collectionView reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.collectionImages.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    PhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PhotoCell" forIndexPath:indexPath];
    UIImageView *collectionImageView = (UIImageView *)[cell viewWithTag:100];
    collectionImageView.image = [self.collectionImages objectAtIndex:indexPath.row];
    cell.backgroundColor = [self.collectionColors objectAtIndex:indexPath.row];
    return cell;
}

-(void)customView:(id)view didTapButton:(UIButton *)button {
    
    UIColor *newColor = [self.collectionColors objectAtIndex:self.lastCellTappedIndexPath.row];
    
    if ([button.titleLabel.text isEqualToString:@"Red"]) {
        newColor = [UIColor redColor];
        
    } else if ([button.titleLabel.text isEqualToString:@"Green"]) {
        newColor = [UIColor greenColor];
        
    } else {
        newColor = [UIColor blueColor];
    }
    
    [self.collectionColors replaceObjectAtIndex:self.lastCellTappedIndexPath.row withObject:newColor];
    
    [view removeFromSuperview];
    [self.cView reloadData];
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    CustomView *customView = [CustomView new];
    customView = [[[NSBundle mainBundle] loadNibNamed:@"View" owner:customView options:nil] lastObject];
    customView.frame = self.view.frame;
    customView.delegate = self;
    [self.view addSubview:customView];

    self.lastCellTappedIndexPath = indexPath;

}

@end
