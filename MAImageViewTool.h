//
//  MAImageViewTool.h
//  MISSAJJ
//  https://github.com/MISSAJJ/MAImageViewTool
//  Created by MISSAJJ on 15/11/24.
//  Copyright © 2015年 MISSAJJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MAImageViewTool : NSObject 


/**
 *  设置普通图片加载
 */
+(void)MA_setImageWithUrlString:(NSString *)urlString placeHolder:(UIImage *)placeHolderImage imageView:(UIImageView *)imageView;

/**
 *  设置渐现图片加载
 */
+(void)MA_setChangeAlphaImageWithUrlString:(NSString *)urlString placeHolder:(UIImage *)placeHolderImage imageView:(UIImageView *)imageView;

/**
 *  设置菊花动画的等待图片
 */
+(void)MA_setIndicatorImageWithUrlString:(NSString *)urlString placeHolder:(UIImage *)placeHolderImage imageView:(UIImageView *)imageView;

/**
 *  清除图片缓存
 */
+ (void)MA_clearImageCache;
@end
