//
//  task
//
//  Created by new on 24.02.2019.
//  Copyright © 2019 new. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class Tag;
@interface TagButton: UIButton

+ (nonnull instancetype)buttonWithTag: (nonnull Tag *)tag;

@end
