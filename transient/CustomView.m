//
//  CustomView.m
//  transient
//
//  Created by François Benaiteau on 18/11/14.
//  Copyright (c) 2014 François Benaiteau. All rights reserved.
//

#import "CustomView.h"


@implementation CustomView

- (void)setText:(NSString*)text
{
    self.label.text = text;
    [self.label sizeToFit];
}

#pragma mark - UINibLoadingAdditions

- (void)customize
{
    //    self.backgroundColor = [UIColor lightGrayColor];    
}

- (void)prepareForInterfaceBuilder
{
    //    self.backgroundColor = [UIColor brownColor];// ony on IB
    //    [self setText:@"prepareForInterfaceBuilder"];
    [self customize];
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    //    self.backgroundColor = [UIColor yellowColor];// not seen by IB
    //    [self setText:@"awakeFromNib"];
    [self customize];
}

#pragma mark - Lifecycle

- (void)setup
{
    self.backgroundColor = [UIColor greenColor];// no effect on IB, but used if not overrided
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 0, 0)];
    [self addSubview:self.label];
    [self setText:@"my label"];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //        self.backgroundColor = [UIColor greenColor];// no effect on IB, but used if not overrided
        //        self.label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 0, 0)];
        //        [self addSubview:self.label];
        //        [self setText:@"initWithFrame"];
        [self setup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        //        self.backgroundColor = [UIColor greenColor];// no effect on IB, but used if not overrided
        //        self.label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 0, 0)];
        //        [self addSubview:self.label];
        //        [self setText:@"initWithCoder"];
        [self setup];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
//    self.backgroundColor = [UIColor redColor];// last color applied on IB and simulator
    self.label.center = self.center;
}

- (void)drawRect:(CGRect)rect 
{    
    [super drawRect:rect];
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSetFillColorWithColor(context, [UIColor colorWithWhite:29/255.f alpha:1.0].CGColor);
//    CGContextFillRect(context, rect);
}

@end
