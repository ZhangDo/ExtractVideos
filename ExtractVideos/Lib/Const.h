//
//  Const.h
//  Coach
//

//

#ifndef Const_h
#define Const_h

#define kAppDelegate                       ((AppDelegate *)[[UIApplication sharedApplication] delegate])
#define kAppWindow                         [kAppDelegate window]

// 尺寸
#define kPageSize               10
#define kScheduluHeight         59
#define kScheduluHeaderHeight   64
#define BUTTTON_CORNER_RADIUS   5
#define CELL_LEFTRIGHT_EDGE     17
#define OUTCELL_LEFTRIGHT_EDGE  10

// 颜色
#define RGBCOLOR(r,g,b)                   [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r,g,b,a)                [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

#define COLOR_CONTROLLER_ORINGE           [UIColor colorWithRed:255/255.0f green:101/255.0f blue:26/255.0f alpha:1.0]
#define COLOR_CONTROLLER_GREEN            [UIColor colorWithRed:110/255.0f green:187/255.0f blue:26/255.0f alpha:1.0]
#define COLOR_COACH_TAG                   [UIColor colorWithRed:92/255.0f green:101/255.0f blue:118/255.0f alpha:1.0]


#define TextColor                          RGBCOLOR(89, 104, 112)
#define COLOR_246                          RGBCOLOR(246, 246, 246)
#define COLOR_251                          RGBCOLOR(251, 251, 251)
#define COLOR_132                          RGBCOLOR(132, 132, 132)
#define COLOR_134                          RGBCOLOR(134, 134, 134)
#define COLOR_105                          RGBCOLOR(105, 105, 105)
#define COLOR_51                          [UIColor colorWithRed:51/255.0f green:51/255.0f blue:51/255.0f alpha:1.0]
#define COLOR_61                          RGBCOLOR(61, 61, 61)
#define COLOR_64                          RGBCOLOR(64, 64, 64)
#define COLOR_96                          RGBCOLOR(96, 96, 96)
#define COLOR_102                         [UIColor colorWithRed:102/255.0f green:102/255.0f blue:102/255.0f alpha:1.0]
#define COLOR_117                         [UIColor colorWithRed:117/255.0f green:117/255.0f blue:117/255.0f alpha:1.0]
#define COLOR_151                         [UIColor colorWithRed:151/255.0f green:151/255.0f blue:151/255.0f alpha:1.0]
#define COLOR_153                         [UIColor colorWithRed:153/255.0f green:153/255.0f blue:153/255.0f alpha:1.0]
#define COLOR_155                         [UIColor colorWithRed:155/255.0f green:155/255.0f blue:155/255.0f alpha:1.0]
#define COLOR_170                         [UIColor colorWithRed:170/255.0f green:170/255.0f blue:170/255.0f alpha:1.0]
#define COLOR_187                         [UIColor colorWithRed:187/255.0f green:187/255.0f blue:187/255.0f alpha:1.0]
#define COLOR_183                         RGBCOLOR(183, 183, 183)
#define COLOR_195                         [UIColor colorWithRed:195/255.0f green:195/255.0f blue:195/255.0f alpha:1.0]
#define COLOR_201                         RGBCOLOR(201, 201, 201)
#define COLOR_204                         [UIColor colorWithRed:204/255.0f green:204/255.0f blue:204/255.0f alpha:1.0]
#define COLOR_206                         RGBCOLOR(206, 206, 206)
#define COLOR_212                         RGBCOLOR(212, 212, 212)
#define COLOR_214                         RGBCOLOR(214, 214, 214)
#define COLOR_223                         [UIColor colorWithRed:223/255.0f green:223/255.0f blue:223/255.0f alpha:1.0]
#define COLOR_229                         [UIColor colorWithRed:229/255.0f green:229/255.0f blue:229/255.0f alpha:1.0]
#define COLOR_233                         [UIColor colorWithRed:233/255.0f green:233/255.0f blue:233/255.0f alpha:1.0]
#define COLOR_238                         [UIColor colorWithRed:238/255.0f green:238/255.0f blue:238/255.0f alpha:1.0]
#define COLOR_240                         [UIColor colorWithRed:240/255.0f green:240/255.0f blue:240/255.0f alpha:1.0]
#define COLOR_244                         [UIColor colorWithRed:244/255.0f green:244/255.0f blue:244/255.0f alpha:1.0]
#define COLOR_250                         [UIColor colorWithRed:250/255.0f green:250/255.0f blue:250/255.0f alpha:1.0]

#define COLOR_CELL_SELECTED               [UIColor colorWithRed:133.0/255.0 green:133.0/255.0 blue:133.0/255.0 alpha:0.3]
#define COLOR_MYPROGRAME                  [UIColor colorWithRed:250/255.0 green:88/255.0 blue:0/255.0 alpha:1.0]

#define COLOR_CURRICULUM_HASOPEN          [UIColor whiteColor]
#define COLOR_CURRICULUM_HASBOOK          COLOR_CONTROLLER_ORINGE

#define COLOR_SuccessGreen                RGBCOLOR(47, 231, 136)


