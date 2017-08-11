//
//  LXDatePickerView.h
//  PigBank
//
//  Created by Vincent Wang on 2016/10/22.
//  Copyright © 2016年 subvin.inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LXDateDelegate <NSObject>

-(void)chooseDate;

@end

@interface LXDatePickerView : UIView

@property(nonatomic,weak)id <LXDateDelegate> delegate;
@property(nonatomic,strong)UIDatePicker *datePicker;
@property(nonatomic,strong)UIButton *cancleButton;
@property(nonatomic,strong)UIButton *sureButton;
@property(nonatomic,copy)NSString *date;

-(void)setDateString:(NSString *)dateString;

@end
