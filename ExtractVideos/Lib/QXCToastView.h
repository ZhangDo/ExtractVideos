//
//  QXCToastView.h
//  Coach
//

//

#import <UIKit/UIKit.h>

@interface QXCToastView : UIView

@property(nonatomic,copy)NSString* content;

+ (instancetype)toastWithContent:(NSString*)content;

- (instancetype)initWithContent:(NSString*)content;

- (void)showInView:(UIView*)view
           center:(CGPoint)center
           hideIn:(NSTimeInterval)time
        afterHide:(void(^)(void))block;


-(void)showInView:(UIView *)view center:(CGPoint)center;

-(void)hide;

@end
