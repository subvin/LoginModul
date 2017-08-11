//
//  LXLoginInfo.h
//  SnailRelax
//
//  Created by Vincent Wang on 2017/3/9.
//  Copyright © 2017年 Snaillove.inc. All rights reserved.
//

#import "LXBaseObject.h"

@interface LXLoginInfo : LXBaseObject


PropertyString(head)
PropertyString(birthday)
PropertyString(phone)
PropertyString(nick_name)
PropertyString(sex)
PropertyString(userid)
PropertyString(token)
PropertyString(city)
PropertyString(province)
PropertyString(hometown_city)
PropertyString(hometown_province)

PropertyString(wechat_openid)
PropertyString(tencent_openid)


@end
