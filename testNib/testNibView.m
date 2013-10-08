//
//  testNibView.m
//  testNib
//
//  Created by zhaojunwei on 13-9-9.
//  Copyright (c) 2013年 zhaojunwei. All rights reserved.
//

#import "testNibView.h"
#import <QuartzCore/QuartzCore.h>

@interface testNibView()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, assign) BOOL needAssign;
@property (nonatomic, assign) BOOL isExpanded;
@end

@implementation testNibView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.layer.cornerRadius = 5;
        
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
    }
    return self;
}

- (id)awakeAfterUsingCoder:(NSCoder *)aDecoder
{
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    else if (section == 1) {
        if (self.isExpanded) {
            return 4;
        }
        return 1;
    }
    else {
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"nibView" owner:nil options:nil] objectAtIndex:1];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([indexPath row] == 1) {
        return 200;
    }
    return 135;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1 && indexPath.row == 0) {
        if (self.isExpanded) {
            self.isExpanded = NO;
            [tableView deleteRowsAtIndexPaths:
             [NSArray arrayWithObjects:
              [NSIndexPath indexPathForRow:1 inSection:1],
              [NSIndexPath indexPathForRow:2 inSection:1],
              [NSIndexPath indexPathForRow:3 inSection:1],
              nil]
                             withRowAnimation:UITableViewRowAnimationMiddle];
        }
        else {
            self.isExpanded = YES;
            [tableView insertRowsAtIndexPaths:
             [NSArray arrayWithObjects:
              [NSIndexPath indexPathForRow:1 inSection:1],
              [NSIndexPath indexPathForRow:2 inSection:1],
              [NSIndexPath indexPathForRow:3 inSection:1],
              nil]
                             withRowAnimation:UITableViewRowAnimationMiddle];
        }
    }
}



@end
