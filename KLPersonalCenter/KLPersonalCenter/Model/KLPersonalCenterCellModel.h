//
//  KLPersonalCenterCellModel.h
//  KLPersonalCenter
//
//  Created by King on 2018/11/8.
//  Copyright © 2018 king. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 个人中心的cell对应的模型
 */
@interface KLPersonalCenterCellModel : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *imageName;
@property (assign, nonatomic) UITableViewCellAccessoryType accessoryType;
@property (strong, nonatomic) NSArray<KLPersonalCenterCellModel *> *subItems;

+ (NSArray<KLPersonalCenterCellModel *> *)objectArrayWithFilename:(NSString *)fileName;
@end


