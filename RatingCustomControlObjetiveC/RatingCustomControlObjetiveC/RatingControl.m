//
//  RatingControl.m
//  RatingCustomControlObjetiveC
//
//  Created by Antonio Cortes on 1/25/18.
//  Copyright © 2018 Antonio Cortes. All rights reserved.
//

#import "RatingControl.h"

@implementation RatingControl

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpButtons];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setUpButtons];
    }
    return self;
}

//MARK: Private Methods
-(void)setUpButtons{
    // Create the button
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundColor:UIColor.redColor];
    // Add constraints
    [button setTranslatesAutoresizingMaskIntoConstraints:NO];
    [[button.heightAnchor constraintEqualToConstant:40.0] setActive:YES];
    [[button.widthAnchor constraintEqualToConstant:40.0] setActive:YES];
    // Add the button to the stack
    [self addArrangedSubview:button];
}

@end
