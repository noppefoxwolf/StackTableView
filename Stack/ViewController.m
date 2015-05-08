//
//  ViewController.m
//  Stack
//
//  Created by Tomoya_Hirano on 5/7/15.
//  Copyright (c) 2015 Tomoya_Hirano. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>{
    NSMutableArray*images;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    images = [NSMutableArray new];
    for (int i=0; i<7; i++) {
        NSString*file = [NSString stringWithFormat:@"%d.jpg",i];
        [images addObject:[UIImage imageNamed:file]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell*cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    UIImageView*iv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 200)];
    iv.backgroundColor = [UIColor redColor];
    iv.image = images[indexPath.row%7];
    [cell.contentView addSubview:iv];
    return cell;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}

@end
