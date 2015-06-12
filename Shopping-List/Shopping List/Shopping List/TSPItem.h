//
//  TSPItem.h
//  Shopping List
//
//  Created by Bart Jacobs on 28/03/14.
//  Copyright (c) 2014 Tuts+. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSPItem : NSObject <NSCoding>

@property NSString *uuid;
@property NSString *name;
@property float price;
@property BOOL inShoppingList;

#pragma mark -
#pragma mark Initialization
+ (TSPItem *)createItemWithName:(NSString *)name andPrice:(float)price;

@end
