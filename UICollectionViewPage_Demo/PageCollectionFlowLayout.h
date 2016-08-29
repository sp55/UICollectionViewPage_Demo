//
//  PageCollectionFlowLayout.h
//  UICollectionViewPage_Demo
//
//  Created by admin on 16/8/29.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, EBCardCollectionLayoutType) {
    EBCardCollectionLayoutHorizontal,
    EBCardCollectionLayoutVertical
};

@interface PageCollectionFlowLayout : UICollectionViewFlowLayout

@property (readonly) NSInteger currentPage;
@property (nonatomic, assign) UIOffset offset;
@property (nonatomic, strong) NSDictionary *layoutInfo;
@property (assign) EBCardCollectionLayoutType layoutType;

- (CGRect)contentFrameForCardAtIndexPath:(NSIndexPath *)indexPath;

@end
