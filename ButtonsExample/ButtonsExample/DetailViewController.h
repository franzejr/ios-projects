//
//  DetailViewController.h
//  ButtonsExample
//
//  Created by Francisco José Lins Magalhães on 12/06/15.
//  Copyright (c) 2015 franzejr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

