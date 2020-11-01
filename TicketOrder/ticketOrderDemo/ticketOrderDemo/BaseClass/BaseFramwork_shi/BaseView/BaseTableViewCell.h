//
//  BaseTableViewCell.h
//  Seed
//
//  Created by shi1234ww on 2020/10/8.
//  Copyright © 2020 introtec. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseTableViewCell : UITableViewCell
@property(nonatomic , strong) UIImageView *rightIconImageView;
@property(nonatomic , copy) NSString *rightIconImgName;
@property(nonatomic , strong) UIView *bottomLineView;
@end

NS_ASSUME_NONNULL_END
