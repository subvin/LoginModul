//
//  LXRegisterViewController.m
//  LoginModel
//
//  Created by Vincent Wang on 2017/8/10.
//  Copyright © 2017年 Subvin.inc. All rights reserved.
//

#import "LXRegisterViewController.h"
#import "LXPWDSettingController.h"
#import "LXCornalView.h"

@interface LXRegisterViewController ()

@end

@implementation LXRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.hidden = YES;
    self.view.backgroundColor = [UIColor colorWithRed:39/255.0 green:134/255.0f blue:193/255.0f alpha:1.0f];
    
    
    UIImageView *headerImageVew = [[UIImageView alloc] initWithFrame:CGRectMake((self.view.width - 130)/2.0f, 80.f, 130.f, 130.f)];
    [headerImageVew setImage:[UIImage imageNamed:@"img_login_headshot"]];
    
    [self.view addSubview:headerImageVew];
    
    
    
    UITextField *userNameTextField = [[UITextField alloc] initWithFrame:CGRectMake((self.view.width - 280)/2.0f, headerImageVew.maxY + 40, 280, 30.0f)];
    userNameTextField.textColor =[UIColor whiteColor];
    [userNameTextField setAttributedPlaceholder:[[NSAttributedString alloc] initWithString:@"请输入手机号" attributes:@{NSForegroundColorAttributeName:kBorderMainColor}]];
    
    [self.view addSubview:userNameTextField];
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake((self.view.width - 280)/2.0f, userNameTextField.maxY + 5.0f, 280, 1.0f)];
    line.backgroundColor = kBorderMainColor;
    [self.view addSubview:line];
    
    
    UITextField *passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake((self.view.width - 280)/2.0f, line.maxY + 10.0f, 280, 30.0f)];
    passwordTextField.textColor =[UIColor whiteColor];
    [passwordTextField setAttributedPlaceholder:[[NSAttributedString alloc] initWithString:@"请输入登录密码" attributes:@{NSForegroundColorAttributeName:kBorderMainColor}]];
    [self.view addSubview:passwordTextField];
    
    UIView *line2 = [[UIView alloc] initWithFrame:CGRectMake((self.view.width - 280)/2.0f, passwordTextField.maxY + 5.0f, 280, 1.0f)];
    line2.backgroundColor = kBorderMainColor;
    [self.view addSubview:line2];
    
    
    UIButton *checkCodeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    checkCodeBtn.frame = CGRectMake(passwordTextField.maxX - 100.0f, passwordTextField.minY, 100.0f, 30.0f);
    [checkCodeBtn makeCorner:checkCodeBtn.height/2.0f];
    checkCodeBtn.layer.borderWidth = 1.0f;
    checkCodeBtn.layer.borderColor = [UIColor colorWithRed:250/255.0 green:206/255.0 blue:47.0/255 alpha:1.0f].CGColor;
    [checkCodeBtn setTitleColor:[UIColor colorWithRed:250/255.0 green:206/255.0 blue:47.0/255 alpha:1.0f] forState:UIControlStateNormal];
    [checkCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [checkCodeBtn.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [checkCodeBtn addTarget:self action:@selector(getCheckCode:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:checkCodeBtn];
    
    
    UIButton *nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    nextBtn.frame = CGRectMake((self.view.width - 245)/2.0, line2.maxY + 50.0f, 245.0f, 35.0f);
    [nextBtn makeCorner:nextBtn.height/2.0f];
    nextBtn.layer.borderWidth = 1.0f;
    nextBtn.layer.borderColor = kBorderMainColor.CGColor;
    [nextBtn setTitleColor:kBorderMainColor forState:UIControlStateNormal];
    [nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
    [nextBtn.titleLabel setFont:[UIFont systemFontOfSize:18]];
    [nextBtn addTarget:self action:@selector(next) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextBtn];
    
    LXCornalView *cornalView = [[LXCornalView alloc] initWithFrame:CGRectMake(0, self.view.height - kBottomHeight, self.view.width - 0.0f, kBottomHeight)];
    cornalView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:cornalView];
    [cornalView setNeedsDisplay];
    
    ((TPKeyboardAvoidingScrollView *)self.view).contentSize = CGSizeMake(self.view.width, cornalView.maxY);
    ((TPKeyboardAvoidingScrollView *)self.view).scrollEnabled = NO;
}

-(void)getCheckCode:(UIButton *)button
{
    
}

-(void)next
{
    LXPWDSettingController *pwdSettingVC = [LXPWDSettingController new];
    [self.navigationController pushViewController:pwdSettingVC animated:YES];
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
