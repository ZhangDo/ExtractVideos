//
//  WLWebProgressLayer.h
//  WangliBank
//
//  Created by 王启镰 on 16/6/22.
//  Copyright © 2016年 iSoftstone infomation Technology (Group) Co.,Ltd. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface WYWebProgressLayer : CAShapeLayer

- (void)finishedLoad;
- (void)startLoad;

- (void)closeTimer;

@end
