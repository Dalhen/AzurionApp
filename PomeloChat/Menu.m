//
//  ChatViewController.m
//  PomeloChat
//
//  Created by Johnny on 12-12-27.
//  Copyright (c) 2012年 netease pomelo team. All rights reserved.
//

#import "Menu.h"
#import "EFAnimationViewController.h"

@interface ChatViewControllerX ()
@property (strong, nonatomic) NSMutableString *chatStr;
@property (nonatomic, strong) EFAnimationViewController *viewController;
@end

@implementation ChatViewControllerX

@synthesize chatStr;
@synthesize pomelo;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
     self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"back1.png"]];
    self.viewController = ({ EFAnimationViewController *viewController = [[EFAnimationViewController alloc] init]; [self.view addSubview:viewController.view]; [self addChildViewController:viewController];
        [viewController didMoveToParentViewController:self]; viewController; });
 }


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [super viewDidUnload];
}
@end
