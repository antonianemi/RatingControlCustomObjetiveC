//
//  RatingControl.h
//  RatingCustomControlObjetiveC
//
//  Created by Antonio Cortes on 1/25/18.
//  Copyright © 2018 Antonio Cortes. All rights reserved.
//

#import <UIKit/UIKit.h>
IB_DESIGNABLE
@interface RatingControl : UIStackView
-(instancetype)initWithFrame:(CGRect)frame;
-(instancetype)initWithCoder:(NSCoder *)coder;
@property(nonatomic) IBInspectable CGSize starSize;
@property(nonatomic) IBInspectable int starCount;
@property(nonatomic) NSUInteger rating;
@end
