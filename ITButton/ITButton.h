//
//  ITButton.h
//  OCCustomNavBar
//
//  Created by 薛国宾 on 2018/5/22.
//  Copyright © 2018年 千里之行始于足下. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "UIView+ITAdd.h"
/**
 图片和标题的对齐方式
 
 - ITAlignmentLeft: 靠左
 - ITAlignmentRight: 靠右
 - ITAlignmentTop: 靠上
 - ITAlignmentBottom: 靠下
 - ITAlignmentLHCenter: 图片在左水平居中
 - ITAlignmentRHCenter: 图片在右水平居中
 - ITAlignmentTVCenter: 图片在上垂直居中
 - ITAlignmentBVCenter: 图片在下垂直居中
 - ITAlignmentLHalfAndHalf: 图片在左对半
 - ITAlignmentRHalfAndHalf: 图片在右对半
 _ ITAlignmentTLeft: 标题靠左
 _ ITAlignmentTRight: 标题靠右
 _ ITAlignmentTTop: 标题靠上
 _ ITAlignmentTBottom: 标题靠下
 */
typedef NS_ENUM(NSUInteger, ITAlignment) {
    ITAlignmentLeft     = 0,
    ITAlignmentRight    = 1,
    ITAlignmentTop      = 2,
    ITAlignmentBottom   = 3,
    ITAlignmentLHCenter = 4,
    ITAlignmentRHCenter = 5,
    ITAlignmentTVCenter = 6,
    ITAlignmentBVCenter = 7,
    ITAlignmentLHalfAndHalf = 8,
    ITAlignmentRHalfAndHalf = 9,
    ITAlignmentTLeft    = 10,
    ITAlignmentTRight   = 11,
    ITAlignmentTTop     = 12,
    ITAlignmentTBottom  = 13
};

@interface ITButton : UIButton

/**
 图片和标题间隔
 */
@property (nonatomic) CGFloat itMargin;

/**
 图片和标题 左右上下 设置偏移只针对一项， 居中模式无效
 */
@property (nonatomic) UIEdgeInsets itInset;

/**
 图片和标题的对齐方式
 */
@property (nonatomic) ITAlignment itAlignment;

@end

