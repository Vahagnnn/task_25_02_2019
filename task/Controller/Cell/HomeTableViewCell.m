//
//  HomeTableViewCell.m
//  task
//
//  Created by new on 23.02.2019.
//  Copyright © 2019 new. All rights reserved.
//

#import "HomeTableViewCell.h"


#define SCREEN_WIDTH    ([UIScreen mainScreen].bounds.size.width-110)


@interface UIImage (SKTagView)
+ (UIImage *)imageWithColor: (UIColor *)color;
@end

@implementation HomeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code

   
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)configurByImageItem:(ImageItem *)item{
    self.itemImageView.image = [UIImage imageWithData:item.imageData];
    self.itemDescriptionTextView.text = item.tagTexst;
    
    CGFloat fixedWidth = self.itemDescriptionTextView.frame.size.width;
    CGSize newSize = [self.itemDescriptionTextView sizeThatFits:CGSizeMake(fixedWidth, MAXFLOAT)];
    CGRect newFrame = self.itemDescriptionTextView.frame;
    newFrame.size = CGSizeMake(fmaxf(newSize.width, fixedWidth), newSize.height);
    self.itemDescriptionTextView.frame = newFrame;
    self.verticalConstreint.constant = newFrame.size.height-10;
    NSArray<NSString*>* tags = [item.tagTexst componentsSeparatedByString:@" "];
    
    self.tagView.preferredMaxLayoutWidth = SCREEN_WIDTH;
    self.tagView.padding = UIEdgeInsetsMake(12, 12, 12, 12);
    self.tagView.interitemSpacing = 8;
    self.tagView.lineSpacing = 5;
    
    [self.tagView removeAllTags];
    
    //Add Tags
    [tags enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        Tag *tag = [Tag tagWithText:obj];
        tag.textColor = [UIColor blackColor];
        tag.fontSize = 8;
        tag.padding = UIEdgeInsetsMake(9.5, 8.5, 9.5, 8.5);
        tag.bgImg = [UIImage imageWithColor:[UIColor lightGrayColor]];
        tag.cornerRadius = 8;
        tag.enable = NO;
        
        [self.tagView addTag:tag];

    }];

    [self getDataFormat:item.data];
}

-(void)getDataFormat:(NSString *)dataString{
    NSLocale *enUSPOSIXLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.locale = enUSPOSIXLocale;
    formatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ssz";
    formatter.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0];
    
    /* the date format is the same as that used by MySQL timestamps */
    
    NSDate *date = [formatter dateFromString:dataString];
    
    NSString *createdDateStr = [formatter stringFromDate:date];
    
    NSDateFormatter *shortFormat = [[NSDateFormatter alloc] init];
    [shortFormat setDateFormat:@"dd/MM/yyy"];
    [shortFormat setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
    
    
    NSDate *parsedDate = [formatter dateFromString:createdDateStr];
    NSLog(@"========= REal Date %@",[shortFormat stringFromDate:parsedDate]);
    
    NSString *result = [shortFormat stringFromDate:parsedDate];
    self.itemDataLabel.text = result;
}



@end
@implementation UIImage (SKTagView)

+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end

