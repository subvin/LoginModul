//
//  LXNickNameEditController.h
//  LoginModel
//
//  Created by Vincent Wang on 2017/8/11.
//  Copyright © 2017年 Subvin.inc. All rights reserved.
//

#import "LXUserBaseController.h"

typedef void (^LXEditNickName)(NSString *);

@interface LXNickNameEditController : LXUserBaseController

@property(nonatomic,copy)LXEditNickName editFinished;

@end
