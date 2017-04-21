//
//  HTTPTool.m
//  MFoundation
//
//  Created by point on 2017/4/20.
//  Copyright © 2017年 dacai. All rights reserved.
//

#import "HTTPTool.h"

@implementation HTTPTool

+ (void)get:(NSString *)URLString parameters:(id)parameters success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure {
    int value = (arc4random() % 3) + 1;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(value * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSDictionary * dict = @{@"userId":@"19",@"userName":@"zhaodacai"};
        success(dict);
    });
    
}

@end
