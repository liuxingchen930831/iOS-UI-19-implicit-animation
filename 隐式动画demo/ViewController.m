//
//  ViewController.m
//  隐式动画demo
//
//  Created by liuxingchen on 16/10/26.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import "ViewController.h"

#define angle2radion(angle) ((angle) / 180.0 * M_PI)
@interface ViewController ()
@property (nonatomic, weak) CALayer *layer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CALayer *layer = [CALayer layer];
    
    layer.position = CGPointMake(200, 150);
    
    //    layer.anchorPoint = CGPointZero;
    
    layer.bounds = CGRectMake(0, 0, 80, 80);
    
    layer.backgroundColor = [UIColor redColor].CGColor;
    
    [self.view.layer addSublayer:layer];
    
    _layer = layer;
    
    /**
     * 隐式动画必须要自己创建layer，或者非root layer
     可以用view 的layer来测试
     */
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // 旋转
    // 1 ~ 360
    
    _layer.transform = CATransform3DMakeRotation(angle2radion(arc4random_uniform(360) + 1), 0, 0, 1);
    
    _layer.position = CGPointMake(arc4random_uniform(200) + 20, arc4random_uniform(400) + 50);
    
    _layer.cornerRadius = arc4random_uniform(50);
    
    _layer.backgroundColor = [self randomColor].CGColor;
    
    _layer.borderWidth = arc4random_uniform(10);
    _layer.borderColor = [self randomColor].CGColor;
    
}

- (UIColor *)randomColor
{
    
    CGFloat r = arc4random_uniform(256) / 255.0;
    CGFloat b = arc4random_uniform(256) / 255.0;
    CGFloat g = arc4random_uniform(256) / 255.0;
    
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}

@end
