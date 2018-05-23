//
//  ITButton.m
//  OCCustomNavBar
//
//  Created by 薛国宾 on 2018/5/22.
//  Copyright © 2018年 千里之行始于足下. All rights reserved.
//

#import "ITButton.h"

@implementation ITButton

- (void)setItMargin:(CGFloat)itMargin {
    _itMargin = itMargin;
    [self setNeedsLayout];
}

- (void)setItInset:(UIEdgeInsets)itInset {
    _itInset = itInset;
    [self setNeedsLayout];
}

- (void)setItAlignment:(ITAlignment)itAlignment {
    _itAlignment = itAlignment;
    [self setNeedsLayout];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat sWidth = self.frame.size.width;
    CGFloat sHeight = self.frame.size.height;
    // 标题最大宽度 高度
    CGFloat tMaxWidth = sWidth;
    //        var tMaxHeight : CGFloat = self.height
    
    CGSize imageSize = self.imageView.image.size;
    
    [self.titleLabel sizeToFit];
    CGSize titleSize = self.titleLabel.frame.size;
    
    if (_itAlignment == ITAlignmentLeft || _itAlignment == ITAlignmentRight) {
        tMaxWidth -= _itInset.left + _itInset.right - _itMargin - imageSize.width;
    }
    else if (_itAlignment == ITAlignmentBottom || _itAlignment == ITAlignmentTop ||
             _itAlignment == ITAlignmentLHCenter || _itAlignment == ITAlignmentRHCenter ||
             _itAlignment == ITAlignmentTVCenter || _itAlignment == ITAlignmentBVCenter) {
        tMaxWidth -= _itInset.left + _itInset.right;
    }
    else if (_itAlignment == ITAlignmentLHalfAndHalf || _itAlignment == ITAlignmentRHalfAndHalf) {
        tMaxWidth -= tMaxWidth / 2 - _itMargin / 2;
    }
    titleSize.width = MIN(titleSize.width, tMaxWidth);
    
    CGPoint imagePoint = CGPointZero;
    CGPoint titlePoint = CGPointZero;
    
    // 获取对齐方式 计算出 point
    switch (_itAlignment) {
        case ITAlignmentLeft:
            imagePoint.x = _itInset.left;
            imagePoint.y = sHeight / 2 - imageSize.height / 2;
            
            titlePoint.x = imagePoint.x + imageSize.width + _itMargin;
            titlePoint.y = sHeight / 2 - titleSize.height / 2;
            break;
        case ITAlignmentRight:
            imagePoint.x = sWidth - _itInset.right - imageSize.width;
            imagePoint.y = sHeight / 2 - imageSize.height / 2;
            
            titlePoint.x = imagePoint.x - _itMargin - titleSize.width;
            titlePoint.y = sHeight / 2 - titleSize.height / 2;
            
            break;
        case ITAlignmentTop:
            imagePoint.y = _itInset.top;
            imagePoint.x = sWidth / 2 - imageSize.width / 2;
            
            titlePoint.y = imagePoint.y + imageSize.height + _itMargin;
            titlePoint.x = sWidth / 2 - titleSize.width / 2;
            break;
        case ITAlignmentBottom:
            imagePoint.y = sHeight - _itInset.bottom - imageSize.height;
            imagePoint.x = sWidth / 2 - imageSize.width / 2;
            
            titlePoint.y = imagePoint.y - _itMargin - titleSize.height;
            titlePoint.x = sWidth / 2 - titleSize.width / 2;
            break;
        case ITAlignmentLHCenter: {
            CGFloat mun = imageSize.width + _itMargin + titleSize.width;
            imagePoint.x = sWidth / 2 - mun / 2;
            imagePoint.y = sHeight / 2 - imageSize.height / 2;
            
            titlePoint.x = imagePoint.x + imageSize.width + _itMargin;
            titlePoint.y = sHeight / 2 - titleSize.height / 2;
            break;
        }
        case ITAlignmentRHCenter: {
            CGFloat mun = imageSize.width + _itMargin + titleSize.width;
            titlePoint.x = sWidth / 2 - mun / 2;
            titlePoint.y = sHeight / 2 - titleSize.height / 2;
            
            imagePoint.x = titlePoint.x + titleSize.width + _itMargin;
            imagePoint.y = sHeight / 2 - imageSize.height / 2;
            break;
        }
        case ITAlignmentTVCenter: {
            CGFloat mun = imageSize.height + _itMargin + titleSize.height;
            imagePoint.y = sHeight / 2 - mun / 2;
            imagePoint.x = sWidth / 2 - imageSize.width / 2;
            
            titlePoint.y = imagePoint.y + imageSize.height + _itMargin;
            titlePoint.x = sWidth / 2 - titleSize.width / 2;
            break;
        }
        case ITAlignmentBVCenter: {
            CGFloat mun = imageSize.height + _itMargin + titleSize.height;
            titlePoint.y = sHeight / 2 - mun / 2;
            titlePoint.x = sWidth / 2 - titleSize.width / 2;
            
            imagePoint.y = titlePoint.y + titleSize.height + _itMargin;
            imagePoint.x = sWidth / 2 - imageSize.width / 2;
            break;
        }
        case ITAlignmentLHalfAndHalf:
            imagePoint.x = sWidth / 2 - _itMargin / 2 - imageSize.width;
            imagePoint.y = sHeight / 2 - imageSize.height / 2;
            
            CGFloat lastW = titleSize.width;
            titleSize.width = sWidth / 2 - _itMargin / 2 - _itInset.right;
            titleSize.width = MIN(titleSize.width, lastW);
            
            titlePoint.x = sWidth / 2 + _itMargin / 2;
            titlePoint.y = sHeight / 2 - titleSize.height / 2;
            break;
        case ITAlignmentRHalfAndHalf: {
            CGFloat lastW = titleSize.width;
            titleSize.width = sWidth / 2 - _itMargin / 2 - _itInset.left;
            titleSize.width = MIN(titleSize.width, lastW);
            
            titlePoint.x = sWidth / 2 - _itMargin / 2 - titleSize.width;
            titlePoint.y = sHeight / 2 - titleSize.height / 2;
            
            imagePoint.x = sWidth / 2 + _itMargin / 2;
            imagePoint.y = sHeight / 2 - imageSize.height / 2;
        }
            break;
            
        case ITAlignmentTLeft:
            titlePoint.x = _itInset.left;
            titlePoint.y = sHeight / 2 - titleSize.height / 2;
            
            imagePoint.x = titlePoint.x + titleSize.width + _itMargin;
            imagePoint.y = sHeight / 2 - imageSize.height / 2;
            break;
        case ITAlignmentTRight:
            titlePoint.x = sWidth - _itInset.right - titleSize.width;
            titlePoint.y = sHeight / 2 - titleSize.height / 2;
            
            imagePoint.x = titlePoint.x - _itMargin - imageSize.width;
            imagePoint.y = sHeight / 2 - imageSize.height / 2;
            break;
        case ITAlignmentTTop:
            titlePoint.y = _itInset.top;
            titlePoint.x = sWidth / 2 - titleSize.width / 2;
            
            imagePoint.y = titlePoint.y + titleSize.height + _itMargin;
            imagePoint.x = sWidth / 2 - imageSize.width / 2;
            break;
        case ITAlignmentTBottom:
            titlePoint.y = sHeight - _itInset.bottom - titleSize.height;
            titlePoint.x = sWidth / 2 - titleSize.width / 2;
            
            imagePoint.y = titlePoint.y - _itMargin - imageSize.height;
            imagePoint.x = sWidth / 2 - imageSize.width / 2;
            break;
            
        default:
            break;
    }
    
    
    self.imageView.frame = CGRectMake(imagePoint.x, imagePoint.y, imageSize.width, imageSize.height);
    self.titleLabel.frame = CGRectMake(titlePoint.x, titlePoint.y, titleSize.width, titleSize.height);
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end

