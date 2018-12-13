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
    NSLog(@"%@", textField.text);
    return YES;
}
@end

