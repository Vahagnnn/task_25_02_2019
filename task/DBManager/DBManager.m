//
//  DBManager.m
//  task
//
//  Created by new on 23.02.2019.
//  Copyright © 2019 new. All rights reserved.
//

#import "DBManager.h"

@implementation DBManager

- (void)insertImageItem:(NSDictionary *)dict {
    ImageItem *item = [[ImageItem alloc] initWithValue:dict];
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    [realm addObject:item];
    [realm commitWriteTransaction];
}

- (RLMResults *)allImageItems {
    return [ImageItem allObjects];
}

-(void)deleteAllObjects{
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    [realm deleteAllObjects];
    [realm commitWriteTransaction];
}




@end
