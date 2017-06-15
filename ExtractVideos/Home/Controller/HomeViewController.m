//
//  HomeViewController.m
//  ExtractVideos
//
//  Created by zhangdong on 2017/6/2.
//  Copyright © 2017年 zhangdong. All rights reserved.
//

#import "HomeViewController.h"
#import "DeviceUtility.h"
#import "HomeNullView.h"
#import <Masonry.h>
#import "Const.h"
#import "WYWebProgressLayer.h"
#import "CRToast.h"
#import "CommonUtility.h"
#import <WebKit/WebKit.h>
#import "AFNetworking.h"
#import "UIDownloadBar.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import "PSYouTubeExtractor.h"
#import "UIViewController+QXCToast.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import "AppDelegate.h"
#import "DownLoadView.h"
#import "SJYouTubeIDParser.h"

@interface HomeViewController () <UIWebViewDelegate,UIDownloadBarDelegate>
{
    UIDownloadBar *bar;
    PSYouTubeExtractor *extractor;
    NSString *getURL;


}
@property (nonatomic, strong) UIImageView *titleViewImageView;
@property (nonatomic, strong) UITextField *linkTextField;
@property (nonatomic, strong) HomeNullView *nullView;
@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, strong) WYWebProgressLayer *progressLayer;
@property (nonatomic, strong) UIButton *dowloadBtn;
@property (nonatomic, strong) UIView *progressView;


@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    getURL = @"";
    extractor = [[PSYouTubeExtractor alloc] init];
    [self creatNUllView];
    [self creatTitleView];
    [self creatBarButton];
    [self creatDownloadBtn];
}

#pragma mark --- 创建NULLView
- (void)creatNUllView {
    self.nullView = [[HomeNullView alloc] init];
    [self.view addSubview:self.nullView];
    [self.nullView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self.view);
    }];
}
#pragma mark --- 创建titleView
- (void)creatTitleView {
    
    self.linkTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH - 100, 25)];
    self.linkTextField.layer.masksToBounds =YES;
    self.linkTextField.layer.cornerRadius = 12;
//    self.linkTextField.layer.borderWidth = SCALE(1);
//    self.linkTextField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.linkTextField.font = [UIFont systemFontOfSize:FONTSIZE_24];
    self.linkTextField.backgroundColor = COLOR_246;
    self.linkTextField.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 8, 0)];
    
    self.linkTextField.leftViewMode = UITextFieldViewModeAlways;
    self.linkTextField.placeholder = @"在此输入网址";
    self.linkTextField.keyboardType = UIKeyboardTypeURL;
    
    self.navigationItem.titleView = self.linkTextField;
}

- (void)creatBarButton {
    
    UIImage *leftImage = [[UIImage imageNamed:@"refresh"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *leftImageItem = [[UIBarButtonItem alloc] initWithImage:leftImage style:UIBarButtonItemStylePlain target:self action:@selector(refresh)];
    self.navigationItem.leftBarButtonItem = leftImageItem;
    
    
    UIImage *tipImg = [[UIImage imageNamed:@"search"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *tipItem = [[UIBarButtonItem alloc] initWithImage:tipImg style:UIBarButtonItemStylePlain target:self action:@selector(serachVideo)];
    self.navigationItem.rightBarButtonItem = tipItem;
}
#pragma mark --- 创建webView
- (void)creatWebView {
   
    self.webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - NAV_HEIGHT)];
    self.webView.backgroundColor = [UIColor whiteColor];
    self.webView.allowsInlineMediaPlayback = NO;
    self.webView.delegate = self;
    self.progressLayer = [[WYWebProgressLayer alloc] init];
    self.progressLayer.frame = CGRectMake(0, 42, SCREEN_WIDTH, 1);
    [self.navigationController.navigationBar.layer addSublayer:self.progressLayer];
    [self.view addSubview:self.webView];
   

}

#pragma mark -- 创建下载Button
- (void)creatDownloadBtn {
    self.dowloadBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.dowloadBtn setBackgroundImage:[UIImage imageNamed:@"download"] forState:UIControlStateNormal];
    self.dowloadBtn.contentMode = UIViewContentModeScaleAspectFit;
    [self.dowloadBtn addTarget:self action:@selector(download:) forControlEvents:UIControlEventTouchUpInside];
    [kAppWindow addSubview:self.dowloadBtn];
    [self.dowloadBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(kAppWindow).offset(-20);
        make.bottom.equalTo(kAppWindow).offset(-60);
        make.size.mas_equalTo(CGSizeMake(60, 60));
    }];

}

