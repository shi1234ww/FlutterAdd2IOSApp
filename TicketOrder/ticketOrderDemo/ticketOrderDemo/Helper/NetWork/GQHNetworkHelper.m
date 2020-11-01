////
////  GQHNetworkHelper.m
////
////  Created by GuanQinghao on 2019-05-08.
////  Copyright © 2019 GuanQinghao. All rights reserved.
////
//
//#import "GQHNetworkHelper.h"
//
//
//
///// 请求超时时长
//CGFloat const kTimeoutInterval = 30.0f;
//
//@implementation GQHNetworkHelper
//
//+ (AFHTTPSessionManager *)qh_shareManager {
//
//    static AFHTTPSessionManager *manager = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//
//        manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:GQHAPIServerBaseURL]];
//
//        // https安全策略
//        manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
//        // 不验证证书的域名
//        manager.securityPolicy.validatesDomainName = NO;
//        // 验证自建证书
//        manager.securityPolicy.allowInvalidCertificates = YES;
//
//
//
//
//        manager.requestSerializer = [AFJSONRequestSerializer serializer];
//        // 请求超时时长
//        manager.requestSerializer.timeoutInterval = kTimeoutInterval;
//        // 请求头内容格式
//        [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
//        [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//
//
//
//        [manager.requestSerializer setValue:[[UIDevice currentDevice] systemVersion] forHTTPHeaderField:@"SystemVersion"];
//        [manager.requestSerializer setValue:[NSString iphoneName] forHTTPHeaderField:@"DeviceType"];
//        [manager.requestSerializer setValue:[[[UIDevice currentDevice] identifierForVendor] UUIDString] forHTTPHeaderField:@"DeviceIdentifier"];
//        [manager.requestSerializer setValue:[NSDate getCurrentTimeStamp] forHTTPHeaderField:@"Timestamp"];
//
//
//
//
//        // 返回接受内容格式
//        manager.responseSerializer = [AFJSONResponseSerializer serializer];
//        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html", @"text/json", @"text/plain", @"text/javascript", @"text/xml", @"text/encode", @"multipart/form-data", @"image/jpeg", @"image/png", @"application/octet-stream", nil];
//    });
//
//    return manager;
//}
//
//#pragma mark - 鉴权网络请求
///**
// 自定义封装鉴权网络请求头
//
// @param auth 网络鉴权
// @param request 鉴权网络请求
// */
//+ (void)qh_packageHeaderWithAuth:(NSString *)auth request:(void(^)(AFHTTPSessionManager *manager))request {
//
//    AFHTTPSessionManager *manager = [GQHNetworkHelper qh_shareManager];
//
//    if (auth && auth.length > 0) {
//
//        // 设置用户鉴权
//        [manager.requestSerializer setValue:auth forHTTPHeaderField:kAPIAuthorizationKey];
//    } else {
//
//        // 设置初始鉴权
//        [manager.requestSerializer setValue:@"Basic emp0Yy1wYXJrLWFwcDphcHA=" forHTTPHeaderField:kAPIAuthorizationKey];
//    }
//
//    request(manager);
//}
//
//
//#pragma mark - 鉴权网络请求
///**
// 自定义封装鉴权网络请求头
//
// @param auth 网络鉴权
// @param request 鉴权网络请求
// */
//+ (void)qh_againPackageHeaderWithAuth:(NSString *)auth request:(void(^)(AFHTTPSessionManager *manager))request {
//
//    AFHTTPSessionManager *manager = [GQHNetworkHelper qh_shareManager];
//
//    if (auth && auth.length > 0) {
//
//        // 设置用户鉴权
//        [manager.requestSerializer setValue:auth forHTTPHeaderField:kAPIAuthorizationKey];
//    } else {
//
//        // 设置初始鉴权
//        [manager.requestSerializer setValue:@"" forHTTPHeaderField:kAPIAuthorizationKey];
//    }
//
//    request(manager);
//}
//
//+ (void)qh_authRequestGET:(NSString *)auth URL:(NSString *)URLString parameters:(id)parameters progress:(void (^)(NSProgress * _Nullable))progress handler:(GQHNetworkRequestHandler)handler {
//
//    if ([URLString containsString:@"/v1/item/"]||[URLString containsString:@"v1/seller"]) {
//
////        后台做了判断，这里为了商品详情单独写了一个获取managerd的方法，这里只是把kAPIAuthorizationKey的键改成@“”
//        [self qh_againPackageHeaderWithAuth:auth request:^(AFHTTPSessionManager *manager) {
//
//            NSLog(@"鉴权网络GET请求Auth:%@\nURL:%@%@\n请求参数:%@",auth,GQHAPIPathURL,URLString,parameters);
//            NSLog(@"allHTTPHeaderFields:%@", manager.requestSerializer.HTTPRequestHeaders);
//            [manager GET:[NSString stringWithFormat:@"%@%@",GQHAPIPathURL,URLString] parameters:parameters headers:nil progress:progress success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//
//                // 请求成功
//                [self requestSuccessful:responseObject handler:handler];
//            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//
//                // 请求失败
//                [self requestFailed:error handler:handler];
//            }];
//        }];
//    }else{
//        [self qh_packageHeaderWithAuth:auth request:^(AFHTTPSessionManager *manager) {
//
//            NSLog(@"鉴权网络GET请求Auth:%@\nURL:%@%@\n请求参数:%@",auth,GQHAPIPathURL,URLString,parameters);
//            NSLog(@"allHTTPHeaderFields:%@", manager.requestSerializer.HTTPRequestHeaders);
//            [manager GET:[NSString stringWithFormat:@"%@%@",GQHAPIPathURL,URLString] parameters:parameters headers:nil progress:progress success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//
//                // 请求成功
//                [self requestSuccessful:responseObject handler:handler];
//            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//
//                // 请求失败
//                [self requestFailed:error handler:handler];
//            }];
//        }];
//    }
//
//
//
//
//}
//
//+ (void)qh_authRequestPOST:(NSString *)auth URL:(NSString *)URLString parameters:(id)parameters progress:(void (^)(NSProgress * _Nonnull))progress handler:(GQHNetworkRequestHandler)handler {
//
//    [self qh_packageHeaderWithAuth:auth request:^(AFHTTPSessionManager *manager) {
//
//        NSLog(@"鉴权网络POST请求Auth:%@\nURL:%@%@\n请求参数:%@",auth,GQHAPIPathURL,URLString,parameters);
//        NSLog(@"allHTTPHeaderFields:%@", manager.requestSerializer.HTTPRequestHeaders);
//        [manager POST:[NSString stringWithFormat:@"%@%@",GQHAPIPathURL,URLString] parameters:parameters headers:nil progress:progress success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//
//            // 请求成功
//            [self requestSuccessful:responseObject handler:handler];
//        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//
//            // 请求失败
//            [self requestFailed:error handler:handler];
//        }];
//    }];
//}
//
//+ (void)qh_authRequestPUT:(NSString *)auth URL:(NSString *)URLString parameters:(id)parameters handler:(GQHNetworkRequestHandler)handler {
//
//    [self qh_packageHeaderWithAuth:auth request:^(AFHTTPSessionManager *manager) {
//
//        NSLog(@"鉴权网络PUT请求Auth:%@\nURL:%@%@\n请求参数:%@",auth,GQHAPIPathURL,URLString,parameters);
//        NSLog(@"allHTTPHeaderFields:%@", manager.requestSerializer.HTTPRequestHeaders);
//        [manager PUT:[NSString stringWithFormat:@"%@%@",GQHAPIPathURL,URLString] parameters:parameters headers:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//
//            // 请求成功
//            [self requestSuccessful:responseObject handler:handler];
//        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//
//            // 请求失败
//            [self requestFailed:error handler:handler];
//        }];
//    }];
//}
//
//+ (void)qh_authRequestDELETE:(NSString *)auth URL:(NSString *)URLString parameters:(id)parameters handler:(GQHNetworkRequestHandler)handler {
//
//    [self qh_packageHeaderWithAuth:auth request:^(AFHTTPSessionManager *manager) {
//
//        NSLog(@"鉴权网络DELETE请求Auth:%@\nURL:%@%@\n请求参数:%@",auth,GQHAPIPathURL,URLString,parameters);
//        [manager DELETE:[NSString stringWithFormat:@"%@%@",GQHAPIPathURL,URLString] parameters:parameters headers:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//
//            // 请求成功
//            [self requestSuccessful:responseObject handler:handler];
//        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//
//            // 请求失败
//            [self requestFailed:error handler:handler];
//        }];
//    }];
//}
//
//#pragma mark - 公共网络请求
///**
// 自定义封装公共网络请求头
//
// @param request 公共网络请求
// */
//+ (void)qh_packageHeader:(void(^)(AFHTTPSessionManager *manager))request {
//
//    AFHTTPSessionManager *manager = [GQHNetworkHelper qh_shareManager];
//
//    request(manager);
//}
//
//+ (void)qh_requestGET:(NSString *)URLString parameters:(id)parameters progress:(void (^)(NSProgress * _Nonnull))progress handler:(GQHNetworkRequestHandler)handler {
//
//    [self qh_packageHeader:^(AFHTTPSessionManager *manager) {
//        NSLog(@"gqhnetworkhelper allHTTPHeaderFields:%@", manager.requestSerializer.HTTPRequestHeaders);
//        NSLog(@"公共网络GET请求URL:%@%@\n请求参数:%@",GQHAPIPathURL,URLString,parameters);
//        [manager GET:[NSString stringWithFormat:@"%@%@",GQHAPIPathURL,URLString] parameters:parameters headers:nil progress:progress success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//
//            // 请求成功
//            [self requestSuccessful:responseObject handler:handler];
//        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//
//            // 请求失败
//            [self requestFailed:error handler:handler];
//        }];
//    }];
//}
//
//+ (void)qh_requestPOST:(NSString *)URLString parameters:(id)parameters progress:(void (^)(NSProgress * _Nonnull))progress handler:(GQHNetworkRequestHandler)handler {
//
//    [self qh_packageHeader:^(AFHTTPSessionManager *manager) {
//
//        NSLog(@"公共网络POST请求URL:%@%@\n请求参数:%@",GQHAPIPathURL,URLString,parameters);
//        NSLog(@"allHTTPHeaderFields:%@", manager.requestSerializer.HTTPRequestHeaders);
//        [manager POST:[NSString stringWithFormat:@"%@%@",GQHAPIPathURL,URLString] parameters:parameters headers:nil progress:progress success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//
//            // 请求成功
//            [self requestSuccessful:responseObject handler:handler];
//        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//
//            // 请求失败
//            [self requestFailed:error handler:handler];
//        }];
//    }];
//}
//
//+ (void)qh_requestPUT:(NSString *)URLString parameters:(id)parameters handler:(GQHNetworkRequestHandler)handler {
//
//    [self qh_packageHeader:^(AFHTTPSessionManager *manager) {
//
//        NSLog(@"公共网络PUT请求URL:%@%@\n请求参数:%@",GQHAPIPathURL,URLString,parameters);
//        NSLog(@"allHTTPHeaderFields:%@", manager.requestSerializer.HTTPRequestHeaders);
//        [manager PUT:[NSString stringWithFormat:@"%@%@",GQHAPIPathURL,URLString] parameters:parameters headers:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//
//            // 请求成功
//            [self requestSuccessful:responseObject handler:handler];
//        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//
//            // 请求失败
//            [self requestFailed:error handler:handler];
//        }];
//    }];
//}
//
//+ (void)qh_requestDELETE:(NSString *)URLString parameters:(id)parameters handler:(GQHNetworkRequestHandler)handler {
//
//    [self qh_packageHeader:^(AFHTTPSessionManager *manager) {
//
//        NSLog(@"公共网络DELETE请求URL:%@%@\n请求参数:%@",GQHAPIPathURL,URLString,parameters);
//        [manager DELETE:[NSString stringWithFormat:@"%@%@",GQHAPIPathURL,URLString] parameters:parameters headers:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//
//            // 请求成功
//            [self requestSuccessful:responseObject handler:handler];
//        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//
//            // 请求失败
//            [self requestFailed:error handler:handler];
//        }];
//    }];
//}
//
//#pragma mark - 多图上传
//+ (void)qh_authUpload:(NSString *)auth pictures:(NSArray *)pictures URL:(NSString *)URLString parameters:(id)parameters progress:(void (^)(NSProgress * _Nonnull))progress handler:(GQHNetworkRequestHandler)handler {
//
//    if (0 == pictures.count) {
//
//        if (handler) {
//
//            GQHNetworkResult *result = nil;
//            NSDictionary *info = @{@"code":@(9999),@"msg":@"图片为空"};
//            GQHNetworkError *error = [[GQHNetworkError alloc] initWithAFError:nil info:info];
//            result = [[GQHNetworkResult alloc] initWithError:error];
//
//            handler(result);
//        }
//
//        return;
//    }
//
//    [pictures enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//
//        if (![obj isKindOfClass:[UIImage class]]) {
//
//            NSString *message = [NSString stringWithFormat:@"第%lu个元素不是UIImage对象",idx];
//
//            if (handler) {
//
//                GQHNetworkResult *result = nil;
//                NSDictionary *info = @{@"code":@(9998),@"msg":message};
//                GQHNetworkError *error = [[GQHNetworkError alloc] initWithAFError:nil info:info];
//                result = [[GQHNetworkResult alloc] initWithError:error];
//
//                handler(result);
//            }
//
//            *stop = YES;
//
//            return;
//        }
//    }];
//
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
//    [manager.requestSerializer setValue:@"multipart/form-data" forHTTPHeaderField:@"Content-Type"];
//    if (auth && auth.length > 0) {
//
//        // 设置用户鉴权
//        [manager.requestSerializer setValue:auth forHTTPHeaderField:kAPIAuthorizationKey];
//    }
//
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//
//
//    [manager POST:[NSString stringWithFormat:@"%@%@",GQHAPIPathURL,URLString] parameters:parameters headers:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
//
//        // 当前时间
//        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//        formatter.dateFormat = @"yyyyMMddHHmmssSSS";
//        NSString *dateString = [formatter stringFromDate:[NSDate date]];
//
//        // 文件名
//        [pictures enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//
//            NSString *fileName = [NSString stringWithFormat:@"%@_%lu.png",dateString,idx];
//            NSData *imageData = [UIImage qh_compressImage:obj toKilobytes:100];
//            [formData appendPartWithFileData:imageData name:@"images" fileName:fileName mimeType:@"image/jpg/png/jpeg"];
//        }];
//    } progress:progress success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//
//        id response = [NSJSONSerialization  JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
//        // 请求成功
//        [self requestSuccessful:response handler:handler];
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//
//        // 请求失败
//        [self requestFailed:error handler:handler];
//    }];
//}
//
//#pragma mark - 回调处理
///**
// 请求成功(服务器网络请求成功，结果不一定成功)
//
// @param response 服务器返回的请求结果
// @param handler 请求成功处理回调
// */
//+ (void)requestSuccessful:(id)response handler:(GQHNetworkRequestHandler)handler {
//    NSLog(@"网络请求返回的内容:%@", [response toJSONString]);
//
//    GQHNetworkResult *result = nil;
//
//    NSDictionary *info = [NSObject qh_filterNull:response];
//
//    if ([info[@"code"] isEqualToNumber:@(1)]) {
//
//        // 请求成功
//        result = [[GQHNetworkResult alloc] initWithSuccessResponse:info];
//    } else {
//
//        GQHNetworkError *error = [[GQHNetworkError alloc] initWithAFError:nil info:info];
//        result = [[GQHNetworkResult alloc] initWithError:error];
//    }
//
//    if (handler) {
//
//        handler(result);
//    }
//}
//
///**
// 请求失败
//
// @param error AFNetworking返回的错误
// @param handler 请求失败处理回调
// */
//+ (void)requestFailed:(NSError *)error handler:(GQHNetworkRequestHandler)handler {
//
//    GQHNetworkError *requestError = [[GQHNetworkError alloc] initWithAFError:error info:nil];
//    GQHNetworkResult *result = [[GQHNetworkResult alloc] initWithError:requestError];
//
//    if (handler) {
//
//        handler(result);
//    }
//
//    NSDictionary *erroInfo = error.userInfo;
//    NSData *data = [erroInfo valueForKey:@"com.alamofire.serialization.response.error.data"];
//    NSString *errorString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//    NSLog(@"网络请求失败返回的内容:code:%@, message:%@, info:%@, data,%@", requestError.qh_code, requestError.qh_message, requestError.qh_AFError.userInfo,errorString);
//}
//
//@end
