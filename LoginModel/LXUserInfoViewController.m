//
//  LXUserInfoViewController.m
//  LoginModel
//
//  Created by Vincent Wang on 2017/8/10.
//  Copyright © 2017年 Subvin.inc. All rights reserved.
//

#import "LXUserInfoViewController.h"
#import "LXNickNameEditController.h"
#import "LXDatePickerView.h"
#import "LXAddressPickerView.h"

#define kListTitleColor [UIColor grayColor]

@interface LXUserInfoViewController ()<UIActionSheetDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate,LXDateDelegate,AddressPickerViewDelegate>
{
    
}

@property(nonatomic,strong)UIImageView *heaerImageView;
//@property(nonatomic,strong)UILabel *nameLabel;
//@property(nonatomic,strong)UILabel *sexLabel;
//@property(nonatomic,strong)UILabel *nameLabel;

@property(nonatomic,strong)UIActionSheet *pageActionSheet;
@property(nonatomic,strong)UIActionSheet *sexActionSheet;
@property(nonatomic,strong)LXDatePickerView *datePicker;
@property(nonatomic,strong)LXAddressPickerView *addressPicker;

@end

@implementation LXUserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:230/255.0f green:230/255.0f blue:230/255.0f alpha:1.0f];
    
    
    UIView *headerBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 80.0f, self.view.width, 90.0f)];
    headerBgView.backgroundColor = [UIColor whiteColor];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapItem:)];
    [headerBgView addGestureRecognizer:tap];
    headerBgView.tag = 19;
    [self.view addSubview:headerBgView];
    
    UILabel *headerTitle = [[UILabel alloc] initWithFrame:CGRectMake(20.0f, (headerBgView.height - 20.0f)/2.0f, 50.0f, 20.0f)];
    [headerTitle setText:@"头像"];
    [headerTitle setTextAlignment:NSTextAlignmentLeft];
    [headerTitle setTextColor:kListTitleColor];
    [headerBgView addSubview:headerTitle];
    
    
    UIImageView *headerImage = [[UIImageView alloc] initWithFrame:CGRectMake((headerBgView.width - 90.0f), (headerBgView.height - 50.0f)/2.0f, 50.0f, 50.0f)];
    [headerImage setImage:[UIImage imageNamed:@"header_default.jpg"]];
    [headerImage makeCorner:headerImage.height/2.0];
    _heaerImageView = headerImage;
    headerImage.layer.borderColor = [UIColor grayColor].CGColor;
    headerImage.layer.borderWidth = 1.5f;
    [headerBgView addSubview:headerImage];
    
    
    UIImageView *navImage = [[UIImageView alloc] initWithFrame:CGRectMake((headerBgView.width - 40.0f) + 10.0f, (headerBgView.height - 18)/2.0f, 12, 18)];
    [navImage setImage:[UIImage imageNamed:@"ic_missiondetail_arrow"]];
    [headerBgView addSubview:navImage];
    
    UIView *bottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, headerBgView.maxY, headerBgView.width, 1.0f)];
    [bottomLine setBackgroundColor:[UIColor lightGrayColor]];
    [self.view addSubview:bottomLine];
    
    
    NSArray *infoNames = @[@"昵称",@"性别",@"生日",@"城市"];
    NSArray *infos = @[@"Name",@"男",@"1990-07-09",@"北京"];
    
    
    CGFloat baseY = bottomLine.maxY + 1;
    for(int i = 0 ; i < infoNames.count ; i++)
    {
        UIView *headerBgView = [[UIView alloc] initWithFrame:CGRectMake(0, baseY, self.view.width, 50.0f)];
        headerBgView.backgroundColor = [UIColor whiteColor];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapItem:)];
        [headerBgView addGestureRecognizer:tap];
        headerBgView.tag = 20 + i;
        [self.view addSubview:headerBgView];
        
        UILabel *headerTitle = [[UILabel alloc] initWithFrame:CGRectMake(20.0f, (headerBgView.height - 20.0f)/2.0f, 50.0f, 20.0f)];
        [headerTitle setText:infoNames[i]];
        [headerTitle setTextAlignment:NSTextAlignmentLeft];
        [headerTitle setTextColor:kListTitleColor];
        [headerBgView addSubview:headerTitle];
        
        UILabel *infoLabel = [[UILabel alloc] initWithFrame:CGRectMake( (headerBgView.width - 40.0f - 200) , (headerBgView.height - 20.0f)/2.0f, 200, 20.0f)];
        [infoLabel setText:infos[i]];
        [infoLabel setTextAlignment:NSTextAlignmentRight];
        [infoLabel setTextColor:kListTitleColor];
        infoLabel.tag = 50 + i;
        [headerBgView addSubview:infoLabel];
        
        UIImageView *navImage = [[UIImageView alloc] initWithFrame:CGRectMake((headerBgView.width - 40.0f) + 10.0f, (headerBgView.height - 18)/2.0f, 12, 18)];
        [navImage setImage:[UIImage imageNamed:@"ic_missiondetail_arrow"]];
        [headerBgView addSubview:navImage];
        
        UIView *bottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, headerBgView.maxY, headerBgView.width, 1.0f)];
        [bottomLine setBackgroundColor:[UIColor lightGrayColor]];
        [self.view addSubview:bottomLine];
        baseY = headerBgView.maxY + 1;
    }
    
    
    NSArray *infoAccount = @[@"手机号",@"QQ",@"微信",@"微博"];
    NSArray *accountInfo = @[@"13257782334",@"已绑定"];
    baseY += 40.0f;
    for(int i = 0 ; i < infoAccount.count ; i++)
    {
        UIView *headerBgView = [[UIView alloc] initWithFrame:CGRectMake(0, baseY, self.view.width, 50.0f)];
        headerBgView.backgroundColor = [UIColor whiteColor];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapItem:)];
        [headerBgView addGestureRecognizer:tap];
        headerBgView.tag = 30 + i;
        [self.view addSubview:headerBgView];
        
        UILabel *headerTitle = [[UILabel alloc] initWithFrame:CGRectMake(20.0f, (headerBgView.height - 20.0f)/2.0f, 70.0f, 20.0f)];
        [headerTitle setText:infoAccount[i]];
        [headerTitle setTextAlignment:NSTextAlignmentLeft];
        [headerTitle setTextColor:kListTitleColor];
        [headerBgView addSubview:headerTitle];
        
        UILabel *infoLabel = [[UILabel alloc] initWithFrame:CGRectMake( (headerBgView.width - 40.0f - 200) , (headerBgView.height - 20.0f)/2.0f, 200, 20.0f)];
        [infoLabel setTextAlignment:NSTextAlignmentRight];
        [infoLabel setTextColor:kListTitleColor];
        [headerBgView addSubview:infoLabel];
        
        if ( 0 == i % 2 ) {
            infoLabel.x += 20.0f;
            [infoLabel setText:accountInfo[i/2]];
        }else
        {
            UIImageView *navImage = [[UIImageView alloc] initWithFrame:CGRectMake((headerBgView.width - 40.0f) + 10.0f, (headerBgView.height - 18)/2.0f, 12, 18)];
            [navImage setImage:[UIImage imageNamed:@"ic_missiondetail_arrow"]];
            [headerBgView addSubview:navImage];
        }
        
        UIView *bottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, headerBgView.maxY, headerBgView.width, 1.0f)];
        [bottomLine setBackgroundColor:[UIColor lightGrayColor]];
        [self.view addSubview:bottomLine];
        baseY = headerBgView.maxY + 1;
    }
    ((TPKeyboardAvoidingScrollView *)self.view).contentSize = CGSizeMake(self.view.width, baseY + 30.0f);
}

