//
//  BaseViewController.h
//  pocketEOS
//
//  Created by oraclechain on 2017/11/27.
//  Copyright © 2017年 oraclechain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavigationView.h"


typedef NS_ENUM(NSUInteger, FLUTTER_ROUTE_TYPE) {
    FLUTTER_ROUTE_TYPE_scenicSpot,
    FLUTTER_ROUTE_TYPE_city,
    FLUTTER_ROUTE_TYPE_article
};

/**
 控制器显示方式

 - DisplayModePush: 通过导航控制器push
 - DisplayModePresent: 通过控制器present
 */
typedef NS_ENUM(NSUInteger, DisplayMode) {
    DisplayModePush,
    DisplayModePresent,
};



@interface BaseViewController : UIViewController<UITableViewDelegate , UITableViewDataSource,  UIGestureRecognizerDelegate, NavigationViewDelegate>


@property(nonatomic, strong) UITableView *mainTableView;


@property(nonatomic, assign) DisplayMode displayMode;

@end
