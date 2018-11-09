//
//  KLPersonalCenterSectionHeaderView.m
//  KLPersonalCenter
//
//  Created by King on 2018/11/8.
//  Copyright © 2018 king. All rights reserved.
//

#import "KLPersonalCenterSectionHeaderView.h"

#import "KLPersonalCenterCellModel.h"

@interface KLPersonalCenterSectionHeaderView ()
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UIImageView *imageView;

@end

static CGFloat space = 15;

@implementation KLPersonalCenterSectionHeaderView


- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
    }
    return _titleLabel;
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.frame = CGRectMake(self.bounds.size.width - self.bounds.size.height - space,
                                      0,
                                      self.bounds.size.height,
                                      self.bounds.size.height);
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _imageView;
}


- (void)setSectionModel:(KLPersonalCenterCellModel *)sectionModel {
    _sectionModel = sectionModel;
    self.titleLabel.text = sectionModel.title;
    self.imageView.image = [UIImage imageNamed:sectionModel.imageName];
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        [self creat];
    }
    return self;
}

- (void)creat {
    [self addSubview:self.titleLabel];
    [self addSubview:self.imageView];
}

- (void)layoutSubviews {
    [super layoutSubviews];
  
    CGFloat width = [self.sectionModel.title sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]}].width;
    self.titleLabel.frame = CGRectMake(space, 0, width, self.bounds.size.height);
}


@end
