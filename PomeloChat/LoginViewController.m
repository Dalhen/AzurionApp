//
//  LoginViewController.m
//  PomeloChat
//
//  Created by Johnny on 12-12-27.
//  Copyright (c) 2012年 netease pomelo team. All rights reserved.
//

#import "LoginViewController.h"
#import "ContactsViewController.h"

@interface LoginViewController ()

@property (strong, nonatomic) ContactsViewController *contactsViewController;

- (void)entryWithData:(NSDictionary *)data;

@end

@implementation LoginViewController

@synthesize contactsViewController;
@synthesize pomelo;

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
    NSString *name = @"user";
    NSString *channel = @"chat";
    
    if (([name length] > 0) && ([channel length] > 0)) {
        [pomelo connectToHost:@"51.254.135.101" onPort:3010 withCallback:^(Pomelo *p){
            NSDictionary *params = [NSDictionary dictionaryWithObject:name forKey:@"uid"];
            [pomelo requestWithRoute:@"gate.gateHandler.queryEntry"  andParams:params andCallback:^(NSDictionary *result){
                [pomelo disconnectWithCallback:^(Pomelo *p){
                    [self entryWithData:result];
                }];
            }];
        }];
    }
    //[self.navigationController pushViewController:self.contactsViewController animated:YES];
}

- (void)entryWithData:(NSDictionary *)data
{
    NSString *host = [data objectForKey:@"host"];
    NSInteger port = [[data objectForKey:@"port"] intValue];
    NSString *name = @"user";
    NSString *channel = @"chat";
    [pomelo connectToHost:host onPort:port withCallback:^(Pomelo *p){
        NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
                                name, @"users",
                                channel, @"rid",
                                nil];
        [p requestWithRoute:@"connector.entryHandler.enter" andParams:params andCallback:^(NSDictionary *result){
            NSArray *userList = [result objectForKey:@"users"];
            [self.contactsViewController.contactList addObjectsFromArray:userList];
            [self.contactsViewController.contactList removeObject:name];
            [self.navigationController pushViewController:self.contactsViewController animated:YES]; 
        }];
    }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Login";
    self.contactsViewController = [[ContactsViewController alloc] initWithStyle:UITableViewStylePlain];
    contactsViewController.pomelo = pomelo;
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
