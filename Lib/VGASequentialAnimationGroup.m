//
//  VGASequentialAnimationGroup.m
//  Piyotamago
//
//  Created by 清 貴幸 on 2013/10/03.
//  Copyright (c) 2013年 清 貴幸. All rights reserved.
//

#import "VGASequentialAnimationGroup.h"

@implementation VGASequentialAnimationGroup

- (id)init
{
    self = [super init];
    if (self) {
        self.tmpAnimations = [[NSMutableArray alloc] init];
        self.fillMode = kCAFillModeForwards;
        self.removedOnCompletion = NO;
    }
    return self;
}

- (void)addAnimation:(CAKeyframeAnimation *)animation
{
    if (self.animations.count > 0) {
        [self _addAnimationCalcDuration:animation];
    } else {
        animation.fillMode = kCAFillModeForwards;
        animation.removedOnCompletion = NO;
        [self.tmpAnimations addObject:animation];
        self.animations = self.tmpAnimations;
        self.duration = animation.duration;
    }
}

- (void)addAnimation:(CAKeyframeAnimation *)animation duration:(float)duration
{
    animation.duration = duration;
    [self addAnimation:animation];
}

- (void)_addAnimationCalcDuration:(CAKeyframeAnimation*)animation
{
    //直前までのアニメーション全体の経過時間を計算してbegintimeに設定する
    CAKeyframeAnimation *lastAnimation = [self.animations lastObject];
    float calcedBegintime = lastAnimation.duration + lastAnimation.beginTime;
    animation.beginTime = calcedBegintime;
    
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    
    [self.tmpAnimations addObject:animation];
    self.animations = self.tmpAnimations;
    self.duration = calcedBegintime + animation.duration;
}

@end
