//
//  DBManager.h
//  task
//
//  Created by new on 23.02.2019.
//  Copyright © 2019 new. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ImageItem.h"

@interface DBManager : NSObject

- (void)insertImageItem:(NSDictionary *)dict;
- (void)deleteAllObjects;

- (RLMResults *)allImageItems;


@end
