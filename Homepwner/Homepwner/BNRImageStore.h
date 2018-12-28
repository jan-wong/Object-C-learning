//
//  BNRImageStore.h
//  Homepwner
//
//  Created by wangjiang on 2018/12/28.
//  Copyright © 2018 wangjiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BNRImageStore : NSObject
+(instancetype) sharedStore;
-(void)setImage: (UIImage *) image forKey: (NSString *) key;
-(UIImage *) imageForKey: (NSString *) key;
-(void) deleteImageForKey: (NSString *) key;
@end

NS_ASSUME_NONNULL_END
