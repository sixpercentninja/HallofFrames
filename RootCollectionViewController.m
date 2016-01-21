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
    
    // Register cell classes
//    [self.collectionView registerClass:[PhotoCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    [self.collectionView reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.collectionImages.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PhotoCell" forIndexPath:indexPath];
    UIImageView *collectionImageView = (UIImageView *)[cell viewWithTag:100];
    collectionImageView.image = [self.collectionImages objectAtIndex:indexPath.row];
    cell.backgroundColor = cell.bgColor;
    return cell;
}

-(void)customView:(id)view didTapButton:(UIButton *)button {
    
    PhotoCollectionViewCell *cell = (PhotoCollectionViewCell *)[self.cView cellForItemAtIndexPath:self.lastCellTappedIndexPath];
    
    if ([button.titleLabel.text isEqualToString:@"Red"]) {
        cell.bgColor = [UIColor redColor];
    } else if ([button.titleLabel.text isEqualToString:@"Green"]) {
        cell.bgColor = [UIColor greenColor];
    } else {
        cell.bgColor = [UIColor blueColor];
    }
    
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


// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}



@end
