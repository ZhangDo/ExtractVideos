//
//  HomeNullView.m
//  ExtractVideo
//
//  Created by zhangdong on 2017/6/1.
//  Copyright © 2017年 zhangdong. All rights reserved.
//

#import "HomeNullView.h"
#import "Const.h"
#import "DeviceUtility.h"
#import <Masonry.h>
@implementation HomeNullView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        
        

        
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.font = [UIFont systemFontOfSize:FONTSIZE_26];
        titleLabel.textColor = COLOR_134;
        titleLabel.numberOfLines = 0;
        [self addSubview:titleLabel];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.centerY.equalTo(self).offset(-100);
            make.width.mas_equalTo(250);
        }];
        
        
        
        UIImageView *titleViewImageView = [[UIImageView alloc] init];
        titleViewImageView.image = [UIImage imageNamed:@"extract"];
        titleViewImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:titleViewImageView];
        [titleViewImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
            make.bottom.equalTo(titleLabel.mas_top).offset(-40);
            make.size.mas_equalTo(CGSizeMake(30, 30));
        }];

        
        
    }
    return self;
}
@end