#pragma mark --- 创建下载进度

- (void)creatProgressView {
    self.progressView = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 60)];
    self.progressView.backgroundColor = [UIColor whiteColor];
    [kAppWindow addSubview:self.progressView];
}

- (void)serachVideo {
    
    self.webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - NAV_HEIGHT)];
    self.webView.backgroundColor = [UIColor whiteColor];
    self.webView.allowsInlineMediaPlayback = NO;
    self.webView.delegate = self;
    self.progressLayer = [[WYWebProgressLayer alloc] init];
    self.progressLayer.frame = CGRectMake(0, 42, SCREEN_WIDTH, 1);
    [self.navigationController.navigationBar.layer addSublayer:self.progressLayer];
    [self.view addSubview:self.webView];

    [self.linkTextField resignFirstResponder];

    if (self.linkTextField.text.length == 0) {

        UIAlertAction *alertaction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        
        UIAlertController *aleartVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"输入的网址可能有误" preferredStyle:UIAlertControllerStyleAlert];
        [aleartVC addAction:alertaction];
        [self.navigationController presentViewController:aleartVC animated:YES completion:nil];
        return;
    } else {
        [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.linkTextField.text]]];

        if (![self.linkTextField.text containsString:@"youtube"]) {
            NSURL *otherURL = [NSURL URLWithString:self.linkTextField.text];
            
            
           [extractor getVideoUrlURL:otherURL success:^(NSURL *URL) {
               [_progressLayer finishedLoad];
               [self showToastMessage:@"视频链接获取成功，点击下载✌️"];
               getURL = [URL absoluteString];
               NSLog(@"URL ==== %@",URL);
           } failure:^(NSError *error) {
               NSLog(@"error ==== %@",error);
               getURL = @"https://video-hkg3-2.xx.fbcdn.net/v/t42.1790-2/18962038_168848720318855_7539543019129667584_n.mp4?efg=eyJ2ZW5jb2RlX3RhZyI6InN2ZV9zZCJ9&oh=fea21974e3cfa18f3e4327b54acc2720&oe=5938EAB3";
           }];
            
        }
    }
    
}

#pragma mark --- 重新加载
- (void)refresh {
    [self.webView reload];
}
//页面开始加载时调用
- (void)webViewDidStartLoad:(UIWebView *)webView {
    [_progressLayer startLoad];
}
// 页面加载完成之后调用
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [_progressLayer finishedLoad];

    [UIView animateWithDuration:0.2 animations:^{
        self.nullView.alpha = 0.0;
    } completion:^(BOOL finished) {
        self.nullView.hidden = YES;
    }];
    if ([self.linkTextField.text containsString:@"youtu"]) {
        NSDictionary *options = @{
                                  kCRToastTextKey : @"点击视频获取下载地址",
                                  kCRToastTextAlignmentKey : @(NSTextAlignmentCenter),
                                  kCRToastBackgroundColorKey : [CommonUtility colorWithHexString:@"5C9EEA"],
                                  kCRToastAnimationInTypeKey : @(CRToastAnimationTypeSpring),
                                  kCRToastAnimationOutTypeKey : @(CRToastAnimationTypeSpring),
                                  kCRToastAnimationInDirectionKey : @(CRToastAnimationDirectionTop),
                                  kCRToastAnimationOutDirectionKey : @(CRToastAnimationDirectionBottom)
                                  };
        [CRToastManager showNotificationWithOptions:options
                                    completionBlock:^{
                                    }];

    } else {
    
    }
    
    

}
// 页面加载失败时调用
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    [_progressLayer finishedLoad];

}

