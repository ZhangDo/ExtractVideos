//
//  QXCToastView.m
//  Coach
//

//

#import "QXCToastView.h"
#import "CommonUtility.h"
@interface QXCToastView()

@property (nonatomic, weak) UIView* backgroud;
@property (nonatomic, weak) UILabel* textLabel;

- (void)setup;
- (void)layout;
@end


@implementation QXCToastView
+ (instancetype)toastWithContent:(NSString*)content
{
    return [[QXCToastView alloc] initWithContent:content];
//    static QXCToastView* instance;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        instance = [[QXCToastView alloc] initWithContent:content];
//    });
//    return instance;
}

- (instancetype)initWithContent:(NSString*)content
{
    if (self = [super initWithFrame:CGRectZero]) {
        _content = [content copy];
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    return [self initWithContent:@""];
}

-(void)showInView:(UIView*)view
           center:(CGPoint)center
           hideIn:(NSTimeInterval)time
        afterHide:(void(^)(void))block
{
    if ([self superview]) {
        return;
    }
    self.alpha = .0f;
    [view addSubview:self];
    if (CGPointEqualToPoint(center, CGPointZero)) {
        self.center = view.center;
    }else{
        self.center = center;
    }
    
    [UIView animateWithDuration:.3f
                     animations:^{
                         self.alpha = 1.0f;
                     }
                     completion:^(BOOL finished) {
                         if (ABS(time - NSTimeIntervalSince1970) < CGFLOAT_MIN) {
                             NSLog(@"need to hide by code!~");
                         }else{
                             [UIView animateWithDuration:.3f
                                                   delay:time
                                                 options:0
                                              animations:^{
                                                  self.alpha = .0f;
                                              }
                                              completion:^(BOOL finished) {
                                                  [self removeFromSuperview];
                                                  if (block) {
                                                      block();
                                                  }
                                              }];
                         }
                     }];
}

-(void)showInView:(UIView *)view center:(CGPoint)center
{
    [self showInView:view
              center:center
              hideIn:NSTimeIntervalSince1970 // just use a big value here.
           afterHide:nil];
}

-(void)hide
{
    if (! [self superview]) {
        return;
    }
    
    [UIView animateWithDuration:.1f
                     animations:^{
                         self.alpha = .0f;
                     }
                     completion:^(BOOL finished) {
                         [self removeFromSuperview];
                     }];
}

-(void)setup
{
    UIView* background = [[UIView alloc] init];
    background.backgroundColor = [CommonUtility colorWithHexString:@"5C9EEA"];
    background.alpha = 1.0;
    [self addSubview:background];
    self.backgroud = background;
    
    UILabel* text = [[UILabel alloc] init];
    text.font = [UIFont systemFontOfSize:14.0f];
    text.numberOfLines = 0;
    text.textColor = [UIColor whiteColor];
    text.backgroundColor = [UIColor clearColor];
    text.textAlignment = NSTextAlignmentCenter;
    [self addSubview:text];
    self.textLabel = text;
    self.textLabel.text = self.content;
    
    self.layer.cornerRadius = 10;
    self.layer.masksToBounds = YES;
    
    [self layout];
}

- (void)setContent:(NSString *)content {
    if (_content != content) {
        _content = content;
        self.textLabel.text = content;
        [self layout];
    }
}

-(void)layout
{
    CGSize size = [self.content boundingRectWithSize:CGSizeMake(240, 320)
                                      options:NSStringDrawingTruncatesLastVisibleLine |
                                              NSStringDrawingUsesLineFragmentOrigin |
                                              NSStringDrawingUsesFontLeading
                                   attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.0f]}
                                      context:nil].size;
    
    self.textLabel.frame = CGRectMake(0, 0, size.width, size.height);
    
    self.bounds = CGRectMake(0, 0, size.width + 30, size.height + 15);
    self.backgroud.frame = self.bounds;
    
    self.textLabel.center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
}

@end
