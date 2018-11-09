//
//  KLPersonalCenterViewController.m
//  KLPersonalCenter
//
//  Created by King on 2018/11/8.
//  Copyright © 2018 king. All rights reserved.
//

#import "KLPersonalCenterViewController.h"
#import "KLPersonalCenterSectionHeaderView.h"
#import "KLPersonalCenterCellModel.h"

#define KLPersonBundle [NSBundle bundleForClass:[self class]]


@interface KLPersonalCenterViewController ()<UITableViewDelegate, UITableViewDataSource>
@end


static NSString *SectionViewID = @"KLPersonalCenterSectionHeaderView";
static NSString *CellID = @"UITableViewCell";

@implementation KLPersonalCenterViewController

#pragma mark - Getter
- (CGSize)imageSize {
    if (CGSizeEqualToSize(_imageSize, CGSizeZero)) {
        _imageSize = CGSizeMake(30, 30);
    }
    return _imageSize;
}

- (UITableViewCellSelectionStyle)cellSelectionStyle {
    if (!_cellSelectionStyle) {
        _cellSelectionStyle = UITableViewCellSelectionStyleNone;
    }
    return _cellSelectionStyle;
}

#pragma mark - Setter
- (void)setFormFile:(NSString *)formFile {
    _formFile = formFile;
    self.dataSource = [KLPersonalCenterCellModel objectArrayWithFilename:formFile];
    [self.tableView reloadData];
}

- (void)setSeparatorColor:(UIColor *)separatorColor {
    _separatorColor = separatorColor;
    [self.tableView setSeparatorColor:separatorColor];
}

- (void)setHeaderView:(UIView *)headerView {
    _headerView = headerView;
    self.tableView.tableHeaderView = headerView;
}

- (void)setFooterView:(UIView *)footerView {
    _footerView = footerView;
    self.tableView.tableFooterView = footerView;
}

- (void)setCustomRowHeight:(CGFloat)customRowHeight {
    _customRowHeight = customRowHeight;
    self.tableView.rowHeight = customRowHeight;
}

- (void)setCustemSectionHeaderHeight:(CGFloat)custemSectionHeaderHeight {
    _custemSectionHeaderHeight = custemSectionHeaderHeight;
    self.tableView.sectionHeaderHeight = custemSectionHeaderHeight;
}

- (void)setSeparatorInset:(UIEdgeInsets)separatorInset {
    _separatorInset = separatorInset;
     [self.tableView setSeparatorInset:separatorInset];
}

- (instancetype)init {
    self = [super initWithNibName:@"KLPersonalCenterViewController" bundle:KLPersonBundle];
//    self = [[[NSBundle mainBundle] loadNibNamed:@"KLPersonalCenterViewController" owner:self options:nil] lastObject];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configTableView];
}

- (void)configTableView {
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.rowHeight = 44;
    self.tableView.sectionFooterHeight = 0.1;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellID];
    [self.tableView registerClass:NSClassFromString(SectionViewID) forHeaderFooterViewReuseIdentifier:SectionViewID];
    self.tableView.tableFooterView = self.footerView?self.footerView:[UIView new];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource[section].subItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID forIndexPath:indexPath];
    [self setupCellStyle:cell indexPath:indexPath];
    return cell;
}

- (void)setupCellStyle:(UITableViewCell *)cell indexPath:(NSIndexPath *)indexPath {
     KLPersonalCenterCellModel *cellModel = self.dataSource[indexPath.section].subItems[indexPath.row];
    CGSize imageSize = self.imageSize;
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, UIScreen.mainScreen.scale);
    CGRect imageRect = CGRectMake(0.0, 0.0, imageSize.width, imageSize.height);
    [cell.imageView.image drawInRect:imageRect];
    cell.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    if (self.titleColor)  cell.textLabel.textColor = self.titleColor;
    if (self.titleFont) [cell.textLabel setFont:self.titleFont];
    cell.textLabel.text = cellModel.title;
    cell.imageView.image = [UIImage imageNamed:cellModel.imageName];
    cell.accessoryType = cellModel.accessoryType;
    cell.selectionStyle = self.cellSelectionStyle;
}

- (nullable UITableViewHeaderFooterView *)headerViewForSection:(NSInteger)section {
    KLPersonalCenterCellModel *sectionModel = self.dataSource[section];
    if (sectionModel.title && sectionModel.title.length > 0) {
        KLPersonalCenterSectionHeaderView *view = [self.tableView dequeueReusableHeaderFooterViewWithIdentifier:SectionViewID];
        view.sectionModel = sectionModel;
        return view;
    }
    
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
     KLPersonalCenterCellModel *cellModel = self.dataSource[indexPath.section].subItems[indexPath.row];
    if (self.delegata && [self.delegata respondsToSelector:@selector(didSelectRow:indexPath:)]) {
        [self.delegata didSelectRow:cellModel indexPath:indexPath];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    KLPersonalCenterCellModel *sectionModel = self.dataSource[section];
    if (sectionModel.title && sectionModel.title.length > 0) {
        return 44;
    }
    return 0.1;
}
@end