#define maskViewColor    [UIColor colorWithRed:53/255.0 green:54/255.0 blue:55/255.0 alpha:0.6]


// 文字颜色
#define COLOR_GREEN                       [UIColor colorWithRed:25/255.0f green:203/255.0f blue:101/255.0f alpha:1.0]

// V 3.5.0
#define COLOR_ONEPIXLINE                  [UIColor colorWithRed:236.0/255.0 green:236.0/255.0 blue:236.0/255.0 alpha:1.0]
#define COLOR_SECTIONHEADER               [UIColor colorWithRed:141.0/255.0 green:153.0/255.0 blue:162.0/255.0 alpha:1.0]
#define COLOR_COMBOTITLE                  [UIColor colorWithRed:77.0/255.0 green:99.0/255.0 blue:111.0/255.0 alpha:1.0]
#define COLOR_COMBODESC                   [UIColor colorWithRed:138/255.0 green:150/255.0 blue:157/255.0 alpha:1.0]
#define COLOR_SCHOOLDIST                  [UIColor colorWithRed:255.0/255.0 green:101.0/255.0 blue:26.0/255.0 alpha:1.0]
#define COLOR_CONSULTTITLE                [UIColor colorWithRed:90.0/255.0 green:98.0/255.0 blue:105.0/255.0 alpha:1.0]
#define COLOR_SECTION_HEADER              [UIColor colorWithRed:91.0/255.0 green:95.0/255.0 blue:98.0/255.0 alpha:1.0]
#define COLOR_PROBLEMSEG_TEXT             [UIColor colorWithRed:63.0/255.0 green:74.0/255.0 blue:82.0/255.0 alpha:1.0]
#define COLOR_PROBLEMSEG_TEXT2            [UIColor colorWithRed:91.0/255.0 green:85.0/255.0 blue:98.0/255.0 alpha:1.0]
// 字号
#define FONTSIZE_18  (([DeviceUtility is4Dot7InchesScreen]||[DeviceUtility is5Dot5InchesScreen]) ? 9:8)
#define FONTSIZE_20  (([DeviceUtility is4Dot7InchesScreen]||[DeviceUtility is5Dot5InchesScreen]) ? 10:9)
#define FONTSIZE_22  (([DeviceUtility is4Dot7InchesScreen]||[DeviceUtility is5Dot5InchesScreen]) ? 11:10)
#define FONTSIZE_24  (([DeviceUtility is4Dot7InchesScreen]||[DeviceUtility is5Dot5InchesScreen]) ? 12:11)
#define FONTSIZE_26  (([DeviceUtility is4Dot7InchesScreen]||[DeviceUtility is5Dot5InchesScreen]) ? 13:11)
#define FONTSIZE_28  (([DeviceUtility is4Dot7InchesScreen]||[DeviceUtility is5Dot5InchesScreen]) ? 14:12)
#define FONTSIZE_30  (([DeviceUtility is4Dot7InchesScreen]||[DeviceUtility is5Dot5InchesScreen]) ? 15:13)
#define FONTSIZE_32  (([DeviceUtility is4Dot7InchesScreen]||[DeviceUtility is5Dot5InchesScreen]) ? 16:14)
#define FONTSIZE_34  (([DeviceUtility is4Dot7InchesScreen]||[DeviceUtility is5Dot5InchesScreen]) ? 17:15)
#define FONTSIZE_36  (([DeviceUtility is4Dot7InchesScreen]||[DeviceUtility is5Dot5InchesScreen]) ? 18:16)
#define FONTSIZE_37  (([DeviceUtility is4Dot7InchesScreen]||[DeviceUtility is5Dot5InchesScreen]) ? 18.5:16.5)
#define FONTSIZE_40  (([DeviceUtility is4Dot7InchesScreen]||[DeviceUtility is5Dot5InchesScreen]) ? 20:18)
#define FONTSIZE_48  (([DeviceUtility is4Dot7InchesScreen]||[DeviceUtility is5Dot5InchesScreen]) ? 23:21)
#define FONTSIZE_56  (([DeviceUtility is4Dot7InchesScreen]||[DeviceUtility is5Dot5InchesScreen]) ? 56:50)

#define numberFontName  @"DIN Condensed"


#if DEBUG
#define DEBUG_LOG
#endif


#ifdef DEBUG_LOG
#define DMLog(...)         NSLog(@"%s %@", __PRETTY_FUNCTION__, [NSString stringWithFormat:__VA_ARGS__])
#define DMLogRect(rect)    DMLog(@"%s x:%.4f, y:%.4f, w:%.4f, h:%.4f", #rect, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height)
#define DMLogSize(size)    DMLog(@"%s w:%.4f, h:%.4f", #size, size.width, size.height)
#define DMLogPoint(point)  DMLog(@"%s x:%.4f, y:%.4f", #point, point.x, point.y)
#define NSLog(FORMAT, ...) fprintf(stderr,"[%s:%d行] %s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define DMLog(...)         do { } while (0)
//#define NSLog(...)         do { } while (0)
#define NSLog(FORMAT, ...) nil
#endif




#endif /* Const_h */
