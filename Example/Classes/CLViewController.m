//
//  CLViewController.m
//  CLTableWithFooterViewController
//
//  Created by Chris Ledet on 7/5/13.
//  Copyright (c) 2013 Chris Ledet. All rights reserved.
//

#import "CLViewController.h"

#define MAX_CELL_COUNT 10

@implementation CLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.footerImage = [UIImage imageNamed:@"Footer.png"];

    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    tableView.delegate = self;
    tableView.dataSource = self;

    [self.view addSubview:tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return MAX_CELL_COUNT + 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"TableViewCell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];

    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }

    if (indexPath.section < MAX_CELL_COUNT) {
        cell.textLabel.text = [[NSString alloc] initWithFormat:@"Cell #%d", indexPath.section + 1];
    }

    return cell;
}

@end
