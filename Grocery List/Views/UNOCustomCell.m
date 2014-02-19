//
//  UNOCustomCell.m
//  Grocery List
//
//  Created by Daniel Ward on 2/18/14.
//  Copyright (c) 2014 UNO CSCI. All rights reserved.
//

#import "UNOCustomCell.h"

@implementation UNOCustomCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
