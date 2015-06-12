//
//  MasterViewController.h
//  ButtonsExample
//
//  Created by Francisco José Lins Magalhães on 12/06/15.
//  Copyright (c) 2015 franzejr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface MasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;


@end

