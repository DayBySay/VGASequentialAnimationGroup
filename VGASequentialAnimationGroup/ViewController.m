//
//  ViewController.m
//  VGASequentialAnimationGroup
//
//  Created by 清 貴幸 on 2013/10/06.
//  Copyright (c) 2013年 清 貴幸. All rights reserved.
//

#import "ViewController.h"
#import "VGASequentialAnimationGroup.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.demoView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    [self.demoView setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:self.demoView];
}

- (void)viewDidAppear:(BOOL)animated
{
    VGASequentialAnimationGroup *animationGroup = [[VGASequentialAnimationGroup alloc] init];
    //移動する座標
    CGPoint buttomPoint = CGPointMake(self.demoView.center.x, self.demoView.center.y + 50);
    CGPoint rightPoint = CGPointMake(self.demoView.center.x + 50, self.demoView.center.y + 50);
    CGPoint topPoint = CGPointMake(self.demoView.center.x + 50 , self.demoView.center.y);
    CGPoint leftPoint = CGPointMake(self.demoView.center.x, self.demoView.center.y);
    
    CABasicAnimation *buttom = [self getAnimationWithFromPosition:self.demoView.center
                                                     toPosition:buttomPoint
                                                        keyPath:@"position"];
    CABasicAnimation *right = [self getAnimationWithFromPosition:buttomPoint
                                                     toPosition:rightPoint
                                                        keyPath:@"position"];
    CABasicAnimation *top = [self getAnimationWithFromPosition:rightPoint
                                                     toPosition:topPoint
                                                        keyPath:@"position"];
    CABasicAnimation *left = [self getAnimationWithFromPosition:topPoint
                                                     toPosition:leftPoint
                                                        keyPath:@"position"];
    [animationGroup addAnimation:buttom
                        duration:1.0f];
    [animationGroup addAnimation:right
                        duration:1.0f];
    [animationGroup addAnimation:top
                        duration:1.0f];
    [animationGroup addAnimation:left
                        duration:1.0f];
    
    [self.demoView.layer addAnimation:animationGroup
                               forKey:@"demo-animation"];
    
   
}

- (CABasicAnimation*)getAnimationWithFromPosition:(CGPoint)fPositon toPosition:(CGPoint)tPosition keyPath:(NSString*)keyPath
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:keyPath];
    animation.fromValue = [NSValue valueWithCGPoint:fPositon];
    animation.toValue = [NSValue valueWithCGPoint:tPosition];
    return animation;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
