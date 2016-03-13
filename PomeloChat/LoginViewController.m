//
//  LoginViewController.m
//  PomeloChat
//
//  Created by Johnny on 12-12-27.
//  Copyright (c) 2012年 netease pomelo team. All rights reserved.
//

#import "LoginViewController.h"
#import "ContactsViewController.h"
#import "ChatViewControllerX.h"

@interface LoginViewController ()
@property (nonatomic, strong) UIActivityIndicatorView *activityIndicatorView;

- (void)entryWithData:(NSDictionary *)data;

@end

@implementation LoginViewController
@synthesize pomelo;
@synthesize window;
@synthesize navController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // ...
    }
    return self;
}

- (IBAction)login:(id)sender
{
    NSString *name = @"iosTEST";
    NSString *channel = @"chat";
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    ChatViewControllerX *root = [[ChatViewControllerX alloc] initWithNibName:@"ChatViewControllerX" bundle:nil];
    self.navController = [[UINavigationController alloc] initWithRootViewController:root];
    [self.window addSubview:navController.view];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    self.window.rootViewController = root;

    //    if (([name length] > 0) && ([channel length] > 0)) {
//        [self.activityIndicatorView startAnimating];
//        [pomelo connectToHost:@"51.254.135.101" onPort:3010 withCallback:^(Pomelo *p){
//            NSDictionary *params = [NSDictionary dictionaryWithObject:name forKey:@"uid"];
//            [pomelo requestWithRoute:@"gate.gateHandler.queryEntry" andParams:params andCallback:^(NSDictionary *result){
//                [pomelo disconnectWithCallback:^(Pomelo *p){
//                    [self entryWithData:result];
//                }];
//            }];
//        }];
//    }
    //[self.navigationController pushViewController:self.contactsViewController animated:YES];
}

- (void)entryWithData:(NSDictionary *)data
{
    NSLog(@"passe data");
    NSString *host = [data objectForKey:@"host"];
    NSInteger port = [[data objectForKey:@"port"] intValue];
    NSString *name = @"iosTEST";
    NSString *channel = @"chat";
    
    [pomelo connectToHost:host onPort:port withCallback:^(Pomelo *p){
        NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
                                name, @"username",
                                channel, @"rid",
                                nil];
        [p requestWithRoute:@"connector.entryHandler.enter" andParams:params andCallback:^(NSDictionary *result){
            NSArray *userList = [result objectForKey:@"users"];
//            [self.contactsViewController.contactList addObjectsFromArray:userList];
//            [self.contactsViewController.contactList removeObject:name];
//            [self.activityIndicatorView stopAnimating];
//            [self.navigationController pushViewController:self.contactsViewController animated:YES];
        }];
    }];
}

- (IBAction)textFieldDoneEditing:(id)sender
{
	[sender resignFirstResponder];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"back1.png"]];
    CGRect frame = CGRectMake (120.0, 250.0, 90, 90);
    
    self.activityIndicatorView = [[UIActivityIndicatorView alloc] initWithFrame:frame];
    self.activityIndicatorView.center = self.view.center;
    [self.view addSubview:self.activityIndicatorView];
    
    self.title = @"Login";
//    self.contactsViewController = [[ContactsViewController alloc] initWithStyle:UITableViewStylePlain];
//    contactsViewController.pomelo = pomelo;
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
