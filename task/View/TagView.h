//
//  SKTagView.h
//
//  task
//
//  Created by new on 24.02.2019.
//  Copyright © 2019 new. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tag.h"



@interface TagView : UIView


@property (assign, nonatomic) UIEdgeInsets padding;
@property (assign, nonatomic) CGFloat lineSpacing;
@property (assign, nonatomic) CGFloat interitemSpacing;
@property (assign, nonatomic) CGFloat preferredMaxLayoutWidth;
@property (assign, nonatomic) BOOL singleLine;
@property (copy, nonatomic, nullable) void (^didTapTagAtIndex)(NSUInteger index);

- (void)addTag: (nonnull Tag *)tag;
- (void)insertTag: (nonnull Tag *)tag atIndex:(NSUInteger)index;
- (void)removeTag: (nonnull Tag *)tag;
- (void)removeTagAtIndex: (NSUInteger)index;
- (void)removeAllTags;

@end

