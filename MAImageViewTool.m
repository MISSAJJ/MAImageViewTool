//
//  MAImageViewTool.m
//  MISSAJJ
//  https://github.com/MISSAJJ/MAImageViewTool
//  Created by MISSAJJ on 15/11/24.
//  Copyright © 2015年 MISSAJJ. All rights reserved.
//

#import "MAImageViewTool.h"
#import "UIImageView+WebCache.h"
//#import "UIImageView+UIActivityIndicatorForSDWebImage.h"
@implementation MAImageViewTool


/**
 *  设置普通图片加载
 */
+(void)MA_setImageWithUrlString:(NSString *)urlString placeHolder:(UIImage *)placeHolderImage imageView:(UIImageView *)imageView
{
     [imageView sd_setImageWithURL:[NSURL URLWithString:urlString] placeholderImage:placeHolderImage options:SDWebImageLowPriority | SDWebImageRetryFailed];
    
}

/**
 *  设置渐现图片加载
 */
+(void)MA_setChangeAlphaImageWithUrlString:(NSString *)urlString placeHolder:(UIImage *)placeHolderImage imageView:(UIImageView *)imageView
{
    
    
    [imageView sd_setImageWithURL:[NSURL URLWithString:urlString] placeholderImage:placeHolderImage options:SDWebImageLowPriority | SDWebImageRetryFailed progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        
       imageView.alpha = 0.1;
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        if (cacheType == SDImageCacheTypeMemory) {
    
            imageView.alpha = 0.5;
            
            [UIView animateWithDuration:0.5  animations:^{
                
                imageView.alpha = 1.0;
                
            }];
 
        }
        
    }];
}

/**
 *  设置菊花动画的等待图片
 */
+(void)MA_setIndicatorImageWithUrlString:(NSString *)urlString placeHolder:(UIImage *)placeHolderImage imageView:(UIImageView *)imageView
{
//    //使用UIImageView+UIActivityIndicatorForSDWebImage.h
//    __weak typeof (UIImageView *) weakImageView = imageView;
//    
//    [imageView setImageWithURL:[NSURL URLWithString:urlString] placeholderImage:placeHolderImage options:SDWebImageLowPriority | SDWebImageRetryFailed completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//        
//        //如果图片未缓存 渐现效果
//        if (cacheType== SDImageCacheTypeNone) {
//            weakImageView.alpha = 0.1;
//            [UIView animateWithDuration:0.5  animations:^{
//                weakImageView.alpha = 1.0;
//                
//            }];
//        }
//    } usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    /**
     *  自定义创建图片动态加载指示器 by MISSAJJ
     */
    __block UIActivityIndicatorView * indicatorPlaceholder = nil;
    [imageView sd_setImageWithURL:[NSURL URLWithString:urlString] placeholderImage:placeHolderImage options:SDWebImageLowPriority | SDWebImageRetryFailed progress:^(NSInteger receivedSize, NSInteger expectedSize) {
       
        //创建指示器:必须放在线程内才不会报错
        dispatch_async(dispatch_get_main_queue(), ^{
            if(!indicatorPlaceholder){
                [imageView addSubview:indicatorPlaceholder = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray]];
                indicatorPlaceholder.center = CGPointMake(imageView.bounds.size.width / 2, imageView.bounds.size.height / 2);
                indicatorPlaceholder.hidesWhenStopped = YES;
                [indicatorPlaceholder startAnimating];
            }
        });
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        //如果图片未缓存  渐现效果
        if (cacheType == SDImageCacheTypeNone){
            imageView.alpha = 0.1;
            [UIView animateWithDuration:0.5  animations:^{
                imageView.alpha = 1.0;
            }];
        }
        
        //消除指示器
        for (UIView * view in [imageView subviews]){
            if ([indicatorPlaceholder isKindOfClass:[UIActivityIndicatorView class]]) {
                [view removeFromSuperview];
            }
        }
    }];
}

/**
 *  清除图片缓存
 */
+(void)MA_clearImageCache
{
    [[SDImageCache sharedImageCache]clearMemory];
    [[SDWebImageManager sharedManager]cancelAll];

}
@end
