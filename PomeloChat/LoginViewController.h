//
//  LoginViewController.h
//  PomeloChat
//
//  Created by Johnny on 12-12-27.
//  Copyright (c) 2012年 netease pomelo team. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Pomelo.h"
#import "ChatViewController.h"
#import "Menu.h"

@interface LoginViewController : UIViewController

@property (weak, nonatomic) Pomelo *pomelo;
@property (weak, nonatomic) IBOutlet UITextField *UserName;
@property (weak, nonatomic) IBOutlet UITextField *Password;
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *navController;

@end
