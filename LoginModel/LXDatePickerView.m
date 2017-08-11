//
//  LXDatePickerView.m
//  PigBank
//
//  Created by Vincent Wang on 2016/10/22.
//  Copyright © 2016年 subvin.inc. All rights reserved.
//

#import "LXDatePickerView.h"
#import "UIView+ModifyFrame.h"


@implementation LXDatePickerView


-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, self.height - 50.5f, self.width, 1.5)];
        lineView.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:lineView];
        
        _cancleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _cancleButton.frame = CGRectMake(0, self.height - 50.0f, self.width/2.0f, 50);
        [_cancleButton setTitle:@"取消" forState:UIControlStateNormal];
        [_cancleButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [_cancleButton setBackgroundColor:[UIColor whiteColor]];
        
        UIView *lineView2 = [[UIView alloc] initWithFrame:CGRectMake(self.width/2.0f, lineView.maxY, 1, 50.0f)];
        lineView2.backgroundColor = [UIColor lightGrayColor];
        
        
        _sureButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _sureButton.frame = CGRectMake(self.width/2.0, self.height - 50.0f, self.width/2.0f, 50);
        [_sureButton setTitle:@"确定" forState:UIControlStateNormal];
        [_sureButton setBackgroundColor:[UIColor whiteColor]];
        [_sureButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        
        _datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, self.height - 252, self.width, 201)];
        
        _datePicker.datePickerMode = UIDatePickerModeDate;
        _datePicker.minuteInterval = 30;
        _datePicker.backgroundColor = [UIColor whiteColor];
        
        //将字符串转为日期
        [_datePicker setMaximumDate:[NSDate date]];
        NSDateFormatter *formatter_minDate = [[NSDateFormatter alloc] init];
        [formatter_minDate setDateFormat:@"yyyy-MM-dd"];
        NSDate *minDate = [formatter_minDate dateFromString:@"1920-01-01"];
        [_datePicker setMinimumDate:minDate];
        
        NSString *birthday = @"1992-04-08";//[SSUserManager sharedInstance].loginInfo.baby_birthday;
        if (birthday.length > 0) {
                        
            NSDateFormatter *formmater = [[NSDateFormatter alloc] init];
            [formmater setDateFormat:@"yyyy-MM-dd"];
            NSDate *date = [formmater dateFromString:birthday];
            if (date) {
                [_datePicker setDate:date];
            }
        }
        [_datePicker addTarget:self action:@selector(chooseDate:) forControlEvents:UIControlEventValueChanged];
        self.backgroundColor = [UIColor blackColor];
        [self addSubview:_cancleButton];
        [self addSubview:_sureButton];
        [self addSubview:_datePicker];
        [self addSubview:lineView2];
        
    }
    
    return self;
}

-(void)setDateString:(NSString *)dateString
{
    NSDateFormatter *formmater = [[NSDateFormatter alloc] init];
    [formmater setDateFormat:@"yyyy-MM-dd"];
    NSDate *date = [formmater dateFromString:dateString];
    if (date) {
        [_datePicker setDate:date];
    }
}


-(void)chooseDate:(UIDatePicker *)picker
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *date = picker.date;
    NSString *birthdayDay = [formatter stringFromDate:date];
    _date = birthdayDay;
//    if (_delegate && [_delegate respondsToSelector:@selector(chooseDate)]) {
//        [_delegate chooseDate];
//    }
}

-(NSString *)date
{
    if (_date) {
        return _date;
    }
    else
    {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd"];
        NSDate *date = _datePicker.date;
        NSString *birthdayDay = [formatter stringFromDate:date];
        return birthdayDay;
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
