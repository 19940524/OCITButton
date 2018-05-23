//
//  ViewController.m
//  OCITButton
//
//  Created by 红鹊豆 on 2018/5/21.
//  Copyright © 2018年 薛国宾. All rights reserved.
//

#import "ViewController.h"
#import "ITButton.h"

@interface ViewController () <UITextFieldDelegate> {
    ITButton *button;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    button = [ITButton buttonWithType:UIButtonTypeCustom];
    button.itMargin = 10;
    button.itAlignment = ITAlignmentLHCenter;
    button.frame = CGRectMake(20, 64, 100, 100);
    button.backgroundColor = [UIColor lightGrayColor];
    [button setTitle:@"搜索" forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"search"] forState:UIControlStateNormal];
    [self.view addSubview:button];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSInteger value = textField.text.intValue;
    button.itAlignment = value;
    [button layoutIfNeeded];
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

