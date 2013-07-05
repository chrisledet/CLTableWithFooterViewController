//
//  CLTableWithFooterViewController.m
//
//  Copyright (c) 2013 Chris Ledet
//

#import "CLTableWithFooterViewController.h"

@interface CLTableWithFooterViewController()

@property (nonatomic, strong) UIImageView *footerImageView;

@end

@implementation CLTableWithFooterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.footerImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:self.footerImageView];
}

#pragma mark - Properties

- (void)setFooterImage:(UIImage *)footerImage
{
    if (_footerImage != footerImage) {
        _footerImage = footerImage;

        self.footerImageView.image = self.footerImage;
        self.footerImageView.frame = CGRectZero;
    }
}

#pragma mark - UIScrollViewDelegate Methods

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int totalHeightOfScrollView = scrollView.contentSize.height - self.footerImageView.image.size.height;
    float footerImageViewY = (totalHeightOfScrollView - scrollView.contentOffset.y);
    float footerImageViewX = 0;
    float bottomEdge = scrollView.contentOffset.y + scrollView.frame.size.height;

    if (bottomEdge >= scrollView.contentSize.height) {
        footerImageViewY = scrollView.frame.size.height - self.footerImageView.image.size.height;
    }

    if (self.footerImageView.image.size.width < self.view.frame.size.width) {
        footerImageViewX = (self.view.frame.size.width/2)-(self.footerImageView.image.size.width/2);
    }

    [self.view addSubview:self.footerImageView];
    self.footerImageView.frame = CGRectMake(footerImageViewX, footerImageViewY, self.footerImageView.image.size.width, self.footerImageView.image.size.height);
}

@end
