//
//  NetworkService.h
//  task
//
//  Created by new on 24.02.2019.
//  Copyright © 2019 new. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NetworkService : NSObject

+ (void)getDatasuccess:(void (^_Nonnull)(id _Nonnull object))success
               failure:(void (^_Nonnull)(id _Nonnull bject))failure;

@end

NS_ASSUME_NONNULL_END
