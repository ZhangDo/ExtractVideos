//
//  DownLoadView.m
//  ExtractVideos
//
//  Created by zhangdong on 2017/6/12.
//  Copyright © 2017年 zhangdong. All rights reserved.
//

#import "DownLoadView.h"
#import "Const.h"
#import "DeviceUtility.h"
#import <Masonry.h>
#import "AppDelegate.h"
#import "DownLoadView.h"
#import "UIImageView+WebCache.h"
#import "UIDownloadBar.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import "UIViewController+QXCToast.h"
#import "CommonUtility.h"

@interface DownLoadView () <UIDownloadBarDelegate>
@property (nonatomic, assign) BOOL hasShow;
@property (nonatomic, strong) UIDownloadBar *bar;
@property (nonatomic, strong) UILabel *progressLabel;
@property (nonatomic, strong) UIButton *lookBtn;
//@property
@end
@implementation DownLoadView

- (instancetype)initVideoTitle:(NSString *)title videoDescription:(NSString *)description thumbnailImageURL:(NSURL *)imageURL videoURLstr:(NSString *)URLstr; {
    self = [super initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    if (self) {
        UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
        UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
        effectView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        effectView.alpha = 0.97f;
        [self addSubview:effectView];

        UIView *bgView = [[UIView alloc] init];
        bgView.backgroundColor = [UIColor whiteColor];
        bgView.layer.cornerRadius = 4;
        bgView.layer.masksToBounds = YES;
        [self addSubview:bgView];
        
        [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
            make.left.equalTo(self.mas_left).offset(27);
            make.right.equalTo(self.mas_right).offset(-27);
            make.top.equalTo(self).offset(100);
            make.bottom.equalTo(self).offset(-100);
        }];
        
        UIImageView *thumbnailImageView = [[UIImageView alloc] init];
        thumbnailImageView.contentMode = UIViewContentModeScaleAspectFill;
        thumbnailImageView.backgroundColor = [UIColor lightGrayColor];
        thumbnailImageView.layer.cornerRadius = 2;
        thumbnailImageView.layer.masksToBounds = YES;
        [thumbnailImageView sd_setImageWithURL:imageURL placeholderImage:nil];

        [bgView addSubview:thumbnailImageView];
        
        [thumbnailImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(bgView);
            make.top.equalTo(bgView).offset(30);
            make.size.mas_equalTo(CGSizeMake(230, 140));
        }];
        
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.font = [UIFont systemFontOfSize:FONTSIZE_32];
        titleLabel.textColor = [UIColor blackColor];
        titleLabel.text = title;
        titleLabel.numberOfLines = 0;
        [bgView addSubview:titleLabel];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(bgView).offset(20);
            make.right.equalTo(bgView).offset(-20);
            make.top.equalTo(thumbnailImageView.mas_bottom).offset(25);
        }];
        
        self.progressLabel = [[UILabel alloc] init];
        self.progressLabel.textAlignment = NSTextAlignmentCenter;
        self.progressLabel.textColor = [UIColor blackColor];
        self.progressLabel.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:FONTSIZE_56];
        [bgView addSubview:self.progressLabel];
        [self.progressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(bgView);
            make.top.equalTo(titleLabel.mas_bottom).offset(30);
        }];
        
        
        self.lookBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.lookBtn setBackgroundColor:[UIColor blackColor]];
        [self.lookBtn setTitle:@"点击查看" forState:UIControlStateNormal];
        self.lookBtn.layer.cornerRadius = 35/2;
        self.lookBtn.layer.masksToBounds = YES;
        self.lookBtn.titleLabel.font = [UIFont systemFontOfSize:FONTSIZE_32];
        self.lookBtn.alpha = 0.0f;
        [self.lookBtn addTarget:self action:@selector(look:) forControlEvents:UIControlEventTouchUpInside];
        [bgView addSubview:self.lookBtn];
        [self.lookBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(bgView);
            make.size.mas_equalTo(CGSizeMake(130, 35));
            make.top.equalTo(self.progressLabel.mas_bottom).offset(20);
        }];
        
      self.bar = [[UIDownloadBar alloc] initWithURL:[NSURL URLWithString:URLstr]
                                progressBarFrame:CGRectZero
                                         timeout:15
                                        delegate:self];
        
        [self.bar setProgressViewStyle:UIProgressViewStyleBar];
        
        [bgView addSubview:self.bar];
        [self.bar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(bgView);
            make.height.mas_equalTo(@2);
        }];
        
    }
    return self;
}

