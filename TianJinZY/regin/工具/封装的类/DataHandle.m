//
//  DataHandle.m
//  TianJinZY
//
//  Created by mac on 16/6/10.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "DataHandle.h"

@implementation DataHandle

+ (instancetype)shareHandle{
    static DataHandle *datahandle = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        datahandle = [[DataHandle alloc] init];
        
    });
    return datahandle;
}


@end
