//
//  ViewController.m
//  testNib
//
//  Created by zhaojunwei on 13-9-9.
//  Copyright (c) 2013年 zhaojunwei. All rights reserved.
//

#import "ViewController.h"
#import "testNibView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:[[[NSBundle mainBundle] loadNibNamed:@"nibView" owner:nil options:nil] lastObject]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
