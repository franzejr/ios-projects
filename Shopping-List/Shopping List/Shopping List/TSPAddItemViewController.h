//
//  TSPAddItemViewController.h
//  Shopping List
//
//  Created by Bart Jacobs on 28/03/14.
//  Copyright (c) 2014 Tuts+. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TSPAddItemViewControllerDelegate;

@interface TSPAddItemViewController : UIViewController

@property (weak) id<TSPAddItemViewControllerDelegate> delegate;

@property IBOutlet UITextField *nameTextField;
@property IBOutlet UITextField *priceTextField;

@end

@protocol TSPAddItemViewControllerDelegate <NSObject>
- (void)controller:(TSPAddItemViewController *)controller didSaveItemWithName:(NSString *)name andPrice:(float)price;
@end
