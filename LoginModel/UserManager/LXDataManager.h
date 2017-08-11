//
//  BBUtil.h
//  babyshow_ios
//
//  Created by ludawei on 14-2-14.
//  Copyright (c) 2014年 platomix.dw. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(int, LXDataType) {
    
    // ************************************
    // for user login
    LXDataUserData = 0,                     // 用户数据
    LXDataUserPass,                         // 密码字典
    
    // end of enum
    LXDataNumberOfFields
};

@interface LXDataManager : NSObject

+ (LXDataManager *)sharedInstance;

-(void)saveMessageSetting:(BOOL)setValue;
-(BOOL)messageSetting;
-(void)saveUploadSetting:(BOOL)setValue;
-(BOOL)uploadSetting;

-(void)saveSignInStatus:(BOOL)isSignIn;
-(BOOL)signInStatus;

-(void)saveIsRemeberPass:(BOOL)boolValue;
-(BOOL)isRemeberPass;

-(void)saveIsAutoLogin:(BOOL)boolValue;
-(BOOL)isAutoLogin;

-(void)saveCurrentUserName:(NSString *)name;
-(NSString *)currentName;

// 用户信息
-(void)setUserData:(NSDictionary *)userData;
-(NSDictionary *)userData;

// 密码
-(void)setUserPass:(NSDictionary *)userPass;
-(NSDictionary *)userPass;

@end
