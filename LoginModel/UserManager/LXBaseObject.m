//
//  LXBaseObject.m
//  SnailRelax
//
//  Created by Vincent Wang on 2017/3/6.
//  Copyright © 2017年 Snaillove.inc. All rights reserved.
//

#import "LXBaseObject.h"

@implementation LXBaseObject

-(id)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self dictionaryForObject:dict];
    }
    return self;
}

// 将一个字典反射到类中,但好字典的key与类的属性名相同

- (void)dictionaryForObject:(NSDictionary*) dict
{
    
    for (NSString *key in [dict allKeys])
    {
        id value = [dict objectForKey:key];
        
        if ([value isKindOfClass:[NSNumber class]]) {
            value = [value stringValue];
        }
        //        DDLogInfo(@"value:%@ key:%@",value,key);
        if (value==[NSNull null])
        {
            continue;
        }
        //        if ([value isKindOfClass:[NSDictionary class]])
        //        {
        //            id subObj = [self valueForKey:key];
        //            if (subObj)
        //                [subObj dictionaryForObject:value];
        //        }
        //        else
        @try {
            
            NSString *classKey = [NSString stringWithString:key];
            if ([classKey isEqualToString:@"description"]) {
                classKey = @"des";
            }
            if (classKey == nil) {
                break;
            }
            [self setValue:value forKey:classKey];
            //            [self setValue:value forKeyPath:classKey];
        }
        @catch (NSException *exception) {
            //LOG(@"%@类没有 '%@'", [self class], key);
            continue;
        }
    }
}

-(NSDictionary *)dictionaryFromObject
{
    
    NSArray *keys = [self allKeys];
    
    NSMutableDictionary *d = [NSMutableDictionary dictionaryWithCapacity:keys.count];
    
    for (NSString *propertyName in keys) {
        NSString *value = [self valueForKey:propertyName];
        if (value) {
            [d setObject:value forKey:propertyName];
        } else {
            [d setObject:@"" forKey:propertyName];
        }
    }
    
    return d;
}

-(NSString *)logClassData
{
    NSArray *keys = [self allKeys];
    
    NSMutableString *logString = [NSMutableString string];
    for (NSString *propertyName in keys)
    {
        [logString appendFormat:@"\n%@ : %@", propertyName, [self valueForKey:propertyName]];
    }
    
    //    DDLogInfo(@"logData---%@  %@", self.class, logString);
    return logString;
}

// 得到所有的keys
-(NSArray *)allKeys
{
    unsigned int outCount, i;
    
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    
    NSMutableArray *keys = [[NSMutableArray alloc] initWithCapacity:outCount];
    
    for (i = 0; i < outCount; i++) {
        
        objc_property_t property = properties[i];
        
        NSString *propertyName = [[NSString alloc] initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        
        [keys addObject:propertyName];
        
    }
    
    if (self.superclass != [NSObject class])
    {
        [keys addObjectsFromArray:[objc_getClass([NSStringFromClass(self.superclass) UTF8String]) allKeys]];
    }
    
    free(properties);
    
    return keys;
}


@end
