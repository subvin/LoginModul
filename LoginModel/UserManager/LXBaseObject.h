//
//  LXBaseObject.h
//  SnailRelax
//
//  Created by Vincent Wang on 2017/3/6.
//  Copyright © 2017年 Snaillove.inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
@interface LXBaseObject : NSObject

#ifndef PropertyString
#define PropertyString(p)                                   @property (nonatomic,copy) NSString *p;
#endif
- (id)initWithDict:(NSDictionary *)dict;

- (void)dictionaryForObject:(NSDictionary*) dict;
- (NSDictionary *)dictionaryFromObject;

-(NSArray *)allKeys;

-(NSString *)logClassData;

@end
