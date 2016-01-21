//
//  RootCollectionViewController.m
//  HallOfFrame
//
//  Created by Andrew Chen on 1/20/16.
//  Copyright © 2016 Andrew Chen. All rights reserved.
//

#import "RootCollectionViewController.h"
#import "PhotoCollectionViewCell.h"

@interface RootCollectionViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation RootCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionImages = [NSArray arrayWithObjects:[UIImage imageNamed:@"1"], [UIImage imageNamed:@"2"],[UIImage imageNamed:@"3"],[UIImage imageNamed:@"4"],[UIImage imageNamed:@"5"], nil];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[PhotoCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    [self.collectionView reloadData];
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

//- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
//    return 1;
//}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.collectionImages.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PhotoCell"forIndexPath:indexPath];
    UIImageView *collectionImageView = (UIImageView *)[cell viewWithTag:100];
    collectionImageView.image = [self.collectionImages objectAtIndex:indexPath.row];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
