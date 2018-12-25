//
//  BNRItemStore.h
//  Homepwner
//
//  Created by wangjiang on 2018/12/20.
//  Copyright © 2018 wangjiang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class BNRItem;
@interface BNRItemStore : NSObject

@property (nonatomic, readonly) NSArray *allItems;
+(instancetype) sharedStore;
-(BNRItem *) createItem;
-(void) removeItem: (BNRItem *) item;
-(void) moveItemAtIndex: (NSUInteger) fromIndex toIndex: (NSUInteger) toIndex;

@end

NS_ASSUME_NONNULL_END
