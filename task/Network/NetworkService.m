//
//  NetworkService.m
//  task
//
//  Created by new on 24.02.2019.
//  Copyright © 2019 new. All rights reserved.
//

#import "NetworkService.h"
#import <AFNetworking/AFNetworking.h>


@implementation NetworkService

+ (void)getDatasuccess:(void (^_Nonnull)(id _Nonnull object))success
               failure:(void (^_Nonnull)(id _Nonnull bject))failure{
    
    NSString *url = @"https://content.guardianapis.com/search?show-fields=thumbnail";
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:30.0f];
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@" 3b077e7f-8464-460d-a16f-8917d51c5369" forHTTPHeaderField:@"api-key"];
    
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request uploadProgress:^(NSProgress * _Nonnull uploadProgress) {
        
    } downloadProgress:^(NSProgress * _Nonnull downloadProgress) {
        
    } completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error: %@", error);
            failure(error);
        } else {
            NSLog(@"%@ %@", response, responseObject);
            success(responseObject);
        }
    }];
    
    [dataTask resume];
}


@end
