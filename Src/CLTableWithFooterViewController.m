/*
 CLTableWithFooterViewController.m

 Copyright (c) 2013 Chris Ledet
 Licensed under the MIT license <http://opensource.org/licenses/MIT>

 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
 documentation files (the "Software"), to deal in the Software without restriction, including without limitation
 the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and
 to permit persons to whom the Software is furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all copies or substantial portions
 of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED
 TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
 CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
 IN THE SOFTWARE.
 */

#import "CLTableWithFooterViewController.h"

@interface CLTableWithFooterViewController()

@property (nonatomic, strong) UIImageView *footerImageView;

@end

@implementation CLTableWithFooterViewController

#pragma mark Layout

- (void)viewDidLoad
{
    [super viewDidLoad];

    if (!self.tableView) {
        [self setUpTableView];
    }

    self.footerImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:self.footerImageView];
}

- (void)setUpTableView
{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

#pragma mark Properties

- (void)setFooterImage:(UIImage *)footerImage
{
    if (_footerImage != footerImage) {
        _footerImage = footerImage;

        self.footerImageView.image = self.footerImage;
        self.footerImageView.frame = CGRectZero;
    }
}

#pragma mark UIScrollView Delegate

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
