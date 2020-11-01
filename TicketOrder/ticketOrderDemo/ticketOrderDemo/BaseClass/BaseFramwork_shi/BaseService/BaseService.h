//
//  BaseService.h
//  Seed
//
//  Created by shi1234ww on 2020/10/5.
//  Copyright © 2020 introtec. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface BaseService : NSObject

typedef void(^CompleteBlock)(id service , BOOL isSuccess);


// 接口返回数据
@property(nonatomic, strong) NSMutableArray *responseArray;

// 控件数据源
@property(nonatomic, strong) NSMutableArray *dataSourceArray;


/**
 构建数据源

 @param complete 数据构建成功的回调
 */
- (void)buildDataSource:(CompleteBlock)complete;

@end
