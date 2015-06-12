//
//  TSPItem.m
//  Shopping List
//
//  Created by Bart Jacobs on 28/03/14.
//  Copyright (c) 2014 Tuts+. All rights reserved.
//

#import "TSPItem.h"

@implementation TSPItem

#pragma mark -
#pragma mark Initialization
+ (TSPItem *)createItemWithName:(NSString *)name andPrice:(float)price {
    // Initialize Item
    TSPItem *item = [[TSPItem alloc] init];
    
    // Configure Item
    [item setName:name];
    [item setPrice:price];
    [item setInShoppingList:NO];
    [item setUuid:[[NSUUID UUID] UUIDString]];
    
    return item;
}

#pragma mark -
#pragma mark NSCoding Protocol
- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.uuid forKey:@"uuid"];
    [coder encodeObject:self.name forKey:@"name"];
    [coder encodeFloat:self.price forKey:@"price"];
    [coder encodeBool:self.inShoppingList forKey:@"inShoppingList"];
}

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    
    if (self) {
        [self setUuid:[decoder decodeObjectForKey:@"uuid"]];
        [self setName:[decoder decodeObjectForKey:@"name"]];
        [self setPrice:[decoder decodeFloatForKey:@"price"]];
        [self setInShoppingList:[decoder decodeBoolForKey:@"inShoppingList"]];
    }
    
    return self;
}

@end
