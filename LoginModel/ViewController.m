//
//  ViewController.m
//  LoginModel
//
//  Created by Vincent Wang on 2017/8/10.
//  Copyright © 2017年 Subvin.inc. All rights reserved.
//

#import "ViewController.h"
#import "LXMainInfoViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)jump:(id)sender {
    
    LXMainInfoViewController *mainVc = [LXMainInfoViewController new];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:mainVc];
    [self presentViewController:nav animated:YES completion:^{
        
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
