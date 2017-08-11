//
//  LXLoginViewController.m
//  LoginModel
//
//  Created by Vincent Wang on 2017/8/10.
//  Copyright © 2017年 Subvin.inc. All rights reserved.
//

#import "LXLoginViewController.h"
#import "LXRegisterViewController.h"
#import "LXUserInfoViewController.h"
#import "LXCornalView.h"
@interface LXLoginViewController ()
{
    UITextField *userNameTextField;
    UITextField *passwordTextField;
}

@end

@implementation LXLoginViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.hidden = YES;
    self.view.backgroundColor = [UIColor colorWithRed:39/255.0 green:134/255.0f blue:193/255.0f alpha:1.0f];
    
    
    UIImageView *headerImageVew = [[UIImageView alloc] initWithFrame:CGRectMake((self.view.width - 130)/2.0f, 80.f, 130.f, 130.f)];
    [headerImageVew setImage:[UIImage imageNamed:@"img_login_headshot"]];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showInfo)];
    headerImageVew.userInteractionEnabled = YES;
    [headerImageVew addGestureRecognizer:tap];
    [self.view addSubview:headerImageVew];
    
    userNameTextField = [[UITextField alloc] initWithFrame:CGRectMake((self.view.width - 250)/2.0f + 15.0f, headerImageVew.maxY + 40, 250, 30.0f)];
    userNameTextField.textColor =[UIColor whiteColor];
    userNameTextField.keyboardType = UIKeyboardTypeNumberPad;
    [userNameTextField setAttributedPlaceholder:[[NSAttributedString alloc] initWithString:@"请输入手机号" attributes:@{NSForegroundColorAttributeName:kBorderMainColor}]];
    [self.view addSubview:userNameTextField];
    
    UIImageView *phoneImageVew = [[UIImageView alloc] initWithFrame:CGRectMake((self.view.width - 280)/2.0f, userNameTextField.minY + 7.5f, 15, 15)];
    [phoneImageVew setImage:[UIImage imageNamed:@"ic_login_phone"]];
    [phoneImageVew setContentMode:UIViewContentModeScaleAspectFill];
    [self.view addSubview:phoneImageVew];
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake((self.view.width - 280)/2.0f, userNameTextField.maxY + 5.0f, 280, 1.0f)];
    line.backgroundColor = kBorderMainColor;
    [self.view addSubview:line];
    
    
    passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake((self.view.width - 250)/2.0f + 15.0f, line.maxY + 10.0f, 250, 30.0f)];
    passwordTextField.textColor =[UIColor whiteColor];
    passwordTextField.keyboardType = UIKeyboardTypeNamePhonePad;
    [passwordTextField setAttributedPlaceholder:[[NSAttributedString alloc] initWithString:@"请输入登录密码" attributes:@{NSForegroundColorAttributeName:kBorderMainColor}]];
    [self.view addSubview:passwordTextField];
    
    UIImageView *pwdImageVew = [[UIImageView alloc] initWithFrame:CGRectMake((self.view.width - 280)/2.0f, passwordTextField.minY + 7.5f, 15, 15)];
    [pwdImageVew setImage:[UIImage imageNamed:@"ic_login_password"]];
    [pwdImageVew setContentMode:UIViewContentModeScaleAspectFill];
    [self.view addSubview:pwdImageVew];
    
    UIView *line2 = [[UIView alloc] initWithFrame:CGRectMake((self.view.width - 280)/2.0f, passwordTextField.maxY + 5.0f, 280, 1.0f)];
    line2.backgroundColor = kBorderMainColor;
    [self.view addSubview:line2];
    
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    loginBtn.frame = CGRectMake((self.view.width - 245)/2.0, line2.maxY + 50.0f, 245.0f, 35.0f);
    [loginBtn makeCorner:loginBtn.height/2.0f];
    loginBtn.layer.borderWidth = 1.0f;
    loginBtn.layer.borderColor = kBorderMainColor.CGColor;
    [loginBtn setTitleColor:kBorderMainColor forState:UIControlStateNormal];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn.titleLabel setFont:[UIFont systemFontOfSize:18]];
    [loginBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    
    
    UIButton *noAccountBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    noAccountBtn.frame = CGRectMake(loginBtn.midX - 105.0f, loginBtn.maxY + 20.0f, 70, 20);
    [noAccountBtn setTitleColor:kYellowBorderColor forState:UIControlStateNormal];
    [noAccountBtn setTitle:@"没有账号？" forState:UIControlStateNormal];
    [noAccountBtn.titleLabel setFont:[UIFont systemFontOfSize:13]];
    [noAccountBtn addTarget:self action:@selector(noAccount) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:noAccountBtn];
    
    
    
    UIButton *forgetBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    forgetBtn.frame = CGRectMake(loginBtn.midX + 35.0f, loginBtn.maxY + 20.0f, 70, 20);
    [forgetBtn setTitleColor:kYellowBorderColor forState:UIControlStateNormal];
    [forgetBtn setTitle:@"忘记密码？" forState:UIControlStateNormal];
    [forgetBtn.titleLabel setFont:[UIFont systemFontOfSize:13]];
    [forgetBtn addTarget:self action:@selector(forgetPWD) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:forgetBtn];
    
    
    NSArray *imageArray = @[@"ic_login_wx",@"ic_login_qq",@"ic_login_wb"];
    CGFloat baseX = loginBtn.frame.origin.x;
    CGFloat baseY = forgetBtn.maxY + 30.0f;
    CGFloat widthOfEveryListBtn = loginBtn.width/imageArray.count;
    
    for (int i = 0; i < imageArray.count ; i ++) {
        
        UIButton *listBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        listBtn.frame = CGRectMake( (baseX + i * widthOfEveryListBtn) + (widthOfEveryListBtn - 25.0f)/2.0 , baseY, 25.0f, 25.0f);
        [listBtn setImage:[UIImage imageNamed:imageArray[i]] forState:UIControlStateNormal];
        [listBtn addTarget:self action:@selector(loginList:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:listBtn];
    }
    
    LXCornalView *cornalView = [[LXCornalView alloc] initWithFrame:CGRectMake(0, self.view.height - kBottomHeight, self.view.width - 0.0f, kBottomHeight)];
    cornalView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:cornalView];
    
    NSLog(@"self.view == %@",self.view);
    [cornalView setNeedsDisplay];
    
    ((TPKeyboardAvoidingScrollView *)self.view).contentSize = CGSizeMake(self.view.width, cornalView.maxY);
    ((TPKeyboardAvoidingScrollView *)self.view).scrollEnabled = NO;
}

-(void)getCheckCode:(UIButton *)button
{
    
}

-(void)loginList:(UIButton *)button
{
    
}

-(void)login
{
    [self.view endEditing:YES];
    
    NSDictionary *dict = @{@"phone":userNameTextField.text,@"password":passwordTextField.text,@"source":kUserSourceCode};
    [[LXUserManager sharedInstance] signIn:dict success:^(NSString *result) {
        
        
    } fail:^(NSString *result) {
        
        
    }];
}

-(void)showInfo
{
    LXUserInfoViewController *infoVc = [LXUserInfoViewController new];
    [self.navigationController pushViewController:infoVc animated:YES];
}

-(void)forgetPWD
{
    LXRegisterViewController *registerVc = [LXRegisterViewController new];
    [self.navigationController pushViewController:registerVc animated:YES];
}

-(void)noAccount
{
    LXRegisterViewController *registerVc = [LXRegisterViewController new];
    [self.navigationController pushViewController:registerVc animated:YES];
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
