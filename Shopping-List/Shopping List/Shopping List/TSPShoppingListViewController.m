//
//  TSPShoppingListViewController.m
//  Shopping List
//
//  Created by Bart Jacobs on 31/03/14.
//  Copyright (c) 2014 Tuts+. All rights reserved.
//

#import "TSPShoppingListViewController.h"

#import "TSPItem.h"

@interface TSPShoppingListViewController ()

@end

@implementation TSPShoppingListViewController

static NSString *CellIdentifier = @"Cell Identifier";

#pragma mark -
#pragma mark Initialization
- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        // Set Title
        self.title = @"Shopping List";
        
        // Add Observer
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateShoppingList:) name:@"TSPShoppingListDidChangeNotification" object:nil];
    }
    
    return self;
}

#pragma mark -
#pragma mark View Life Cycel
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Load Items
    [self loadItems];
    
    // Register Class for Cell Reuse
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier];
}

#pragma mark -
#pragma mark Setters & Getters
- (void)setItems:(NSArray *)items {
    if (_items != items) {
        _items = items;
        
        // Build Shopping List
        [self buildShoppingList];
    }
}

- (void)setShoppingList:(NSArray *)shoppingList {
    if (_shoppingList != shoppingList) {
        _shoppingList = shoppingList;
        
        // Reload Table View
        [self.tableView reloadData];
    }
}

#pragma mark -
#pragma mark Table View Delegate Methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.shoppingList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // Dequeue Reusable Cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Fetch Item
    TSPItem *item = [self.shoppingList objectAtIndex:[indexPath row]];
    
    // Configure Cell
    [cell.textLabel setText:[item name]];
    
    return cell;
}

#pragma mark -
#pragma mark Notification Handling
- (void)updateShoppingList:(NSNotification *)notification {
    // Load Items
    [self loadItems];
}

#pragma mark -
#pragma mark Helper Methods
- (void)buildShoppingList {
    NSMutableArray *buffer = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < [self.items count]; i++) {
        TSPItem *item = [self.items objectAtIndex:i];
        
        if ([item inShoppingList]) {
            // Add Item to Buffer
            [buffer addObject:item];
        }
    }
    
    // Set Shopping List
    self.shoppingList = [NSArray arrayWithArray:buffer];
}

- (void)loadItems {
    NSString *filePath = [self pathForItems];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        self.items = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    } else {
        self.items = [NSMutableArray array];
    }
}

- (NSString *)pathForItems {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documents = [paths lastObject];
    
    return [documents stringByAppendingPathComponent:@"items.plist"];
}

@end