- (void)show
{
    if (self.hasShow) {
        return;
    }
    self.hasShow = YES;
    
    [kAppDelegate.window addSubview:self];
    self.layer.transform = CATransform3DMakeScale(1.2f, 1.2f, 1.0f);
    self.alpha = 0.0f;
    
    [UIView animateWithDuration:0.3
                          delay:0.0 options:UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         
                         self.layer.transform = CATransform3DIdentity;
                         self.alpha = 1.0f;
                         
                     } completion:^(BOOL finished) {
                         
                     }];
    
}

- (void)hide
{
    self.hasShow = NO;
    [UIView animateWithDuration:0.3
                          delay:0
                        options: UIViewAnimationOptionCurveEaseIn | UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         
                         self.alpha = 0.0f;
                         
                     }
                     completion:^(BOOL finished) {
                         
                         if ( finished )
                         {
                             [self removeFromSuperview];
                         }
                         
                     }];
}



- (void)downloadBar:(UIDownloadBar *)downloadBar didFinishWithData:(NSData *)fileData suggestedFilename:(NSString *)filename {
    
    
    NSString *filePath = [NSString stringWithFormat:@"%@/Documents/%@.mp4", NSHomeDirectory(),@"hah"];
    [fileData writeToFile:filePath atomically:YES];
    
    
    NSLog(@"filePath === %@",filePath);
    
    
    
    ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
    
    [library writeVideoAtPathToSavedPhotosAlbum:[NSURL fileURLWithPath:filePath]
                                completionBlock:^(NSURL *assetURL, NSError *error) {
                                    
                                    if (error) {
                                        
                                        NSLog(@"Save video fail:%@",error);
                                        
                                    } else {
                                        
                                        [UIView animateWithDuration:0.3 animations:^{
                                            self.lookBtn.alpha = 1.0;
                                        }];
                                        
                                    }
                                }];
    
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    [fileManager createFileAtPath:[NSString stringWithFormat:@"%@.mp4", [[paths objectAtIndex:0] stringByAppendingPathComponent:@"hahah"]] contents:fileData attributes:nil];
    
    NSString *imagePath = [NSString stringWithFormat:@"%@.png", [[paths objectAtIndex:0] stringByAppendingPathComponent:@"hahah"]];
    
    AVAsset *asset = [[AVURLAsset alloc] initWithURL:[NSURL fileURLWithPath:[NSString stringWithFormat:@"%@.mp4", [[paths objectAtIndex:0] stringByAppendingPathComponent:@"hahah"]]] options:nil];
    
    AVAssetImageGenerator *imageGenerator = [[AVAssetImageGenerator alloc] initWithAsset:asset];
    
    Float64 durationSeconds = CMTimeGetSeconds(asset.duration);
    
    CMTime midpoint = CMTimeMakeWithSeconds(durationSeconds / 2.0, 600);
    CMTime actualTime;
    
    CGImageRef preImage = [imageGenerator copyCGImageAtTime:midpoint actualTime:&actualTime error:NULL];
    
    if (preImage != NULL) {
        CGRect rect = CGRectMake(0.0, 0.0, CGImageGetWidth(preImage) * 0.5, CGImageGetHeight(preImage) * 0.5);
        
        UIImage *image = [UIImage imageWithCGImage:preImage];
        
        UIGraphicsBeginImageContext(rect.size);
        
        [image drawInRect:rect];
        
        NSData *data = UIImagePNGRepresentation(UIGraphicsGetImageFromCurrentImageContext());
        
        [fileManager createFileAtPath:imagePath contents:data attributes:nil];
        
        UIGraphicsEndImageContext();
    }
    
    CGImageRelease(preImage);
    //    videoTitle = nil;
    
    [downloadBar removeFromSuperview];
   self.bar = nil;
    
    //    [downloadButton setEnabled:YES];
}

- (void)downloadBar:(UIDownloadBar *)downloadBar didFailWithError:(NSError *)error {
    
    
    [downloadBar removeFromSuperview];
    
    self.bar = nil;
}

- (void)downloadBarUpdated:(UIDownloadBar *)downloadBar {
    NSLog(@"progress  ==== %.1f",downloadBar.progress*100);
    self.progressLabel.text = [NSString stringWithFormat:@"%.1f%@",downloadBar.progress*100,@"%"];
}

- (void)look:(UIButton *)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"photos-redirect://"]
options:@{}
completionHandler:^(BOOL success) {
}];
    [self hide];
}

@end
