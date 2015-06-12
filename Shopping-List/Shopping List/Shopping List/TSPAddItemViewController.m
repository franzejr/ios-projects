//
//  TSPAddItemViewController.m
//  Shopping List
//
//  Created by Bart Jacobs on 28/03/14.
//  Copyright (c) 2014 Tuts+. All rights reserved.
//

#import "TSPAddItemViewController.h"

@interface TSPAddItemViewController ()

@end

@implementation TSPAddItemViewController

#pragma mark -
#pragma mark Actions
- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)save:(id)sender {
    // Extract User Input
    NSString *name = [self.nameTextField text];
    float price = [[self.priceTextField text] floatValue];
    
    // Notify Delegate
    [self.delegate controller:self didSaveItemWithName:name andPrice:price];
    
    // Dismiss View Controller
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
