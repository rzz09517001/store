//
//  RZZGoodsListView.m
//  store
//
//  Created by 任志忠 on 2018/10/14.
//  Copyright © 2018 rzz. All rights reserved.
//

#import "RZZGoodsListView.h"
#import "RZZGoodsListCollectionViewCell.h"

static NSString *cellId = @"RZZGoodsCollectionCell";

@interface RZZGoodsListView()<UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation RZZGoodsListView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        [self registerClass:[RZZGoodsListCollectionViewCell class] forCellWithReuseIdentifier:cellId];
    }
    return self;
}

-(void)setDataArray:(NSArray *)dataArray {
    _dataArray = dataArray;
    [self reloadData];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    RZZGoodsListCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    cell.dataModel = self.dataArray[indexPath.row];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (_selectedBlock) {
        _selectedBlock([self.dataArray[indexPath.row] GoodsId]);
    }
}

@end
