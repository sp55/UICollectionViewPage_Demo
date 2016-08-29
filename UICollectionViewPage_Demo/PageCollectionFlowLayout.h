//
//  PageCollectionFlowLayout.h
//  UICollectionViewPage_Demo
//
//  Created by admin on 16/8/29.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, CardCollectionLayoutType) {
    CardCollectionLayoutHorizontal,
    CardCollectionLayoutVertical
};

@interface PageCollectionFlowLayout : UICollectionViewFlowLayout

@property (readonly) NSInteger currentPage;
@property (nonatomic, assign) UIOffset offset;
@property (nonatomic, strong) NSDictionary *layoutInfo;
@property (assign) CardCollectionLayoutType layoutType;

- (CGRect)contentFrameForCardAtIndexPath:(NSIndexPath *)indexPath;

@end
