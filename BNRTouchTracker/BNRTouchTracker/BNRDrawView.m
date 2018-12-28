//
//  BNRDrawView.m
//  BNRTouchTracker
//
//  Created by wangjiang on 2018/12/28.
//  Copyright © 2018 wangjiang. All rights reserved.
//

#import "BNRDrawView.h"
#import "BNRLine.h"

@interface BNRDrawView ()

//@property (nonatomic, strong) BNRLine *currentLine;
@property (nonatomic, strong) NSMutableDictionary *linesInProgress;
@property (nonatomic, strong) NSMutableArray *finishedLines;

@end

@implementation BNRDrawView

#pragma mark - Instance type
-(instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.linesInProgress = [[NSMutableDictionary alloc] init];
        self.finishedLines = [[NSMutableArray alloc] init];
        self.backgroundColor = [UIColor grayColor];
        self.multipleTouchEnabled = YES;
    }
    return self;
}

#pragma mark - Draw
-(void)strokeLine:(BNRLine *) line {
    UIBezierPath *bp = [UIBezierPath bezierPath];
    bp.lineWidth = 10;
    bp.lineCapStyle = kCGLineCapRound;
    
    [bp moveToPoint:line.begin];
    [bp addLineToPoint:line.end];
    [bp stroke];
}
-(void) drawRect: (CGRect) rect {
    [[UIColor blackColor] set];
    for (BNRLine *line in self.finishedLines) {
        [self strokeLine:line];
    }
    //    if (self.currentLine) {
    //        [[UIColor redColor] set];
    //        [self strokeLine:self.currentLine];
    //    }
    [[UIColor redColor] set];
    for (NSValue *key in _linesInProgress) {
        [self strokeLine:self.linesInProgress[key]];
    }
}

#pragma mark - Touch
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //    UITouch *t = [touches anyObject];
    //    CGPoint location = [t locationInView:self];
    //
    //    self.currentLine = [[BNRLine alloc] init];
    //    self.currentLine.begin = location;
    //    self.currentLine.end = location;
    NSLog(@"%@", NSStringFromSelector(_cmd));
    for(UITouch *t in touches) {
        CGPoint location = [t locationInView:self];
        BNRLine *line = [[BNRLine alloc] init];
        line.begin = location;
        line.end = location;
        
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        self.linesInProgress[key] = line;
    }
    [self setNeedsDisplay];
}
-(void) touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //    UITouch *t = [touches anyObject];
    //    CGPoint location = [t locationInView:self];
    for(UITouch *t in touches) {
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        BNRLine *line = self.linesInProgress[key];
        line.end = [t locationInView:self];
    }
    
    //    self.currentLine.end = location;
    [self setNeedsDisplay];
}
-(void) touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //    [self.finishedLines addObject:self.currentLine];
    //    self.currentLine = nil;
    for (UITouch *t in touches) {
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        BNRLine *line = self.linesInProgress[key];
        [self.finishedLines addObject:line];
        [self.linesInProgress removeObjectForKey:line];
    }
    [self setNeedsDisplay];
}

@end
