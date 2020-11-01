//
//  BaseService.m
//  Seed
//
//  Created by shi1234ww on 2020/10/5.
//  Copyright © 2020 introtec. All rights reserved.
//


#import "BaseService.h"

@implementation BaseService

- (NSMutableArray *)responseArray{
    if (!_responseArray) {
        _responseArray = [[NSMutableArray alloc] init];
    }
    return _responseArray;
}

- (NSMutableArray *)dataSourceArray{
    if (!_dataSourceArray) {
        _dataSourceArray = [[NSMutableArray alloc] init];
    }
    return _dataSourceArray;
}

- (void)buildDataSource:(CompleteBlock)complete{}



@end
