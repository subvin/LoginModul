//
//  LXPWDSettingController.m
//  LoginModel
//
//  Created by Vincent Wang on 2017/8/10.
//  Copyright © 2017年 Subvin.inc. All rights reserved.
//

#import "LXPWDSettingController.h"
#import "LXCornalView.h"


@interface LXPWDSettingController ()
{
    UITextField *pwdTextField;
    UITextField *comfirmPasswordTextField;
}

@end

@implementation LXPWDSettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.hidden = YES;
    self.view.backgroundColor = [UIColor colorWithRed:39/255.0 green:134/255.0f blue:193/255.0f alpha:1.0f];
    
    
    UIImageView *headerImageVew = [[UIImageView alloc] initWithFrame:CGRectMake((self.view.width - 130)/2.0f, 80.f, 130.f, 130.f)];
    [headerImageVew setImage:[UIImage imageNamed:@"img_login_headshot"]];
    [self.view addSubview:headerImageVew];
    
    pwdTextField = [[UITextField alloc] initWithFrame:CGRectMake((self.view.width - 280)/2.0f, headerImageVew.maxY + 40, 280, 30.0f)];
    pwdTextField.textColor =[UIColor whiteColor];
    pwdTextField.secureTextEntry = YES;
    [pwdTextField setAttributedPlaceholder:[[NSAttributedString alloc] initWithString:@"请设置密码" attributes:@{NSForegroundColorAttributeName:kBorderMainColor}]];
    [self.view addSubview:pwdTextField];
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake((self.view.width - 280)/2.0f, pwdTextField.maxY + 5.0f, 280, 1.0f)];
    line.backgroundColor = kBorderMainColor;
    [self.view addSubview:line];
    
    comfirmPasswordTextField = [[UITextField alloc] initWithFrame:CGRectMake((self.view.width - 280)/2.0f, line.maxY + 10.0f, 280, 30.0f)];
    comfirmPasswordTextField.textColor =[UIColor whiteColor];
    comfirmPasswordTextField.secureTextEntry = YES;
    [comfirmPasswordTextField setAttributedPlaceholder:[[NSAttributedString alloc] initWithString:@"请重复密码" attributes:@{NSForegroundColorAttributeName:kBorderMainColor}]];
    [self.view addSubview:comfirmPasswordTextField];
    
    UIView *line2 = [[UIView alloc] initWithFrame:CGRectMake((self.view.width - 280)/2.0f, comfirmPasswordTextField.maxY + 5.0f, 280, 1.0f)];
    line2.backgroundColor = kBorderMainColor;
    [self.view addSubview:line2];
    
    
    
    UIButton *finishBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    finishBtn.frame = CGRectMake((self.view.width - 245)/2.0, line2.maxY + 50.0f, 245.0f, 35.0f);
    [finishBtn makeCorner:finishBtn.height/2.0f];
    finishBtn.layer.borderWidth = 1.0f;
    finishBtn.layer.borderColor = kBorderMainColor.CGColor;
    [finishBtn setTitleColor:kBorderMainColor forState:UIControlStateNormal];
    [finishBtn setTitle:@"完成" forState:UIControlStateNormal];
    [finishBtn.titleLabel setFont:[UIFont systemFontOfSize:18]];
    [finishBtn addTarget:self action:@selector(finish) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:finishBtn];
    
    
    LXCornalView *cornalView = [[LXCornalView alloc] initWithFrame:CGRectMake(0, self.view.height - kBottomHeight, self.view.width - 0.0f, kBottomHeight)];
    cornalView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:cornalView];
    
    
    [cornalView setNeedsDisplay];
    
    
    
    ((TPKeyboardAvoidingScrollView *)self.view).contentSize = CGSizeMake(self.view.width, cornalView.maxY);
    ((TPKeyboardAvoidingScrollView *)self.view).scrollEnabled = NO;
}

-(void)finish
{
    NSDictionary *dict = @{@"phone":_phone,@"password":comfirmPasswordTextField.text,@"confirm_password":_checkCode,@"source":kUserSourceCode};
    
    [[LXUserManager sharedInstance] registerUserWithInfo:dict success:^(NSString *result) {
        
        NSLog(@"%@",result);
    } fail:^(NSString *result) {
        
        NSLog(@"result");
    }];
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
