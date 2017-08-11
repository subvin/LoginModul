//
//  SSUserManager.m
//  bluetoothRabbit_IOS
//
//  Created by licy on 14-6-3.
//  Copyright (c) 2014年 com.platomix. mBluetoothRabbit. All rights reserved.
//

#import "LXUserManager.h"
#import "LXDataManager.h"
#import "AFNetworking.h"


NSString *kUserBaseUrl          = @"http://test.snaillove.com/";
NSString *kUserRegisterUrl      = @"WoMix/api/user_register";
NSString *kUserLoginUrl         = @"WoMix/api/user_login";
NSString *kUserUpdataUrl        = @"WoMix/api/user_updateuser";


@implementation LXUserManager

+ (LXUserManager *)sharedInstance
{
    static LXUserManager *_sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[self alloc] init];
//        _sharedInstance.babyList = [[NSMutableArray alloc] init];
    });
    
    return _sharedInstance;
}

- (void)setCurrentName:(NSString *)currentName
{
    [[LXDataManager sharedInstance] saveCurrentUserName:currentName];
}

-(NSString *)currentName
{
    return [[LXDataManager sharedInstance] currentName];
}

-(void)saveName:(NSString *)name pass:(NSString *)pass
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:[LXDataManager sharedInstance].userPass];
    [dict setObject:pass forKey:name];
    
    [LXDataManager sharedInstance].userPass = dict;
}

-(NSString *)getPassWithName:(NSString *)name
{
    return [[LXDataManager sharedInstance].userPass objectForKey:name];
}

-(LXLoginInfo *)loginInfo
{
    return [[LXLoginInfo alloc] initWithDict:[LXDataManager sharedInstance].userData];
}

-(void)registerUserWithInfo:(NSDictionary *)dict success:(void (^)(NSString *result))success fail:(void (^)(NSString *result))fail
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    //申明返回的结果是json类型
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //申明请求的数据是json类型
    manager.requestSerializer=[AFJSONRequestSerializer serializer];
    //如果报接受类型不一致请替换一致text/html或别的
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/plain", nil];
    
    [manager POST:[NSString stringWithFormat:@"%@%@",kUserBaseUrl,kUserRegisterUrl] parameters:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSLog(@"注册成功");
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        NSLog(@"注册失败");
        
    }];
}

-(void)signIn:(NSDictionary *)loginInfo success:(void (^)(NSString *result))success fail:(void (^)(NSString *result))fail {
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    //申明返回的结果是json类型
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //申明请求的数据是json类型
    manager.requestSerializer=[AFJSONRequestSerializer serializer];
    //如果报接受类型不一致请替换一致text/html或别的
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/plain", nil];
    [manager POST:[NSString stringWithFormat:@"%@%@",kUserBaseUrl,kUserLoginUrl] parameters:loginInfo success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSLog(@"登录成功");
        if (success)
        {
            success(nil);
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"登录失败");
        if (fail) {
            fail(nil);
        }
    }];
}

-(void)updataUserInfo:(NSDictionary *)info success:(void (^)(NSString *result))success fail:(void (^)(NSString *result))fail
{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    //申明返回的结果是json类型
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //申明请求的数据是json类型
    manager.requestSerializer=[AFJSONRequestSerializer serializer];
    //如果报接受类型不一致请替换一致text/html或别的
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/plain", nil];
    [manager POST:[NSString stringWithFormat:@"%@%@",kUserBaseUrl,kUserUpdataUrl] parameters:info success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSLog(@"修改信息成功");
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"修改信息失败");
        
    }];
}


-(void)loginOut
{
    [self saveSignInStatus:NO];
}

-(void)saveSignInStatus:(BOOL)isSignIn
{
    [[LXDataManager sharedInstance] saveSignInStatus:isSignIn];
}

-(BOOL)isGirl
{
    return [self.loginInfo.sex isEqualToString:@"f"];
}

-(BOOL)isSignIn
{
    return [[LXDataManager sharedInstance] signInStatus];
}

@end
