//
//  HomeTableViewCell.h
//  task
//
//  Created by new on 23.02.2019.
//  Copyright © 2019 new. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageItem.h"
#import "TagView.h"
@class TagView;


NS_ASSUME_NONNULL_BEGIN

@interface HomeTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *itemImageView;
@property (weak, nonatomic) IBOutlet UITextView *itemDescriptionTextView;
@property (weak, nonatomic) IBOutlet TagView *tagView;
@property (weak, nonatomic) IBOutlet UILabel *itemDataLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *verticalConstreint;


-(void)configurByImageItem :(ImageItem *)item;

@end

NS_ASSUME_NONNULL_END
