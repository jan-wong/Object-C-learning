//
//  BNRDrawViewController.m
//  BNRTouchTracker
//
//  Created by wangjiang on 2018/12/28.
//  Copyright © 2018 wangjiang. All rights reserved.
//

#import "BNRDrawViewController.h"
#import "BNRDrawView.h"

@implementation BNRDrawViewController

-(void) loadView {
    self.view = [[BNRDrawView alloc] initWithFrame:CGRectZero];
}

@end
