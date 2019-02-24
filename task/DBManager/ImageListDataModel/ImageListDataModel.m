//
//  ImageListDataModel.m
//  task
//
//  Created by new on 23.02.2019.
//  Copyright © 2019 new. All rights reserved.
//

#import "ImageListDataModel.h"

@implementation ImageListDataModel

- (RLMResults *)getData {
    RLMResults *array = [[[DBManager alloc] init] allImageItems];
    return array;
}

@end
