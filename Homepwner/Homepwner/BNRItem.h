//
//  BNRItem.h
//  RandomItems
//
//  Created by wangjiang on 2018/11/26.
//  Copyright © 2018 wangjiang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BNRItem : NSObject

@property (nonatomic, copy) NSString *itemName;
@property (nonatomic, copy) NSString *serialNumber;
@property (nonatomic) int valueInDollars;
@property (nonatomic, readonly, strong) NSDate *dateCreated;

+(instancetype) randomItem;
-(instancetype) initWithItemName:(NSString *) name valueInDollars:(int) value serialNumber:(NSString *) sNumber;
-(instancetype) initWithItemName:(NSString *) name;
-(instancetype) init;
@end

NS_ASSUME_NONNULL_END
