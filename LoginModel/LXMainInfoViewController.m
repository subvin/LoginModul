//
//  LXMainInfoViewController.m
//  LoginModel
//
//  Created by Vincent Wang on 2017/8/10.
//  Copyright © 2017年 Subvin.inc. All rights reserved.
//

#import "LXMainInfoViewController.h"
#import "LXLoginViewController.h"


@interface LXMainInfoViewController ()

@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)UIImageView *headerImageView;
@property(nonatomic,strong)UIImageView *vipImageView;

@end

@implementation LXMainInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    UIView *bgInfoView = [[UIView alloc] initWithFrame:CGRectMake(0, 80.0f, self.view.width, 150.0f)];
    
    bgInfoView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:bgInfoView];
    
    
    UIImageView *headerImageVew = [[UIImageView alloc] initWithFrame:CGRectMake((bgInfoView.width - 85)/2.0f, 20.0f, 85.0f, 85.0f)];
    [headerImageVew setImage:[UIImage imageNamed:@"img_login_headshot"]];
    headerImageVew.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(loginChoose)];
    
    [headerImageVew addGestureRecognizer:tap];
    
    _headerImageView = headerImageVew;
    [bgInfoView addSubview:headerImageVew];
    
    
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake((bgInfoView.width - 80.0f)/2.0f - 20.0f, headerImageVew.maxY + 10.0f, 80.0f, 20.0f)];
    [nameLabel setText:@"未登录"];
    [nameLabel setTextAlignment:NSTextAlignmentRight];
    [bgInfoView addSubview:nameLabel];
    
    
    UIImageView *vipImageVew = [[UIImageView alloc] initWithFrame:CGRectMake(nameLabel.maxX, nameLabel.y + 2.5f , 20.0f, 15.0f)];
    [vipImageVew setImage:[UIImage imageNamed:@"btn_my_vip_pressed"]];
    _vipImageView = vipImageVew;
    [bgInfoView addSubview:vipImageVew];
    
    
}

-(void)loginChoose
{
    LXLoginViewController *loginVc = [LXLoginViewController new];
    [self.navigationController pushViewController:loginVc animated:YES];
    
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
