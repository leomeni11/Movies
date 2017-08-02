//
//  LoginViewController.m
//  Movies
//
//  Created by george on 11/06/2017.
//  Copyright © 2017 george. All rights reserved.
//

#import "LoginViewController.h"
#import "HomeViewController.h"
#import "MenuCollectionViewCell.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = TRUE;

    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"moviens.png"]]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)button_signin:(id)sender {
    
}


@end
