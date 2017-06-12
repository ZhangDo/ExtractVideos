//
//  DeviceUtility.h
//  Coach
//
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <AVFoundation/AVFoundation.h>

#define iPhone4_5ScreenWidth   320
#define iPhone6ScreenWidth     375
#define iPhone6PlusScreenWidth 414

#define SCREEN_HEIGHT           [DeviceUtility screenHeight]
#define SCREEN_WIDTH            [DeviceUtility screenWidth]
#define SCREEN_SCALE            [[UIScreen mainScreen] scale]
#define SCALE(a)                (SCREEN_SCALE > 0.0 ? (a) / SCREEN_SCALE : (a))

// 以iPhone4/5为基础的屏幕比例
#define LargeScreenScale  (SCREEN_WIDTH/iPhone4_5ScreenWidth)
// 以iPhone6为基础的屏幕比例（用于iPhone6尺寸的设计图做等比缩放）
#define ScreenScale6    (SCREEN_WIDTH/iPhone6ScreenWidth)


#define Multiplier_Scale        [DeviceUtility multiplierScale]
#define Multiplier_Adapt_Plus   [DeviceUtility multiplierAdaptPlus]

#define NAV_HEIGHT 64
#define TAB_HEIGHT 49


@interface DeviceUtility : NSObject

+ (CGFloat)iosVersion;
+ (NSInteger)iosMajorVersion;
+ (BOOL)isiOS5;
+ (BOOL)isiOS7;
+ (BOOL)isiOSGreaterThan7;
+ (BOOL)isiOSGreaterThan8;

+ (NSString*)carrierName;

+ (BOOL)isRetina;
+ (BOOL)is3Dot5InchesScreen;
+ (BOOL)isFourInchesScreen;
+ (BOOL)is4Dot7InchesScreen;
+ (BOOL)is5Dot5InchesScreen;

+ (CGFloat)screenHeight;
+ (CGFloat)screenWidth;

+ (CGFloat)multiplierScale;
+ (CGFloat)multiplierAdaptPlus;

+ (NSString*)deviceString;
+ (NSString*)deviceName;

@end
