//
//  BaseResult.h
//  Seed
//
//  Created by shi1234ww on 2020/10/7.
//  Copyright © 2020 introtec. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseResult : NSObject

@property(nonatomic , strong) NSNumber *code;
@property(nonatomic , copy) NSString *msg;
@property (nonatomic , strong) NSDictionary *data;

@end

NS_ASSUME_NONNULL_END
