//
//  TSPEditItemViewController.m
//  Shopping List
//
//  Created by Bart Jacobs on 31/03/14.
//  Copyright (c) 2014 Tuts+. All rights reserved.
//

#import "TSPEditItemViewController.h"

#import "TSPItem.h"

@implementation TSPEditItemViewController

#pragma mark -
#pragma mark View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Create Save Button
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(save:)];
    
    
    // Populate Text Fields
    if (self.item) {
        [self.nameTextField setText:[self.item name]];
        [self.priceTextField setText:[NSString stringWithFormat:@"%f", [self.item price]]];
    }
}

#pragma mark -
#pragma mark Actions
- (void)save:(id)sender {
    NSString *name = [self.nameTextField text];
    float price = [[self.priceTextField text] floatValue];
    
    // Update Item
    [self.item setName:name];
    [self.item setPrice:price];
    
    // Notify Delegate
    [self.delegate controller:self didUpdateItem:self.item];
    
    // Pop View Controller
    [self.navigationController popViewControllerAnimated:YES];
}

@end