-(void)tapItem:(UITapGestureRecognizer *)tap
{
    UIView *view = tap.view;
    NSLog(@"tapYag == %d",view.tag);
    switch (view.tag) {
        case 19:// 头像
        {
            [self chooseUserImage];
        }
            break;
        case 20:  // 昵称
        {
            __weak typeof(self) weakSelf = self;
            LXNickNameEditController *edittNickVc = [LXNickNameEditController new];
            edittNickVc.editFinished = ^(NSString *name)
            {
                [weakSelf setName:name];
                
            };
            [self.navigationController pushViewController:edittNickVc animated:YES];
        }
            break;
        case 21://性别
        {
            [self chooseSex];
        }
            break;
        case 22:// 生日
        {
            [self setDatePicker:_datePicker];
        }
            break;
        case 23:   // 城市
        {
            [self showAddressPicker];
        }
            break;
        case 30: // 手机号
        {
            
        }
            break;
        case 31:// @@
        {
            
        }
            break;
        case 32:// 微信
        {
            
        }
        case 33:
        {
            
        }
        default:
            break;
    }
}

#pragma mark- 选取相片处理 start
-(void)chooseUserImage
{
    [self.pageActionSheet showInView:self.view];
}

-(void)chooseSex
{
    [self.sexActionSheet showInView:self.view];
}

-(void)setName:(NSString *)name
{
    UILabel *nameLabel = [self.view viewWithTag:51];
    [nameLabel setText:name];
}

-(void)setSex:(NSString *)sexString
{
    UILabel *label = [self.view viewWithTag:51];
    [label setText:sexString];
}

-(void)showAddressPicker
{
    LXAddressPickerView *picker = [[LXAddressPickerView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height)];
    picker.delegate = self;
    _addressPicker = picker;
    _addressPicker.backgroundColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.6];
    [[UIApplication sharedApplication].keyWindow addSubview:picker];
}

