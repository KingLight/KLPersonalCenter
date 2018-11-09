//
//  KLPersonalCenterViewController.h
//  KLPersonalCenter
//
//  Created by King on 2018/11/8.
//  Copyright © 2018 king. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KLPersonalCenterCellModel.h"
//@class KLPersonalCenterCellModel;

@protocol KLPersonalCenterViewControllerDelegate <UITableViewDelegate>
- (void)didSelectRow:(KLPersonalCenterCellModel *)cellModle indexPath:(NSIndexPath *)indexPath;
@end

@interface KLPersonalCenterViewController : UIViewController
@property (strong, nonatomic) UITableView *tableView;

@property (weak, nonatomic) id<KLPersonalCenterViewControllerDelegate> delegata;


/**
 表单配置文件
 需要创建一个plist文件，plist文件root为array；
 其结构 请严格按照KLPersonalCenterCellModel属性设置
 */
@property (strong, nonatomic) NSString *formFile;
/*
 个人中心要展示的信息数组
 */
@property (strong, nonatomic) NSArray<KLPersonalCenterCellModel *> *dataSource;


@property (strong, nonatomic) UIColor *separatorColor;
@property (strong, nonatomic) UIColor *titleColor;

/* 自定义行高，默认为44 可不设置*/
@property (assign, nonatomic) CGFloat customRowHeight;

/* 自定义分区头高度 */
@property (assign, nonatomic) CGFloat custemSectionHeaderHeight;

@property (strong, nonatomic) UIFont *titleFont;

@property (assign, nonatomic) CGSize imageSize;

/* 头部视图 */
@property (strong, nonatomic) UIView *headerView;

@property (strong,nonatomic) UIView *footerView;

/* 分割线位置 */
@property (assign, nonatomic) UIEdgeInsets separatorInset;

@property (assign, nonatomic) UITableViewCellSelectionStyle cellSelectionStyle;
@end

