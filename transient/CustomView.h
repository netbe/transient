//
//  CustomView.h
//  transient
//
//  Created by François Benaiteau on 18/11/14.
//  Copyright (c) 2014 François Benaiteau. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 Learning:
 IB preview will use initWithFrame, prepareForInterfaceBuilder, read the xib values, layoutSubviews, drawRect
 Running app will use initWihCoder, awakeFromNib, viewDidLoad, layoutSubviews, drawRect
 Storyboard does not show customView
 
 Order
 initWihCoder || initWithFrame
 awakeFromNib || prepareForInterfaceBuilder
 viewDidLoad
 layoutSubviews || updateConstraints
 drawRect
 */

IB_DESIGNABLE
@interface CustomView : UIView
@property(nonatomic,strong)UILabel* label;
- (void)setText:(NSString*)text;
@end
