//
//  CustomView.h
//  transient
//
//  Created by François Benaiteau on 18/11/14.
//  Copyright (c) 2014 François Benaiteau. All rights reserved.
//

#import <UIKit/UIKit.h>
IB_DESIGNABLE
@interface CustomView : UIView
@property(nonatomic,strong)UILabel* label;
- (void)setText:(NSString*)text;
@end