-(void)dimissAddressPicker
{
    [_addressPicker removeFromSuperview];
    _addressPicker = nil;
}

/** 取消按钮点击事件*/
- (void)cancelBtnClick
{
    [self dimissAddressPicker];
}

/**
 *  完成按钮点击事件
 *
 *  @param province 当前选中的省份
 *  @param city     当前选中的市
 *  @param area     当前选中的区
 */
- (void)sureBtnClickReturnProvince:(NSString *)province
                              City:(NSString *)city
                              Area:(NSString *)area
{
    [self dimissAddressPicker];
}

#pragma -mark 按钮以及手势相应方法 start

-(void)setDatePicker:(UIDatePicker *)datePicker
{
    [_datePicker removeFromSuperview];
    _datePicker = nil;
    
    
    _datePicker = [[LXDatePickerView alloc] initWithFrame:CGRectMake(0, 0 , self.view.width, self.view.height)];
    _datePicker.backgroundColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:0.6];
    _datePicker.delegate = self;
    [_datePicker.cancleButton addTarget:self action:@selector(cancleSetDate) forControlEvents:UIControlEventTouchUpInside];
    [_datePicker.sureButton addTarget:self action:@selector(sureChooseAction) forControlEvents:UIControlEventTouchUpInside];
    UILabel *label = [self.view viewWithTag:52];
    [_datePicker setDateString:label.text];
    [[UIApplication sharedApplication].keyWindow addSubview:_datePicker];
}

-(void)sureChooseAction
{
    [self chooseDate];
    [self dismissPicker];
}
-(void)chooseDate
{
    UILabel *label = [self.view viewWithTag:52];
    label.text = _datePicker.date;
    
}

-(void)dismissPicker
{
    [_datePicker removeFromSuperview];
    _datePicker = nil;
    /*
    [UIView animateWithDuration:0.3f animations:^{
        _datePicker.y = self.view.height;
        
    } completion:^(BOOL finished) {
        
        if (finished) {
            [_datePicker removeFromSuperview];
            _datePicker = nil;
        }
        
    }];
     */
}
-(void)cancleSetDate
{
    [self dismissPicker];
}

- (UIActionSheet *)pageActionSheet
{
    if(!_pageActionSheet) {
        _pageActionSheet = [[UIActionSheet alloc]
                            initWithTitle:nil
                            delegate:self
                            cancelButtonTitle:nil
                            destructiveButtonTitle:nil
                            otherButtonTitles:nil];
        
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
        {
            [_pageActionSheet addButtonWithTitle:NSLocalizedString(@"相机", @"")];
        }
        [_pageActionSheet addButtonWithTitle:NSLocalizedString(@"相册", @"")];
        
        [_pageActionSheet addButtonWithTitle:NSLocalizedString(@"取消", @"")];
        _pageActionSheet.cancelButtonIndex = [self.pageActionSheet numberOfButtons] - 1;
    }
    return _pageActionSheet;
}


- (UIActionSheet *)sexActionSheet
{
    
    if (!_sexActionSheet) {
        
        _sexActionSheet = [[UIActionSheet alloc]
                                         initWithTitle:nil
                                         delegate:self
                                         cancelButtonTitle:nil
                                         destructiveButtonTitle:nil
                                         otherButtonTitles:nil];
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
        {
            [_sexActionSheet addButtonWithTitle:NSLocalizedString(@"男", @"")];
        }
        [_sexActionSheet addButtonWithTitle:NSLocalizedString(@"女", @"")];
        
        [_sexActionSheet addButtonWithTitle:NSLocalizedString(@"保密", @"")];
//        _sexActionSheet.cancelButtonIndex = [_sexActionSheet numberOfButtons] - 1;
    }
    return _sexActionSheet;
}

#pragma mark ------------------------ UIActionSheetDelegate------------------
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *actTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    if ([actTitle isEqualToString:@"相机"])
    {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        picker.delegate = self;
        picker.allowsEditing = YES;
        
        
        [self presentModalViewController:picker animated:YES];
    }
    else if([actTitle isEqualToString:@"相册"])
    {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        picker.delegate = self;
        //        picker.showsCameraControls = NO;
        picker.allowsEditing = YES;
        
        [self presentModalViewController:picker animated:YES];
    }else
    {
        [self setSex:actTitle];
        
    }
    
    self.pageActionSheet = nil;
    self.sexActionSheet = nil;
}
#pragma -mark ---------------------相片选取相关-----------------------
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    
//    self.userImage = image;//[image transformtoSize:kMaxUploadPhotoSize];
//    self.userImageView.image = self.userImage;
    
    [_heaerImageView setImage:image];
    [picker dismissViewControllerAnimated:YES completion:nil];
    
//    [self uploadAvatorWithImage:[image transformtoSize:kMaxUploadPhotoSize]];
    
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
