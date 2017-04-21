//
//  HTTPTool.h
//  MFoundation
//
//  Created by point on 2017/4/20.
//  Copyright © 2017年 dacai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTTPTool : NSObject

+ (void)get:(NSString *)URLString parameters:(id)parameters success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

@end
