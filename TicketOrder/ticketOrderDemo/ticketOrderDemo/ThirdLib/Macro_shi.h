//
//  Macro_shi.h
//  Seed
//
//  Created by shi1234ww on 2020/10/8.
//  Copyright © 2020 introtec. All rights reserved.
//

#ifndef Macro_shi_h
#define Macro_shi_h



// 弱引用
#define WeakSelf __weak typeof(self) weakSelf = self;


#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

/**
 *  statusbar height
 */
#define STATUSBAR_HEIGHT [[UIApplication sharedApplication] statusBarFrame].size.height
#define kNavBarHeight 44.0
#define TABBAR_HEIGHT ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49)
#define NAVIGATIONBAR_HEIGHT (STATUSBAR_HEIGHT + kNavBarHeight)
#define kIs_iPhoneX (SCREEN_WIDTH == 375.f && SCREEN_HEIGHT == 812.f)




/**
 *  UIApplication object
 */
#define UIAPPLICATION [UIApplication sharedApplication]

/**
 *  window object
 */
#define WINDOW [[[UIApplication sharedApplication] delegate] window]


/**
 *  device system version
 */
#define DEVICE_SYSTEM_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
///////////////////////////End: Device Macro definition///////////////////////////
//////////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////////////
///////////////////////////Begin: Function Macro definition/////////////////////////
/**
 *  object is not nil and null
 */
#define NotNilAndNull(_ref)  (((_ref) != nil) && (![(_ref) isEqual:[NSNull null]]))

/**
 *  object is nil or null
 */
#define IsNilOrNull(_ref)   (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]) || ([(_ref) isEqual:[NSNull class]]))

/**
 *  string is nil or null or empty
 */
#define IsStrEmpty(_ref)    (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]) ||([(_ref)isEqualToString:@""]))

/**
 *  Array is nil or null or empty
 */
#define IsArrEmpty(_ref)    (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]) ||([(_ref) count] == 0))

/**
 *  validate string
 */
#define VALIDATE_STRING(str) (IsNilOrNull(str) ? @"" : str)

/**
 *  update string
 */
#define UPDATE_STRING(old, new) ((IsNilOrNull(new) || IsStrEmpty(new)) ? old : new)

/**
 *  validate NSNumber
 */
#define VALIDATE_NUMBER(number) (IsNilOrNull(number) ? @0 : number)

/**
 *  update NSNumber
 */
#define UPDATE_NUMBER(old, new) (IsNilOrNull(new) ? old : new)

/**
 *  validate NSArray
 */
#define VALIDATE_ARRAY(arr) (IsNilOrNull(arr) ? [NSArray array] : arr)


/**
 *  validate NSMutableArray
 */
#define VALIDATE_MUTABLEARRAY(arr) (IsNilOrNull(arr) ? [NSMutableArray array] :     [NSMutableArray arrayWithArray: arr])



/**
 *  update NSArray
 */
#define UPDATE_ARRAY(old, new) (IsNilOrNull(new) ? old : new)

/**
 *  update NSDate
 */
#define UPDATE_DATE(old, new) (IsNilOrNull(new) ? old : new)

/**
 *  validate bool
 */
#define VALIDATE_BOOL(value) ((value > 0) ? YES : NO)

/**
 *  Url transfer
 */
#define String_To_URL(str) [NSURL URLWithString: str]

/**
 *  nil turn to null
 */
#define Nil_TURNTO_Null(objc) (objc == nil ? [NSNull null] : objc)
///////////////////////////End: Function Macro definition/////////////////////////
//////////////////////////////////////////////////////////////////////////////////


///////////////////////Begin: App Parameters Macro definition///////////////////////
////////////////////////////////////////////////////////////////////////////////////
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)

#define BACKGROUND_GRAY RGB(240, 240,240)
#define TEXTCOLOR_LIGHT_GRAY RGBA(0,0,0,0.3)
#define TEXTCOLOR_DARK_GRAY RGBA(0,0,0,0.7)

#define HEXCOLOR(hex) [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) / 255.0 green:((float)((hex & 0xFF00) >> 8)) / 255.0 blue:((float)(hex & 0xFF)) / 255.0 alpha:1]
#define RandomColor RGB(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255))


/**
 HEXCOLOR
 */
#define HEXCOLOR_333333 HEXCOLOR(0x333333)
#define HEXCOLOR_767676 HEXCOLOR(0x767676)
#define HEXCOLOR_FAFAFA HEXCOLOR(0xFAFAFA)







/**
 *  默认线条高度
 */
#define DEFAULT_LINE_HEIGHT 0.5f

#define DEFAULT_LABLE_HEIGHT 44.0f

#define DEFAULT_WIDTH_HEIGHT_SCALE 0.55f

#define MARGIN_10 10.0f
#define MARGIN_15 15.0f
#define MARGIN_20 20.0f



#define random(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define randomColor random(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

// 字体大小(常规/粗体)
#define BOLDSYSTEMFONT(FONTSIZE)[UIFont boldSystemFontOfSize:FONTSIZE]
#define SYSTEMFONT(FONTSIZE)    [UIFont systemFontOfSize:FONTSIZE]
#define FONT(NAME, FONTSIZE)    [UIFont fontWithName:(NAME) size:(FONTSIZE)]


// View 圆角和加边框
#define ViewBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]

// View 圆角
#define ViewRadius(View, Radius)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES]



/**
 *  defaults reuseIdentifier
 */
#define CELL_REUSEIDENTIFIER @"ListCell"

#define CELL_REUSEUDENTIFIER1 @"ListCell1"

#define CELL_REUSEUDENTIFIER2 @"ListCell2"

#define CELL_REUSEUDENTIFIER3 @"ListCell3"

#define CELL_REUSEIDENTIFIER_COLLECTION @"ListCell_Collection"

#define CELL_REUSEIDENTIFIER_COLLECTION1 @"ListCell_Collection1"


#define HEADERVIEW_REUSEUDENTIFIER @"HEADERVIEW"

#define collectionCellItemWidth (SCREEN_WIDTH / 4 * 3 - 25  ) / 2
#define collectionCellItemHeight collectionCellItemWidth * 100 / 120

#endif /* Macro_shi_h */
