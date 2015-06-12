//
//  TSPListViewController.h
//  Shopping List
//
//  Created by Bart Jacobs on 28/03/14.
//  Copyright (c) 2014 Tuts+. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TSPAddItemViewController.h"
#import "TSPEditItemViewController.h"

@interface TSPListViewController : UITableViewController <TSPAddItemViewControllerDelegate, TSPEditItemViewControllerDelegate>

@end
