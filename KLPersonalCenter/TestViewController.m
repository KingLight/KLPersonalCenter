//
//  TestViewController.m
//  KLPersonalCenter
//
//  Created by King on 2018/11/8.
//  Copyright © 2018 king. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()<KLPersonalCenterViewControllerDelegate>

@end

@implementation TestViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.formFile = @"PersonalCenter.plist";
    self.separatorColor = [UIColor redColor];
    self.customRowHeight = 50;
    self.titleFont = [UIFont boldSystemFontOfSize:20];
    self.titleColor = [UIColor orangeColor];
    self.delegata = self;
    
    self.imageSize = CGSizeMake(60, 60);
    
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 200)];
    header.backgroundColor = [UIColor redColor];
//    self.headerView = header;
    UIView *footer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 200)];
    footer.backgroundColor = [UIColor purpleColor];
//    self.footerView = footer;
//    self.separatorInset = UIEdgeInsetsMake(0, 100, 0, 0);
//    self.cellSelectionStyle = UITableViewCellSelectionStyleDefault;
    
    // Do any additional setup after loading the view.
}

- (void)didSelectRow:(KLPersonalCenterCellModel *)cellModle indexPath:(NSIndexPath *)indexPath {
    NSLog(@"%@, %ld, %ld", cellModle.title, indexPath.section, indexPath.row);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%@,%ld", tableView,indexPath.row);
}

@end
