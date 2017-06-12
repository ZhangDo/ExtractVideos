//
//  UIViewController+QXCToast.h
//  Coach
//
//

#import <UIKit/UIKit.h>

@interface UIViewController (QXCToast)

- (void)showToastMessage:(NSString*)msg;

- (void)showToastMessage:(NSString*)msg withCenter:(CGPoint)center;

- (void)showToastMessage:(NSString*)msg
              withCenter:(CGPoint)center
               afterHide:(void(^)(void))block;

- (void)showToastMessage:(NSString*)msg
              withCenter:(CGPoint)center
                  inView:(UIView*)view
               afterHide:(void(^)(void))block;

- (void)showMBHUDAnimated:(BOOL)bAnitmate;

- (void)hideMBHUDAnimated:(BOOL)bAnimate;

- (void)showMBHUDTo:(UIView *)view animated:(BOOL)bAnimate;

- (void)hideMBHUDFor:(UIView *)view animated:(BOOL)bAnimate;
@end
