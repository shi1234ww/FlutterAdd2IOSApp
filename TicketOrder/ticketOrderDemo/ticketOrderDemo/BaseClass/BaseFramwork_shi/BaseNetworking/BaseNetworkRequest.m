//
//  BaseNetworkRequest.m
//  pocketEOS
//
//  Created by oraclechain on 2017/11/29.
//  Copyright © 2017年 oraclechain. All rights reserved.
//

// 116
#define REQUEST_APIPATH [NSString stringWithFormat: @"%@" , [self requestUrlPath]]
 
// 域名 https://ysxtest.zhiyousx.com
//#define REQUEST_APIPATH [NSString stringWithFormat: @"/api/app%@", [self requestUrlPath]]

NSString * const GQHAPIPathURL = @"https://ysxtest.zhiyousx.com/api/app";
#import "BaseNetworkRequest.h"

@interface BaseNetworkRequest()
@property(nonatomic, strong) AFHTTPSessionManager *networkingManager;
@property (nonatomic , strong) NSString *auth_token;
@end


@implementation BaseNetworkRequest


- (AFHTTPSessionManager *)networkingManager{
    if(!_networkingManager){
        _networkingManager = [[AFHTTPSessionManager alloc] initWithBaseURL: [NSURL URLWithString: @""]];
        
        // https安全策略
        _networkingManager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        // 不验证证书的域名
        _networkingManager.securityPolicy.validatesDomainName = NO;
        // 验证自建证书
        _networkingManager.securityPolicy.allowInvalidCertificates = YES;
        
        
        
        
        
        _networkingManager.requestSerializer = [AFJSONRequestSerializer serializer];
        // 请求超时时长
        _networkingManager.requestSerializer.timeoutInterval = 30.0f;
        // 请求头内容格式
        [_networkingManager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [_networkingManager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        
        
        
        //
        
        
        
        
        // 返回接受内容格式 ip
        _networkingManager.responseSerializer = [AFJSONResponseSerializer serializer];
        
        // 返回接受内容格式 域名
//        _networkingManager.responseSerializer = [AFHTTPResponseSerializer serializer];
        
        _networkingManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html", @"text/json", @"text/plain", @"text/javascript", @"text/xml", @"text/encode", @"multipart/form-data", @"image/jpeg", @"image/png", @"application/octet-stream", nil];
        
    }
    return _networkingManager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.showActivityIndicator = YES;
    }
    return self;
}

+ (NSString *)requestBaseUrl{
    return @"";
}

- (NSString *)requestUrlPath{
    return @"";
}




- (id)parameters{
    return @{};
}

- (BOOL)validateRequestParameters{
    return YES;
}

- (BOOL)validateResponseData:(id)returnData HttpURLResponse:(NSURLResponse *)response{
    // 获取 http 状态码
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
    NSLog(@"HttpCode: %ld", (long)httpResponse.statusCode );
    if (httpResponse.statusCode > 300) {
        return NO;
    }
    return YES;
}

// 配置请求
- (BOOL)buildRequestConfigInfo{
    if (![self validateRequestParameters]) {
        [SVProgressHUD dismiss];
        return NO;
    }
    
    if (self.showActivityIndicator) {
        [SVProgressHUD show];
    }
    
    
//    self.auth_token = [GQHTokenModel qh_defaultToken].token;
//
//    if (self.kHttpAuthType == kHttpAuthTypeBasicValue) {
//        [self.networkingManager.requestSerializer setValue:@"Basic emp0Yy1wYXJrLWFwcDphcHA=" forHTTPHeaderField:kAPIAuthorizationKey];
//    }else if (self.kHttpAuthType == kHttpAuthTypeUserToken){
//        [self.networkingManager.requestSerializer setValue:VALIDATE_STRING(self.auth_token) forHTTPHeaderField:kAPIAuthorizationKey];
//    }else{
//        [self.networkingManager.requestSerializer setValue:@"" forHTTPHeaderField:kAPIAuthorizationKey];
//    }
    return YES;
}



- (void)getDataSusscess:(RequestSuccessBlock)success failure:(RequestFailedBlock)failure{
    if (![self buildRequestConfigInfo]) {
        return;
    }
    
    WeakSelf
    id parameters = [self parameters];
    NSLog(@"REQUEST_APIPATH = %@", REQUEST_APIPATH);
    NSLog(@"allHTTPHeaderFields:%@", self.networkingManager.requestSerializer.HTTPRequestHeaders);
    NSLog(@"parameters = %@", parameters);
    
    NSString *url = [NSString stringWithFormat:@"%@%@",GQHAPIPathURL,REQUEST_APIPATH];
    self.sessionDataTask = [self.networkingManager GET:url parameters:parameters headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if([self validateResponseData: responseObject HttpURLResponse: task.response]) {
            if(IsNilOrNull(success)){
                return;
            }
            
            //
            NSLog(@"responseObject:%@", responseObject);//AFJSONResponseSerializer
            
//            NSString *responseResult =  [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
//            NSLog(@"responseResult %@", [responseResult mj_JSONString]); //AFHTTPResponseSerializer

            BaseModel *model = [BaseModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqualToNumber:@1]) {
                success(weakSelf.networkingManager, model);
                
            }else{
                [TOASTVIEW showWithText:VALIDATE_STRING(model.msg)];
                failure(weakSelf.networkingManager, nil);
            }
        }
        else{
            failure(weakSelf.networkingManager, nil);
        }
        
        //dismiss loading view
        [SVProgressHUD dismiss];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD dismiss];
        if (IsNilOrNull(failure)) {
            return ;
        }
        if(error.code == -1001){
            [TOASTVIEW showWithText:NSLocalizedString(@"请求超时, 请稍后再试!", nil)];
        }
        
        [self logErrorInfo:error];
        failure(weakSelf.networkingManager, error);
    }];
}

