//
//  ImageItem.h
//  task
//
//  Created by new on 23.02.2019.
//  Copyright © 2019 new. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Realm/Realm.h>


@interface ImageItem : RLMObject

@property (nonatomic, strong) NSString *identifier;
@property (nonatomic, strong) NSData *imageData;
@property (nonatomic, strong) NSString *tagTexst;
@property (nonatomic, strong) NSString *data;




@end
