//
//  Servier.h
//  HLLNetworking
//
//  Created by admin on 16/2/22.
//  Copyright © 2016年 HLL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Servier : NSObject

@property (nonatomic ,strong) NSString * ID;

@property (nonatomic ,strong) NSString * name;

@property (nonatomic ,strong) NSString * parentID;

@property (nonatomic ,strong) NSArray <Servier*>* children;
@end
