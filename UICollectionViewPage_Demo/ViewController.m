//
//  ViewController.m
//  UICollectionViewPage_Demo
//
//  Created by admin on 16/8/29.
//  Copyright © 2016年 AlezJi. All rights reserved.
//http://www.jianshu.com/p/c59a5c92f859
//UICollectionView（一）——整体总结

#import "ViewController.h"
#import "PageCollectionViewCell.h"
#import "PageCollectionFlowLayout.h"

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property(strong,nonatomic)UICollectionView *collectionView;
@end

@implementation ViewController
// 注意const的位置
static NSString *const cellId = @"cellId";
static NSString *const headerId = @"headerId";
static NSString *const footerId = @"footerId";

- (void)viewDidLoad {
    [super viewDidLoad];

    self.automaticallyAdjustsScrollViewInsets = NO;
    PageCollectionFlowLayout *flowLayout =[[PageCollectionFlowLayout alloc] init];
    self.collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64) collectionViewLayout:flowLayout];
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    [self.view addSubview:_collectionView];
    
    // 注册cell、sectionHeader、sectionFooter
    [_collectionView registerClass:[PageCollectionViewCell class] forCellWithReuseIdentifier:cellId];
    _collectionView.showsVerticalScrollIndicator = NO;
//    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerId];
//    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:footerId];

    UIOffset anOffset = UIOffsetZero;

    
//水平
    self.title = @"Horizontal Scrolling";
    anOffset = UIOffsetMake(40, 10);
    [(PageCollectionFlowLayout *)_collectionView.collectionViewLayout setOffset:anOffset];
    [(PageCollectionFlowLayout *)_collectionView.collectionViewLayout setLayoutType:CardCollectionLayoutHorizontal];

//竖直
//    self.title = @"Vertical Scrolling";
//    anOffset = UIOffsetMake(20, 20);
//    [(PageCollectionFlowLayout *)_collectionView.collectionViewLayout setOffset:anOffset];
//    [(PageCollectionFlowLayout *)_collectionView.collectionViewLayout setLayoutType:CardCollectionLayoutVertical];

}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    _collectionView.contentOffset = CGPointMake(0, 0);
}


#pragma mark ---- UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PageCollectionViewCell *cell = [_collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    cell.backgroundColor = [UIColor purpleColor];
    return cell;
}

@end
