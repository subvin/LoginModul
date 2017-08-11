//
//  SSUserManager.h
//  bluetoothRabbit_IOS
//
//  Created by licy on 14-6-3.
//  Copyright (c) 2014年 com.platomix. mBluetoothRabbit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LXLoginInfo.h"


extern NSString *kUserBaseUrl           ;// 接口
extern NSString *kUserRegisterUrl       ;
extern NSString *kUserRegisterUrl       ;
extern NSString *kUserLoginUrl          ;
extern NSString *kUserUpdataUrl         ;

@interface LXUserManager : NSObject


-(void)registerUserWithInfo:(NSDictionary *)dict success:(void (^)(NSString *result))success fail:(void (^)(NSString *result))fail;//  用户注册
-(void)signIn:(NSDictionary *)loginInfo success:(void (^)(NSString *result))success fail:(void (^)(NSString *result))fail ; // 用户登录
-(void)updataUserInfo:(NSDictionary *)info success:(void (^)(NSString *result))success fail:(void (^)(NSString *result))fail;// 修改用户信息

@property (readwrite) NSString *currentName; // 当前要登录的用户信息

@property(nonatomic,strong)NSMutableArray *babyList;
-(void)saveSignInStatus:(BOOL)isSignIn;


-(void)loginOut;
+ (LXUserManager *)sharedInstance;

-(NSString *)getPassWithName:(NSString *)name;

-(LXLoginInfo *)loginInfo;

-(BOOL)isGirl;

-(BOOL)isSignIn;



@end
