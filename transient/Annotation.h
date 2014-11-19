//
//  Annotation.h
//  transient
//
//  Created by François Benaiteau on 19/11/14.
//  Copyright (c) 2014 François Benaiteau. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Annotation <NSObject>
- (NSString*)note;
- (IBAction)showNote:(id)sender;
@end