- (void)dealloc {
    
    [_progressLayer closeTimer];
    [_progressLayer removeFromSuperlayer];
    _progressLayer = nil;
    
}

- (void)download:(UIButton *)sender {
    [self creatProgressView];
    
    [self.webView setUserInteractionEnabled:NO];
    
    UIUserInterfaceIdiom userInterfaceIdiom = [UIDevice currentDevice].userInterfaceIdiom;
    
    
//    if (userInterfaceIdiom == UIUserInterfaceIdiomPhone) {
    
//    } else {
//        getURL = [self.webView stringByEvaluatingJavaScriptFromString:@"function getURL() {var bh = document.getElementsByClassName('bh'); if (bh.length) {return bh[0].getAttribute('src');} else {var zq = document.getElementsByClassName('zq')[0]; return zq.getAttribute('src');}} getURL();"];
//    }
    
//    NSString *getTitle = [self.webView stringByEvaluatingJavaScriptFromString:@"function getTitle() {var jm = document.getElementsByClassName('jm'); if (jm.length) {return jm[0].innerHTML;} else {var lp = document.getElementsByClassName('lp')[0]; return lp.childNodes[0].innerHTML;}} getTitle();"];
//    
//    NSString *getTitleFromChannel = [self.webView stringByEvaluatingJavaScriptFromString:@"function getTitleFromChannel() {var video_title = document.getElementById('video_title'); return video_title.childNodes[0].innerHTML;} getTitleFromChannel();"];
    
    //NSLog(@"%@, %@, %@", getURL, getTitle, getTitleFromChannel);
    if ([self.linkTextField.text containsString:@"youtu"]) {
         getURL = [self.webView stringByEvaluatingJavaScriptFromString:@"function getURL() {var player = document.getElementById('player'); var video = player.getElementsByTagName('video')[0]; return video.getAttribute('src');} getURL();"];
    } else if ([self.linkTextField.text containsString:@"facebook"]) {
        getURL = [self.webView stringByEvaluatingJavaScriptFromString:@"function getFaceURL() {var player = document.getElementById('mInlineVideoPlayer'); var video = player.getElementsByTagName('_2c9v _53mv')[0]; return video.getAttribute('src');} getFaceURL()"];
    }
    [self.webView setUserInteractionEnabled:YES];
//    NSArray *components = [getTitle componentsSeparatedByCharactersInSet:[[NSCharacterSet alphanumericCharacterSet] invertedSet]];
//    getTitle = [components componentsJoinedByString:@" "];
    
    if ([getURL length] >0) {
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        SJYouTubeIDParser *youtubeParser = [SJYouTubeIDParser defaultParser];
        youtubeParser.APIKey = @"AIzaSyCTu9h7PfHd7LI0Wy7Ep4VY4tM40fWOxb4";
        [youtubeParser getVideoInfoFromURL:self.linkTextField.text completionHandler:^(NSString *videoID, NSString *videoTitle, NSURL *thumbnailURL, NSString *videoDescription, NSString *viewCount, long long likeCount, long long dislikeCount, NSDate *uploaded, NSString *uploader, NSError *error) {
            [MBProgressHUD hideHUDForView:self.view animated:NO];
            DownLoadView *downLoadView = [[DownLoadView alloc] initVideoTitle:videoTitle videoDescription:videoDescription thumbnailImageURL:thumbnailURL videoURLstr:getURL];
            [downLoadView show];
        }];
        
    } else {
        UIAlertAction *alertaction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        UIAlertController *aleartVC = [UIAlertController alertControllerWithTitle:@"未获取到视频地址" message:@"可能原因：未点击播放视频" preferredStyle:UIAlertControllerStyleAlert];
        [aleartVC addAction:alertaction];
        [self.navigationController presentViewController:aleartVC animated:YES completion:nil];
    
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
