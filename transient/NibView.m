//
//  NibView.m
//  transient
//
//  Created by François Benaiteau on 30/08/15.
//  Copyright (c) 2015 François Benaiteau. All rights reserved.
//

#import "NibView.h"
@interface NibView ()
@property (weak, nonatomic) IBOutlet UILabel *myLabel;

@end

@implementation NibView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [NibView loadFromXib];
    self.frame = frame;
    return self;
}

- (id)awakeAfterUsingCoder:(NSCoder *)aDecoder {
    if (self.subviews.count == 0) {
       return [self loadReplacementViewFromXib];
    }
    return self;
}

#pragma mark helper

+ (instancetype)loadFromXib {
    NSArray* elements = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil];
    for (id anObject in elements) {
        if ([anObject isKindOfClass:[self class]]) {
            return anObject;
        }
    }
    return nil;
}

- (instancetype)loadReplacementViewFromXib {
    UIView* view = [self.class loadFromXib];
    // pass properties through
    view.frame = self.frame;
    view.autoresizingMask = self.autoresizingMask;
    view.alpha = self.alpha;
    view.hidden = self.hidden;
    view.backgroundColor = self.backgroundColor;
    // constraints
    view.translatesAutoresizingMaskIntoConstraints =
    self.translatesAutoresizingMaskIntoConstraints;
    for (NSLayoutConstraint *constraint in self.constraints)
    {
        id firstItem = constraint.firstItem;
        if (firstItem == self)
        {
            firstItem = view;
        }
        id secondItem = constraint.secondItem;
        if (secondItem == self)
        {
            secondItem = view;
        }
        [view addConstraint:
         [NSLayoutConstraint constraintWithItem:firstItem
                                      attribute:constraint.firstAttribute
                                      relatedBy:constraint.relation
                                         toItem:secondItem
                                      attribute:constraint.secondAttribute
                                     multiplier:constraint.multiplier
                                       constant:constraint.constant]];
    }
    return view;
}
@end
