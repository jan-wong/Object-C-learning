//
//  BNRReminderViewController.m
//  HypnoNerd
//
//  Created by wangjiang on 2018/12/3.
//  Copyright © 2018 wangjiang. All rights reserved.
//

#import "BNRReminderViewController.h"

@interface BNRReminderViewController()
@property (nonatomic, weak) IBOutlet UIDatePicker *datePicker;
@end

@implementation BNRReminderViewController

-(instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBarItem.title = @"Reminder";
        UIImage *i = [UIImage imageNamed:@"Time.png"];
        self.tabBarItem.image = i;
    }
    return self;
}

-(IBAction)addReminder:(id)sender {
    NSDate *date = self.datePicker.date;
    NSLog(@"setting a reminder for %@", date);
}

-(void) viewDidLoad{
    [super viewDidLoad];
    NSLog(@"reminder loaded its view");
}

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.datePicker.minimumDate = [NSDate dateWithTimeIntervalSinceNow:60];
}

@end
