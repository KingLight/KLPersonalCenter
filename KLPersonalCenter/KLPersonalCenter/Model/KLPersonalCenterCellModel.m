//
//  KLPersonalCenterCellModel.m
//  KLPersonalCenter
//
//  Created by King on 2018/11/8.
//  Copyright © 2018 king. All rights reserved.
//

#import "KLPersonalCenterCellModel.h"

@implementation KLPersonalCenterCellModel

+ (instancetype)objectWithDict:(NSDictionary *)d {
    KLPersonalCenterCellModel *model = [[KLPersonalCenterCellModel alloc] init];
    if (model) {
        model.title = d[@"title"];
        model.imageName = d[@"imageName"];
        model.accessoryType = [d[@"accessoryType"] integerValue];
        NSArray *array = d[@"subItems"];
        if (array && array.count > 0) {
            NSMutableArray *mutable = [NSMutableArray array];
            for (NSDictionary *dict in array) {
                KLPersonalCenterCellModel *model = [self objectWithDict:dict];
                [mutable addObject:model];
            }
            model.subItems = [mutable copy];
        }
    }
    return model;
}

+ (NSArray<KLPersonalCenterCellModel *> *)objectArrayWithFilename:(NSString *)fileName {
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:fileName ofType:nil]];
    NSMutableArray *mutable = [NSMutableArray array];
    for (NSDictionary *d in array) {
        KLPersonalCenterCellModel *model = [self objectWithDict:d];
        [mutable addObject:model];
    }
    return [mutable copy];
}

@end
