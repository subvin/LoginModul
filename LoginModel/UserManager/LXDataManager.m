//
//  BBUtil.m
//  babyshow_ios
//
//  Created by ludawei on 14-2-14.
//  Copyright (c) 2014年 platomix.dw. All rights reserved.
//

#import "LXDataManager.h"

static NSString *settingMessage = @"settingMessage";
static NSString *settingUpload = @"settingUpload";
static NSString *signInStatus = @"signInStatus";
static NSString *currentName = @"currentName";
static NSString *isRemeberPass = @"isRemeberPass";
static NSString *isAutoLogin = @"isAutoLogin";

#define BBUserDefaults [NSUserDefaults standardUserDefaults]

#define IDENTIFY_WITH_TYPE(t) \
[NSString stringWithFormat:@"%d", t]

@interface LXDataManager ()

@property (nonatomic, strong) NSString *basePath;

@end

@implementation LXDataManager

+ (LXDataManager *)sharedInstance
{
    static LXDataManager *_sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[self alloc] init];
    });
    
    return _sharedInstance;
}

#pragma mark - private

- (void)ensurePathExists:(NSString *)path
{
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if(![fileManager fileExistsAtPath:path])
    {
        [[NSFileManager defaultManager] createDirectoryAtPath:path
                                  withIntermediateDirectories:YES
                                                   attributes:nil
                                                        error:nil];
    }
}

- (NSString *)pathForIdentify:(NSString *)identify
{
    if(!identify && identify.length)
        return nil;
    
    NSString *path;
    
    if(!self.basePath)
    {
        NSString *_path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
        _path = [_path stringByAppendingPathComponent:@"data"];
        self.basePath = _path;
        
        [self ensurePathExists:self.basePath];
    }
    path = self.basePath;
    
    return [path stringByAppendingPathComponent:identify];
}

// NOTE: data is kind of NSData
- (void)setData:(id)data forIdentify:(NSString *)identify
{
    if(!data || !identify || identify.length == 0 ||
       ![data isKindOfClass:[NSData class]])
        return;

    NSString *path = [self pathForIdentify:identify];
    if(!path) return;
    
    NSData *d = data;
    [d writeToFile:path atomically:YES];
}

- (id)dataForIdentify:(NSString *)identify
{
    if(!identify || identify.length == 0)
        return nil;
    NSString *path = [self pathForIdentify:identify];
    if(!path) return nil;
    return [NSData dataWithContentsOfFile:path];
}

// bool to data
- (void)setBool:(BOOL)boolValue forIdentify:(NSString *)identify
{
    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeBool:boolValue forKey:identify];
    [archiver finishEncoding];
    [self setData:data forIdentify:identify];
}

- (BOOL)boolForIdentify:(NSString *)identify defaultValue:(BOOL)defaultValue
{
    NSData *data = [self dataForIdentify:identify];
    if(!data)
    {
        [self setBool:defaultValue forIdentify:identify];
        return defaultValue;
    }
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    BOOL boolValue = [unarchiver decodeBoolForKey:identify];
    [unarchiver finishDecoding];
    return boolValue;
}

- (BOOL)boolForIdentify:(NSString *)identify
{
    return [self boolForIdentify:identify defaultValue:NO];
}

// dictionary to data
- (void)setDictionary:(id)dict forIdentify:(NSString *)identify
{
    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:dict forKey:identify];
    [archiver finishEncoding];
    [self setData:data forIdentify:identify];
}

- (id)dictionaryForIdentify:(NSString *)identify
{
    NSData *data = [self dataForIdentify:identify];
    if(!data) return nil;
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    NSDictionary *dict = [unarchiver decodeObjectForKey:identify];
    [unarchiver finishDecoding];
    return dict;
}

// array to data
- (void)setArray:(id)array forIdentify:(NSString *)identify
{
    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:array forKey:identify];
    [archiver finishEncoding];
    [self setData:data forIdentify:identify];
}

- (id)arrayForIdentify:(NSString *)identify
{
    NSData *data = [self dataForIdentify:identify];
    if(!data) return nil;
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    NSArray *array = [unarchiver decodeObjectForKey:identify];
    [unarchiver finishDecoding];
    return array;
}


#pragma mark - 设置相关
-(void)saveMessageSetting:(BOOL)setValue
{
    [BBUserDefaults setBool:setValue forKey:settingMessage];
}

-(BOOL)messageSetting
{
    return [BBUserDefaults boolForKey:settingMessage];
}

-(void)saveUploadSetting:(BOOL)setValue
{
    [BBUserDefaults setBool:setValue forKey:settingUpload];
}

-(BOOL)uploadSetting
{
    return [BBUserDefaults boolForKey:settingUpload];
}

#pragma mark - 用户相关
-(void)saveSignInStatus:(BOOL)isSignIn
{
    [BBUserDefaults setBool:isSignIn forKey:signInStatus];
}

-(BOOL)signInStatus
{
    return [BBUserDefaults boolForKey:signInStatus];
}

-(void)saveIsRemeberPass:(BOOL)boolValue
{
    [BBUserDefaults setBool:boolValue forKey:isRemeberPass];
}
-(BOOL)isRemeberPass
{
//    static dispatch_once_t oncePredicate;
//    dispatch_once(&oncePredicate, ^{
//        [BBUserDefaults setBool:YES forKey:isRemeberPass];
//    });
    return [BBUserDefaults boolForKey:isRemeberPass];
}

-(void)saveIsAutoLogin:(BOOL)boolValue;
{
    [BBUserDefaults setBool:boolValue forKey:isAutoLogin];
}
-(BOOL)isAutoLogin
{
//    static dispatch_once_t oncePredicate;
//    dispatch_once(&oncePredicate, ^{
//        [BBUserDefaults setBool:YES forKey:isAutoLogin];
//    });
    return [BBUserDefaults boolForKey:isAutoLogin];
}

-(void)saveCurrentUserName:(NSString *)name
{
    [BBUserDefaults setObject:name forKey:currentName];
}

-(NSString *)currentName
{
    return [BBUserDefaults objectForKey:currentName];
}

-(void)setUserData:(NSDictionary *)userData
{
    [self setDictionary:userData forIdentify:IDENTIFY_WITH_TYPE(LXDataUserData)];
}

-(NSDictionary *)userData
{
    return [self dictionaryForIdentify:IDENTIFY_WITH_TYPE(LXDataUserData)];
}

-(void)setUserPass:(NSDictionary *)userPass
{
    [self setDictionary:userPass forIdentify:IDENTIFY_WITH_TYPE(LXDataUserData)];
}

-(NSDictionary *)userPass
{
    return [self dictionaryForIdentify:IDENTIFY_WITH_TYPE(LXDataUserData)];
}

@end
