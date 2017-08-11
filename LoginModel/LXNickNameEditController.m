//
//  LXNickNameEditController.m
//  LoginModel
//
//  Created by Vincent Wang on 2017/8/11.
//  Copyright © 2017年 Subvin.inc. All rights reserved.
//

#import "LXNickNameEditController.h"

@interface LXNickNameEditController ()

@end

@implementation LXNickNameEditController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:230/255.0f green:230/255.0f blue:230/255.0f alpha:1.0f];
    
    
    CGFloat baseY = 70.0f;
    
    UIView *topLine = [[UIView alloc] initWithFrame:CGRectMake(0, baseY, self.view.width, 1.0f)];
    [topLine setBackgroundColor:[UIColor lightGrayColor]];
    [self.view addSubview:topLine];
    
    UIView *headerBgView = [[UIView alloc] initWithFrame:CGRectMake(0, baseY+ 1, self.view.width, 50.0f)];
    headerBgView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:headerBgView];
    
    UILabel *headerTitle = [[UILabel alloc] initWithFrame:CGRectMake(20.0f, (headerBgView.height - 20.0f)/2.0f, 50.0f, 20.0f)];
    [headerTitle setText:@"昵称"];
    [headerTitle setTextAlignment:NSTextAlignmentLeft];
    [headerTitle setTextColor:[UIColor grayColor]];
    [headerBgView addSubview:headerTitle];
    
    
    UITextField *nameTf = [[UITextField alloc] initWithFrame:CGRectMake((headerBgView.width - 20.0f - 200) , (headerBgView.height - 20.0f)/2.0f, 200, 20.0f)];
    
    [nameTf setTextColor:[UIColor grayColor]];
    [nameTf setPlaceholder:@"请输入昵称"];
    [nameTf setText:@"我的名字"];
    [nameTf setTextAlignment:NSTextAlignmentRight];
    [headerBgView addSubview:nameTf];
    
    UIView *bottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, headerBgView.maxY, headerBgView.width, 1.0f)];
    [bottomLine setBackgroundColor:[UIColor lightGrayColor]];
    [self.view addSubview:bottomLine];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textFiledEditChanged:)
                                                name:UITextFieldTextDidChangeNotification
                                              object:nameTf];
    
}



-(void)textFiledEditChanged:(NSNotification *)obj{
    UITextField *textField = (UITextField *)obj.object;
    
    NSString *toBeString = textField.text;
    NSString *lang = [[UITextInputMode currentInputMode] primaryLanguage]; // 键盘输入模式
    if ([lang isEqualToString:HanFontNamePrefix]) { // 简体中文输入，包括简体拼音，健体五笔，简体手写
        UITextRange *selectedRange = [textField markedTextRange];
        //获取高亮部分
        UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
        // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
        if (!position) {
            if (toBeString.length > kMaxLength) {
                textField.text = [toBeString substringToIndex:kMaxLength];
            }
        }
        // 有高亮选择的字符串，则暂不对文字进行统计和限制
        else{
            
        }
    }
    // 中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
    else{
        if (toBeString.length > kMaxEnLength) {
            textField.text = [toBeString substringToIndex:kMaxEnLength];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