-(void)postDataSuccess:(RequestSuccessBlock)success failure:(RequestFailedBlock)failure{
    //The basic configuration information build request
    if(![self buildRequestConfigInfo]){
        return;
    }
    
    //Start a Post request data interface
    id parameters = [self parameters];
    NSLog(@"REQUEST_APIPATH = %@%@",GQHAPIPathURL, REQUEST_APIPATH);
    NSLog(@"allHTTPHeaderFields:%@", self.networkingManager.requestSerializer.HTTPRequestHeaders);
    NSLog(@"parameters = %@", parameters);
    WeakSelf
    NSString *url = [NSString stringWithFormat:@"%@%@",GQHAPIPathURL,REQUEST_APIPATH];
    self.sessionDataTask = [self.networkingManager POST:url parameters:parameters headers:nil progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if([self validateResponseData: responseObject HttpURLResponse: task.response]) {
            if(IsNilOrNull(success)){
                return;
            }
            NSLog(@"responseObject:%@", responseObject);
            
//            NSString *responseResult =  [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
//            NSLog(@"responseResult %@", [responseResult mj_JSONString]);
            
            BaseModel *model = [BaseModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqualToNumber:@1]) {
                success(weakSelf.networkingManager, model);
                
            }else{
                [TOASTVIEW showWithText:VALIDATE_STRING(model.msg)];
                failure(weakSelf.networkingManager, nil);
            }
        }
        else{
            failure(weakSelf.networkingManager, nil);
        }
        
        //dismiss loading view
        [SVProgressHUD dismiss];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //dismiss loading view
        [SVProgressHUD dismiss];
        //failure block
        if(IsNilOrNull(failure)){
            return;
        }
        [self logErrorInfo:error];
        failure(task, error);
    }];
}


-(void)putDataSuccess:(RequestSuccessBlock)success failure:(RequestFailedBlock)failure{
    if (![self buildRequestConfigInfo]) {
        return;
    }
    
    id parameters = [self parameters];
    NSLog(@"REQUEST_APIPATH = %@%@",GQHAPIPathURL, REQUEST_APIPATH);
    NSLog(@"allHTTPHeaderFields:%@", self.networkingManager.requestSerializer.HTTPRequestHeaders);
    NSLog(@"parameters = %@", parameters);
    WeakSelf
    self.sessionDataTask = [self.networkingManager PUT:REQUEST_APIPATH parameters:parameters headers:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if([self validateResponseData: responseObject HttpURLResponse: task.response]) {
            if(IsNilOrNull(success)){
                return;
            }
            NSLog(@"responseObject:%@", responseObject);
            
//            NSString *responseResult =  [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
//            NSLog(@"responseResult %@", [responseResult mj_JSONString]);
            
            BaseModel *model = [BaseModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqualToNumber:@1]) {
                success(weakSelf.networkingManager, model);
                
            }else{
                [TOASTVIEW showWithText:VALIDATE_STRING(model.msg)];
                failure(weakSelf.networkingManager, nil);
            }
        }
        else{
            failure(weakSelf.networkingManager, nil);
        }
        
        //dismiss loading view
        [SVProgressHUD dismiss];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD dismiss];
        if (IsNilOrNull(failure)) {
            return ;
        }
        if(error.code == -1001){
            [TOASTVIEW showWithText:NSLocalizedString(@"请求超时, 请稍后再试!", nil)];
        }
        [self logErrorInfo:error];
        failure(weakSelf.networkingManager , error);
    }];
}

