//
//  VGASequentialAnimationGroup.h
//  Piyotamago
//
//  Created by 清 貴幸 on 2013/10/03.
//  Copyright (c) 2013年 清 貴幸. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface VGASequentialAnimationGroup : CAAnimationGroup
@property (nonatomic, retain) NSMutableArray *tmpAnimations;

- (void)addAnimation:(CAAnimation*)animation;
- (void)addAnimation:(CAAnimation*)animation duration:(float)duration;

@end
