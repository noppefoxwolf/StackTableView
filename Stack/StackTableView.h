//
//  StackTableView.h
//  Stack
//
//  Created by Tomoya_Hirano on 5/7/15.
//  Copyright (c) 2015 Tomoya_Hirano. All rights reserved.
//

#import <UIKit/UIKit.h>

//extend delegate
@class StackTableView;
@protocol StackTableViewDelegate<UITableViewDelegate>
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)scrollViewDidScroll:(UIScrollView *)scrollView;
@end

@interface StackTableView : UITableView<UITableViewDelegate>

@end