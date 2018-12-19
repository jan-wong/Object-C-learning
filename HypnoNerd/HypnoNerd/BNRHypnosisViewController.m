//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by wangjiang on 2018/12/3.
//  Copyright © 2018 wangjiang. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"

@implementation BNRHypnosisViewController

-(instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBarItem.title = @"Hypnosis";
        UIImage *i = [UIImage imageNamed:@"Hypno.png"];
        self.tabBarItem.image = i;
    }
    return self;
}

-(void) loadView {
    BNRHypnosisView *backgroundView = [[BNRHypnosisView alloc] init];
    
    CGRect textFieldRect = CGRectMake(40, 70, 240, 30);
    UITextField *textField = [[UITextField alloc] initWithFrame:textFieldRect];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = @"hypnotize me";
    textField.returnKeyType = UIReturnKeyDone;
    textField.delegate = self;
    
    [backgroundView addSubview:textField];
    self.view = backgroundView;
}

-(void) viewDidLoad {
    [super viewDidLoad];
    NSLog(@"hypno loaded its view");
}

-(BOOL) textFieldShouldReturn: (UITextField *) textField {
    [self drawHypnoticMessage:textField.text];
    
    textField.text = @"";
    
    [textField resignFirstResponder];
    return YES;
}

-(void) drawHypnoticMessage: (NSString *) message {
    UILabel *messageLabel = [[UILabel alloc] init];
    
    messageLabel.backgroundColor = [UIColor clearColor];
    messageLabel.textColor = [UIColor whiteColor];
    messageLabel.text = message;
    
    [messageLabel sizeToFit];
    
    int width = (int) (self.view.bounds.size.width - messageLabel.bounds.size.width);
    int x = arc4random() % width;
    
    int height = (int) (self.view.bounds.size.height - messageLabel.bounds.size.width);
    int y = arc4random() % height;
    
    CGRect frame = messageLabel.frame;
    frame.origin = CGPointMake(x, y);
    messageLabel.frame = frame;
    
    [self.view addSubview:messageLabel];
    
    UIInterpolatingMotionEffect *motionEffect;
    motionEffect = [[UIInterpolatingMotionEffect alloc]
                    initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    motionEffect.minimumRelativeValue = @(-25);
    motionEffect.maximumRelativeValue = @(25);
    [messageLabel addMotionEffect:motionEffect];
    
    motionEffect = [[UIInterpolatingMotionEffect alloc]
                    initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    motionEffect.minimumRelativeValue = @(-25);
    motionEffect.maximumRelativeValue = @(25);
    [messageLabel addMotionEffect:motionEffect];
}
@end

