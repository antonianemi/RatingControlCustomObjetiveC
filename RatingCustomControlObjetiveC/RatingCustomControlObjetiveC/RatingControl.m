//
//  RatingControl.m
//  RatingCustomControlObjetiveC
//
//  Created by Antonio Cortes on 1/25/18.
//  Copyright © 2018 Antonio Cortes. All rights reserved.
//
#import "RatingControl.h"
@implementation RatingControl
NSMutableArray *ratingButtons;
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        ratingButtons = [[NSMutableArray alloc] init];
        [self setUpButtons];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        ratingButtons = [[NSMutableArray alloc] init];
        [self setUpButtons];
    }
    return self;
}
-(void)setRating:(NSUInteger)rating{
    _rating = rating;
    [self updateButtonSelectionStates];
}
-(void)setStarSize:(CGSize)starSize{
    _starSize = starSize;
    [self setUpButtons];
}

-(void)setStarCount:(int)starCount{
    _starCount = starCount;
    [self setUpButtons];
}
//MARK: Private Methods
-(void)setUpButtons{
    //Remove all the buttons
    for(UIButton *btn in ratingButtons){
        [self removeArrangedSubview:btn];
        [btn removeFromSuperview];
    }
    [ratingButtons removeAllObjects];
    // Load Button Images
    NSBundle *bundle = [NSBundle bundleForClass:self.class];
    UIImage* filledStar = [UIImage imageNamed:@"filledStar" inBundle:bundle compatibleWithTraitCollection:self.traitCollection];
    UIImage* emptyStar = [UIImage imageNamed:@"emptyStar" inBundle:bundle compatibleWithTraitCollection:self.traitCollection];
    UIImage* highlightedStar = [UIImage imageNamed:@"highlightedStar" inBundle:bundle compatibleWithTraitCollection:self.traitCollection];
    for (int i = 0; i < _starCount; i++)
    {
    // Create the button
    UIButton *button = [[UIButton alloc] init];
    [button setImage:emptyStar forState:UIControlStateNormal];
    [button setImage:filledStar forState:UIControlStateSelected];
    [button setImage:highlightedStar forState:UIControlStateHighlighted];
    // Add constraints
    [button setTranslatesAutoresizingMaskIntoConstraints:NO];
    [[button.heightAnchor constraintEqualToConstant:_starSize.height] setActive:YES];
    [[button.widthAnchor constraintEqualToConstant:_starSize.width] setActive:YES];
    // Setup the button action
    [button addTarget:self action:@selector(ratingButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    // Add the button to the stack
    [self addArrangedSubview:button];
    // Add the new button to the rating button array
    [ratingButtons addObject:button];
    }
    [self updateButtonSelectionStates];
}
-(void)ratingButtonTapped:(UIButton *)sender{
    NSUInteger index = [ratingButtons indexOfObject:sender];
    // Calculate the rating of the selected button
    NSUInteger selectedRating = index + 1;
    if (selectedRating == _rating){
        // If the selected star represents the current rating, reset the rating to 0.
        [self setRating:0];
    }
    else{
        // Otherwise set the rating to the selected star
        [self setRating:selectedRating];
    }
}

-(void)updateButtonSelectionStates{
    [ratingButtons enumerateObjectsUsingBlock:^(id obj, NSUInteger index, BOOL *stop){
    [[ratingButtons objectAtIndex:index] setSelected: index < _rating];
    }];
}

@end
