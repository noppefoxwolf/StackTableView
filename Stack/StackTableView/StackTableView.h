//
//  StackTableView.h
//  Stack
//
//  Created by Tomoya_Hirano on 5/7/15.
//  Copyright (c) 2015 Tomoya_Hirano. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

//extend delegate
@class StackTableView;
@protocol StackTableViewDelegate<UITableViewDelegate>
- (void)scrollViewDidScroll:(UIScrollView *)scrollView;
@end
@protocol StackTableViewDataSource <UITableViewDataSource>
@end

@interface StackTableView : UITableView
@end