//
//  task
//
//  Created by new on 24.02.2019.
//  Copyright © 2019 new. All rights reserved.
//

#import "Tag.h"

static const CGFloat kDefaultFontSize = 13.0;

@implementation Tag

- (instancetype)init {
    self = [super init];
    if (self) {
        _fontSize = kDefaultFontSize;
        _textColor = [UIColor blackColor];
        _bgColor = [UIColor whiteColor];
        _enable = YES;
    }
    return self;
}

- (instancetype)initWithText: (NSString *)text {
    self = [self init];
    if (self) {
        _text = text;
    }
    return self;
}

+ (instancetype)tagWithText: (NSString *)text {
    return [[self alloc] initWithText: text];
}

@end
