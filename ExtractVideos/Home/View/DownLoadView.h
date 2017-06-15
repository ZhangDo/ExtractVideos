//
//  DownLoadView.h
//  ExtractVideos
//
//  Created by zhangdong on 2017/6/12.
//  Copyright © 2017年 zhangdong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DownLoadView : UIView
- (instancetype)initVideoTitle:(NSString *)title videoDescription:(NSString *)description thumbnailImageURL:(NSURL *)imageURL videoURLstr:(NSString *)URLstr;
- (void)show;
- (void)hide;
@end
