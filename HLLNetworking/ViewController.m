//
//  ViewController.m
//  HLLNetworking
//
//  Created by admin on 16/2/22.
//  Copyright © 2016年 HLL. All rights reserved.
//

#import "ViewController.h"
#import "HLLNetworking.h"
#import "Servier.h"
#import "V_3_X_Networking.h"

@interface ViewController ()<HLLNetworkingDelegate>
@property (nonatomic ,strong) NSMutableArray * serviers;
@property (nonatomic ,strong) V_3_X_Networking * networking;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSDictionary * Authorization = @{@"client_id":@"27117639a9ccba52025157ef2c6551f4996ba16f18e05dab4c34c130dfcfe223",
                                     @"redirect_uri":@"http://yrocky.github.io",
                                     @"response_type":@"get",
                                     @"scope":@"public+read_photos"};
    
    NSDictionary * user = @{@"username":@"jimmyexample",
                            @"order_by":@"latest"};
    self.networking = [V_3_X_Networking getMethodNetworkingWithUelString:@"https://api.unsplash.com/users/:username/likes"
                                                       requestDictionary:user
                                                         requestBodyType:[HLLHTTPBodyType type]
                                                        responseDataType:[HLLJsonDataType type]];
    
    NSString * value = @"Client-ID 27117639a9ccba52025157ef2c6551f4996ba16f18e05dab4c34c130dfcfe223";
    self.networking.HTTPHeaderFieldsWithValues = @{@"Authorization":value};
    
    self.networking.delegate = self;
    [self.networking startRequest];
}


- (void) rootData:(NSArray *)datas{
    
    for (NSDictionary * root in datas) {
        
        Servier * servier = [[Servier alloc] init];
        servier.ID = [root objectForKey:@"id"];
        servier.name = [root objectForKey:@"name"];
        servier.parentID = [root objectForKey:@"parent_id"];
        servier.children = [root objectForKey:@"children"];
        [self enumServier:servier];
    }
    
}
- (void) enumServier:(Servier *)servier {

    while (servier.children && servier.children.count > 1) {
        [self rootData:servier.children];
//        [self.serviers addObject:servier];
        NSLog(@"+++");

    }
    
}
#pragma mark - HLLNetworkingDelegate
- (void)networkingDidRequestSuccess:(HLLNetworking *)networking data:(id)data{

    NSLog(@"%@",[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil]);
}
- (void)networkingDidRequestFailed:(HLLNetworking *)networking error:(NSError *)error{

    NSLog(@"Error:%@",[error localizedDescription]);
}
@end
