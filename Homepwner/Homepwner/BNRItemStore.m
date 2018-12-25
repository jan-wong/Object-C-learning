//
//  BNRItemStore.m
//  Homepwner
//
//  Created by wangjiang on 2018/12/20.
//  Copyright © 2018 wangjiang. All rights reserved.
//

#import "BNRItemStore.h"
#import "BNRItem.h"

@interface BNRItemStore()
@property (nonatomic) NSMutableArray *privateItems;
@end

@implementation BNRItemStore
+(instancetype) sharedStore {
    static BNRItemStore *sharedStore = nil;
    
    if (!sharedStore) {
        sharedStore = [[BNRItemStore alloc] initPrivate];
    }
    return sharedStore;
}

-(instancetype) init {
    @throw [NSException exceptionWithName:@"Sigleton" reason:@"Use [BNRItemStore sharedStore]" userInfo:nil];
    return nil;
}

-(instancetype) initPrivate {
    self = [super init];
    if (self) {
        _privateItems = [[NSMutableArray alloc] init];
    }
    return self;
}

-(NSArray *) allItems {
    return self.privateItems;
}

-(BNRItem *) createItem {
    BNRItem *item = [BNRItem randomItem];
    [self.privateItems addObject:item];
    return item;
}

-(void) removeItem: (BNRItem *) item {
    [self.privateItems removeObjectIdenticalTo:item];
}

// 移动item
-(void) moveItemAtIndex: (NSUInteger) fromIndex toIndex: (NSUInteger) toIndex {
    if (fromIndex == toIndex) return;
    
    BNRItem *item = self.privateItems[fromIndex];
    [self.privateItems removeObjectAtIndex:fromIndex];
    [self.privateItems insertObject:item atIndex:toIndex];
}
@end
