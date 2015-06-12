//
//  TSPEditItemViewController.h
//  Shopping List
//
//  Created by Bart Jacobs on 31/03/14.
//  Copyright (c) 2014 Tuts+. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TSPItem;
@protocol TSPEditItemViewControllerDelegate;

@interface TSPEditItemViewController : UIViewController

@property IBOutlet UITextField *nameTextField;
@property IBOutlet UITextField *priceTextField;

@property TSPItem *item;
@property (weak) id<TSPEditItemViewControllerDelegate> delegate;

@end

@protocol TSPEditItemViewControllerDelegate <NSObject>
- (void)controller:(TSPEditItemViewController *)controller didUpdateItem:(TSPItem *)item;
@end
