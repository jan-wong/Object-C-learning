//
//  main.m
//  RandomItems
//
//  Created by wangjiang on 2018/11/26.
//  Copyright © 2018 wangjiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSMutableArray *items = [[NSMutableArray alloc] init];
//        for (NSInteger i = 0; i < 10; i++) {
//            [items addObject:[BNRItem randomItem]];
//        }
        BNRItem *backpack = [[BNRItem alloc] initWithItemName:@"Backpack"];
        [items addObject:backpack];
        BNRItem *calculator = [[BNRItem alloc] initWithItemName:@"Calculator"];
        [items addObject:calculator];
        backpack.containedItem = calculator;
        
        backpack = nil;
        calculator = nil;
        
        for (BNRItem *item in items) {
            NSLog(@"%@", item);
        }
        NSLog(@"setting items to nil");
        items = nil;
    }
    return 0;
}
