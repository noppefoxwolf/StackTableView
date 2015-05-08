//
//  StackTableView.m
//  Stack
//
//  Created by Tomoya_Hirano on 5/7/15.
//  Copyright (c) 2015 Tomoya_Hirano. All rights reserved.
//

#import "StackTableView.h"

@implementation StackTableView{
    __weak id<StackTableViewDelegate> _mDelegate;
    
    UIImageView*_goastView;
}

- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        [self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup{
    self.delegate = self;
    
    _goastView = [UIImageView new];
    _goastView.contentMode = UIViewContentModeTop|UIViewContentModeScaleAspectFit;
    self.backgroundView = _goastView;
}

- (void)setDelegate:(id<UITableViewDelegate>)delegate{
    if (delegate == self) {
        [super setDelegate:delegate];
    } else {
        _mDelegate = (id<StackTableViewDelegate>)delegate;
    }
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    if ([_mDelegate respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)]) {
        [_mDelegate tableView:tableView didSelectRowAtIndexPath:indexPath];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([_mDelegate respondsToSelector:@selector(tableView:heightForRowAtIndexPath:)]) {
        return [_mDelegate tableView:tableView heightForRowAtIndexPath:indexPath];
    }
    return 44;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"cal");
    
    NSArray *paths = [self indexPathsForVisibleRows];
    for (NSIndexPath *path in paths) {
        UITableViewCell*cell = [self cellForRowAtIndexPath:path];
        cell.alpha = 1;
    }
    
    NSIndexPath *index = [paths firstObject];
    if ([self indexPathForRowAtPoint:scrollView.contentOffset]) {
        UITableViewCell*cell = [self cellForRowAtIndexPath:index];
        _goastView.image = [self imageFromView:cell];
        cell.alpha = 0;
    }else{
        _goastView.image = nil;
    }
    
    if ([_mDelegate respondsToSelector:@selector(scrollViewDidScroll:)]) {
        [_mDelegate scrollViewDidScroll:scrollView];
    }
}

- (UIImage*)imageFromView:(UIView*)view{
    UIImage* image;
    UIGraphicsBeginImageContextWithOptions(view.frame.size, true, 2.0f);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [view.layer renderInContext:context];
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end