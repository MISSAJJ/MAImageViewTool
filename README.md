

###MAImageViewTool      

`MISSAJJ`自己写的一个基于`SDWebImage`自定义的管理网络图片加载的工具类(`普通图片加载`,`渐现Alpha图片加载`,`菊花Indicator动画加载`)

###前言

几个月前MAC开发笔记本被盗，积累了3年的资料和一些未备份的源代码一起灰飞烟灭，心疼，辛酸，压抑，情绪低弥了一阵子……

之后下载了一手机的开发视频课程，

路上，车上，家里，

躺着，站着，坐着……

发疯似的给自己打鸡血，

并重新开始积累……

如今突然觉得应该感谢那一次的被盗事件，激发了体内的小宇宙，让自己突破了瓶颈，提升了一个新的高度，更领略了代码世界里的神奇和优雅……

今日向GitHub迈出的一小步，是一个值得纪念的里程碑，更是挺进名副其实的 IOS Senior Development Engineer的一大步！


###Why?为什么要写这个工具类？

  经常在项目里要用到`SDWebImage`的类来异步加载图片，于是考虑用代码分层的理念和方案，单独写了一个`MAImageViewTool`工具类用于调用`SDWebImage`异步加载图片，后期如果项目需要修改就只需要在这个工具类里改写和调试，不用在整个项目里批量寻找再一段一段改写代码了，提高了效率。
  
  在这个类里增加了`渐现Alpha图片加载`和`菊花Indicator动画加载`的效果，有需要的攻城狮可以用来看看效果。
  


###Void＃请求方法################################################

```c

/** 设置普通图片加载 **/
+(void)MA_setImageWithUrlString:(NSString *)urlString placeHolder:(UIImage *)placeHolderImage imageView:(UIImageView *)imageView;


/**设置渐现图片加载**/
+(void)MA_setChangeAlphaImageWithUrlString:(NSString *)urlString placeHolder:(UIImage *)placeHolderImage imageView:(UIImageView *)imageView;


/** 设置菊花动画的等待图片 **/
+(void)MA_setIndicatorImageWithUrlString:(NSString *)urlString placeHolder:(UIImage *)placeHolderImage imageView:(UIImageView *)imageView;


/** 清除图片缓存 **/
+(void)MA_clearImages;

```
###Other其他
个人觉得`AFNetworking`方面的API请求，也使用代码封层的理念来分层封装比较合理，后期抽空会一起整理出来，大家共同探讨。

最近刚在学习使用github和markdown语言，还不太熟悉，但是觉得很有趣，嘻嘻……^_^ 

很希望自己不再是一个孤独的攻城狮，希望能有更多的狮子一起共勉探讨学习，共同进步！

我的联系方式 ： QQ   996174446  ［验证：IOS攻城狮］
