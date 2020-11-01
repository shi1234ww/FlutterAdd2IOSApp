//
//  BaseModel.m
//  Seed
//
//  Created by shi1234ww on 2020/10/4.
//  Copyright © 2020 introtec. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel
+(NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{
            @"dataArray" : @"data",
            @"isValidate" : @"data",
             
            };
}


@end
