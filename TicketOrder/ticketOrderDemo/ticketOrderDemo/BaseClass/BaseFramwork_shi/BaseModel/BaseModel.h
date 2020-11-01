//
//  BaseModel.h
//  Seed
//
//  Created by shi1234ww on 2020/10/4.
//  Copyright © 2020 introtec. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseModel : NSObject

@property(nonatomic , strong) NSNumber *code;
@property(nonatomic , copy) NSString *msg;
@property (nonatomic , strong) NSDictionary *data;



@property(nonatomic, strong) NSArray *dataArray;


@property (nonatomic , assign) BOOL isValidate;
@end

NS_ASSUME_NONNULL_END
