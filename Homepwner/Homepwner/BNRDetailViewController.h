//
//  BNRDetailViewController.h
//  Homepwner
//
//  Created by wangjiang on 2018/12/25.
//  Copyright © 2018 wangjiang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class BNRItem;

@interface BNRDetailViewController : UIViewController
@property (nonatomic, strong) BNRItem *item;
@end

NS_ASSUME_NONNULL_END
