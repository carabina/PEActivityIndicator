//
//  ActivityIndicatorView.h
//  CALayersTest
//
//  Created by Pavel Evsaev on 4/20/16.
//  Copyright © 2016 Pavel Evsaev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PEActivityIndicatorView : UIView

@property (strong, nonatomic, readwrite) UIColor *dotColor;
@property (strong, nonatomic, readwrite) UIColor *dotBorderColor;
@property (assign, nonatomic, readwrite) NSUInteger dotCount;
@property (assign, nonatomic, readwrite) CFTimeInterval animationDuration;

- (void)startAnimating;
- (void)stopAnimating;

@end
