//
//  UIViewController+QXCToast.m
//  Coach
//
//

#import "UIViewController+QXCToast.h"
#import "QXCToastView.h"
#import <MBProgressHUD/MBProgressHUD.h>

#define TOAST_MESSAGE_OFFSET 20.0f

@implementation UIViewController (QXCToast)

- (void)showToastMessage:(NSString*)msg
{
    
    [self showToastMessage:msg
                withCenter:CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds) - TOAST_MESSAGE_OFFSET)];
}


- (void)showToastMessage:(NSString*)msg withCenter:(CGPoint)center
{
    [self showToastMessage:msg
                withCenter:center
                 afterHide:nil];
}

- (void)showToastMessage:(NSString*)msg
              withCenter:(CGPoint)center
               afterHide:(void(^)(void))block
{
    
    if ([self toastInView:self.view] != nil) {
        return;
    }
    
    CGPoint center_ = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds) - TOAST_MESSAGE_OFFSET);
    if (! CGPointEqualToPoint(center, CGPointZero)) {
        center_ = center;
    }
    [[QXCToastView toastWithContent:msg] showInView:self.view
                                             center:center_
                                             hideIn:1.0f
                                          afterHide:block];
}

- (void)showToastMessage:(NSString*)msg
              withCenter:(CGPoint)center
                  inView:(UIView*)view
               afterHide:(void(^)(void))block
{
    if ([self toastInView:view] != nil) {
        return;
    }
    
    CGPoint center_ = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds) - TOAST_MESSAGE_OFFSET);
    if (! CGPointEqualToPoint(center, CGPointZero)) {
        center_ = center;
    }
    [[QXCToastView toastWithContent:msg] showInView:view
                                             center:center_
                                             hideIn:1.0f
                                          afterHide:block];
}


- (QXCToastView *)toastInView:(UIView *)view
{
    NSArray *viewArr = [view subviews];
    for (UIView *subView in viewArr) {
        if ([subView isKindOfClass:[QXCToastView class]]) {
            return (QXCToastView*)subView;
        }
    }
    return nil;
}

- (void)showMBHUDAnimated:(BOOL)bAnitmate
{
    [self showMBHUDTo:self.view animated:bAnitmate];
}

- (void)hideMBHUDAnimated:(BOOL)bAnimate
{
    [self hideMBHUDFor:self.view animated:bAnimate];
}

- (void)showMBHUDTo:(UIView *)view animated:(BOOL)bAnimate
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:bAnimate];
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.color = [UIColor colorWithPatternImage:[UIImage imageNamed:@"mbhudLoding"]];
}

- (void)hideMBHUDFor:(UIView *)view animated:(BOOL)bAnimate
{
    [MBProgressHUD hideHUDForView:view animated:bAnimate];
}
@end