-(void)deleteDataSuccess:(RequestSuccessBlock)success failure:(RequestFailedBlock)failure{
    if (![self buildRequestConfigInfo]) {
        return;
    }
    
    id parameters = [self parameters];
    NSLog(@"REQUEST_APIPATH = %@%@",GQHAPIPathURL, REQUEST_APIPATH);
    NSLog(@"allHTTPHeaderFields:%@", self.networkingManager.requestSerializer.HTTPRequestHeaders);
    NSLog(@"parameters = %@", parameters);
    WeakSelf
    self.sessionDataTask = [self.networkingManager DELETE:REQUEST_APIPATH parameters:parameters headers:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if([self validateResponseData: responseObject HttpURLResponse: task.response]) {
            if(IsNilOrNull(success)){
                return;
            }
            NSLog(@"responseObject:%@", responseObject);
            
//            NSString *responseResult =  [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
//            NSLog(@"responseResult %@", [responseResult mj_JSONString]);
            
            BaseModel *model = [BaseModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqualToNumber:@1]) {
                success(weakSelf.networkingManager, model);
                
            }else{
                [TOASTVIEW showWithText:VALIDATE_STRING(model.msg)];
                failure(weakSelf.networkingManager, nil);
            }
        }
        else{
            failure(weakSelf.networkingManager, nil);
        }
        
        //dismiss loading view
        [SVProgressHUD dismiss];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD dismiss];
        if (IsNilOrNull(failure)) {
            return ;
        }
        if(error.code == -1001){
            [TOASTVIEW showWithText:NSLocalizedString(@"请求超时, 请稍后再试!", nil)];
        }
        [self logErrorInfo:error];
        failure(weakSelf.networkingManager , error);
    }];
    
    
}

- (void)dealloc{
//    if (!IsNilOrNull(self.sessionDataTask)) {
//        [self.sessionDataTask cancel];
//    }
}

#pragma mark - ********** SSL校验 **********
/** SSL 1.单向验证 */
- (AFSecurityPolicy*)customSecurityPolicy {
    
    // AFSSLPinningModeCertificate:需要客户端预先保存服务端的证书(自建证书)
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    NSString * cerPath  = [[NSBundle mainBundle] pathForResource:@"server" ofType:@"cer"];
    NSData *certData    = [NSData dataWithContentsOfFile:cerPath];
    NSSet   *dataSet    = [NSSet setWithArray:@[certData]];
    // 自建证书的时候，提供相应的证书
    [securityPolicy setPinnedCertificates:dataSet];
    // 是否允许无效证书(自建证书)
    [securityPolicy setAllowInvalidCertificates:YES];
    // 是否需要验证域名
    [securityPolicy setValidatesDomainName:NO];
    
    return securityPolicy;
}

- (void)logErrorInfo:(NSError *)error{
    GQHNetworkError *requestError = [[GQHNetworkError alloc] initWithAFError:error info:nil];
    GQHNetworkResult *result = [[GQHNetworkResult alloc] initWithError:requestError];
    
    
    
    NSDictionary *erroInfo = error.userInfo;
    NSData *data = [erroInfo valueForKey:@"com.alamofire.serialization.response.error.data"];
    NSString *errorString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"baseNetworking网络请求失败返回的内容:code:%@, message:%@, info:%@, data,%@", requestError.qh_code, requestError.qh_message, requestError.qh_AFError.userInfo,errorString);
    
}

@end
