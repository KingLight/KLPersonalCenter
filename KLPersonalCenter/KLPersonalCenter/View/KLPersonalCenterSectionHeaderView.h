//
//  KLPersonalCenterSectionHeaderView.h
//  KLPersonalCenter
//
//  Created by King on 2018/11/8.
//  Copyright © 2018 king. All rights reserved.
//

#import <UIKit/UIKit.h>
@class KLPersonalCenterCellModel;


@interface KLPersonalCenterSectionHeaderView : UITableViewHeaderFooterView
@property (strong, nonatomic) KLPersonalCenterCellModel *sectionModel;
@end

