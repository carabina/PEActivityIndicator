//
//  ActivityIndicatorView.m
//  CALayersTest
//
//  Created by Pavel Evsaev on 4/20/16.
//  Copyright © 2016 Pavel Evsaev. All rights reserved.
//

#import "PEActivityIndicatorView.h"

static CGFloat const kDefaultWidth = 70.f;
static CGFloat const kDefaultHeigth = 70.f;
static CGFloat const kDefaultCornerRadius = 5.f;
static NSUInteger const kDefaultNumberOfDots = 15;
static NSString * const kAnimationKeyPath = @"transform.scale";
static NSTimeInterval const kDefaultAnimationDuration = 0.75f;

@interface PEActivityIndicatorView ()

@property (weak, nonatomic, readwrite) CAReplicatorLayer *wLayer;
@property (strong, nonatomic, readwrite) CABasicAnimation *dotAnimation;
@property (strong, nonatomic, readwrite) CALayer *dotLayer;

@end

@implementation PEActivityIndicatorView

#pragma mark -
#pragma mark Init

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:CGRectMake(0, 0, kDefaultWidth, kDefaultHeigth)];
    
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
        self.animationDuration = kDefaultAnimationDuration;
        
        self.wLayer = (CAReplicatorLayer *)self.layer;
        self.wLayer.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.75].CGColor;
        self.wLayer.cornerRadius = kDefaultCornerRadius;
        self.wLayer.instanceCount = kDefaultNumberOfDots;
        self.wLayer.instanceDelay = self.animationDuration/self.wLayer.instanceCount;
        self.wLayer.masksToBounds = YES;
        [self.layer addSublayer:self.dotLayer];
    }
    
    return self;
}

+ (Class)layerClass
{
    return [CAReplicatorLayer class];
}

#pragma mark -
#pragma mark Setters

- (void)setDotBorderColor:(UIColor *)dotBorderColor
{
    self.dotLayer.borderColor = dotBorderColor.CGColor;
}

- (void)setDotColor:(UIColor *)dotColor
{
    self.dotLayer.backgroundColor = dotColor.CGColor;
}

- (void)setDotCount:(NSUInteger)dotCount
{
    self.wLayer.instanceCount = dotCount;
    self.wLayer.instanceDelay = _animationDuration / dotCount;
    self.dotAnimation.duration = _animationDuration;
}

- (void)setAnimationDuration:(CFTimeInterval)animationDuration
{
    _animationDuration = animationDuration;
    self.dotAnimation.duration = animationDuration;
    self.wLayer.instanceDelay = animationDuration / self.wLayer.instanceCount;
}

#pragma mark -
#pragma mark Getters

- (CABasicAnimation *)dotAnimation
{
    if (_dotAnimation == nil)
    {
        _dotAnimation = [CABasicAnimation animationWithKeyPath:kAnimationKeyPath];
        _dotAnimation.repeatCount = CGFLOAT_MAX;
        _dotAnimation.duration = _animationDuration;
        _dotAnimation.fromValue = @(1.0);
        _dotAnimation.toValue = @(0.1);
    }
    
    return _dotAnimation;
}

- (CALayer *)dotLayer
{
    if (_dotLayer == nil)
    {
        _dotLayer = [CALayer layer];
        _dotLayer.transform = CATransform3DMakeScale(0.01, 0.01, 0.01);
        _dotLayer.backgroundColor = [UIColor lightGrayColor].CGColor;
        _dotLayer.borderColor = [UIColor whiteColor].CGColor;
        _dotLayer.borderWidth = 1.0;
        _dotLayer.cornerRadius = 2.0;
    }
    
    return _dotLayer;
}

#pragma mark -
#pragma mark Layout

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGSize viewSize = self.bounds.size;
    CGFloat dotWidth = 1.5 * viewSize.width / self.wLayer.instanceCount;
    CGFloat dotHeight = dotWidth;
    CGFloat dotX = (viewSize.width - dotWidth)/2;
    CGFloat dotY = (viewSize.height/4 - dotHeight)/2;
    self.dotLayer.frame = CGRectMake(dotX, dotY, dotWidth, dotHeight);
    
    CGFloat angle = 2*M_PI/self.wLayer.instanceCount;
    self.wLayer.instanceTransform = CATransform3DMakeRotation(angle, 0.0, 0.0, 1.0);
}

#pragma mark -
#pragma mark Public methods

- (void)startAnimating
{
    if([self.dotLayer.animationKeys containsObject:kAnimationKeyPath] == NO)
    {
        [self.dotLayer addAnimation:self.dotAnimation forKey:nil];
    }
}

- (void)stopAnimating
{
    if([self.dotLayer.animationKeys containsObject:kAnimationKeyPath] == YES)
    {
        [self.dotLayer removeAnimationForKey:kAnimationKeyPath];
    }
}

@end
