//
//  BNRImageStore.m
//  Homepwner
//
//  Created by wangjiang on 2018/12/28.
//  Copyright © 2018 wangjiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRImageStore.h"

@interface BNRImageStore()

@property (nonatomic, strong) NSMutableDictionary *dictionary;

@end

@implementation BNRImageStore

+(instancetype) sharedStore {
    static BNRImageStore *sharedStore = nil;
    if (!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    return sharedStore;
}

#pragma mark - init
-(instancetype) init {
    @throw [NSException exceptionWithName:@"Sigleton" reason:@"Use [BNRItemStore sharedStore]" userInfo:nil];
    return nil;
}

-(instancetype) initPrivate {
    self = [super init];
    if (self) {
        self.dictionary = [[NSMutableDictionary alloc] init];
    }
    return self;
}

#pragma mark -image
-(void) setImage:(UIImage *)image forKey:(NSString *)key {
//    [self.dictionary setObject:image forKey:key];
    self.dictionary[key] = image;
}
-(UIImage *) imageForKey:(NSString *)key {
//    return [self.dictionary objectForKey:key];
    return self.dictionary[key];
}
-(void) deleteImageForKey:(NSString *)key {
    [self.dictionary removeObjectForKey:key];
}
@end
