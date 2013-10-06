VGASequentialAnimationGroup
===========================

CAAnimationを連続的に実行したいときによしなにしてくれるクラス
(アニメーションのbeginTimeとdurationを勝手に計算する

## 使い方
Lib以下のファイルをimport

``

    VGASequentialAnimationGroup *animationGroup = [[VGASequentialAnimationGroup alloc] init];

    CABasicAnimation *animation1 = [[CABasicAnimation alloc] init];
    CABasicAnimation *animation2 = [[CABasicAnimation alloc] init];
    CABasicAnimation *animation3 = [[CABasicAnimation alloc] init];

    [animationGroup addAnimation:animation1
                        duration:1.0f];
    [animationGroup addAnimation:animation2
                        duration:1.0f];
    [animationGroup addAnimation:animation3
                        duration:1.0f];
    
    [view.layer addAnimation:animationGroup
                               forKey:@"demo-animation"];

``
