//
//  LoginViewController.h
//  PomeloChat
//
//  Created by Johnny on 12-12-27.
//  Copyright (c) 2012年 netease pomelo team. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Pomelo.h"

@interface LoginViewController : UIViewController

@property (weak, nonatomic) Pomelo *pomelo;
@property (weak, nonatomic) IBOutlet UITextField *UserName;
@property (weak, nonatomic) IBOutlet UITextField *Password;

@end
