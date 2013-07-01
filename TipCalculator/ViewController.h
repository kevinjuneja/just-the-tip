//
//  ViewController.h
//  TipCalculator
//
//  Created by Kevin Juneja on 6/29/13.
//  Copyright (c) 2013 Mod Squad. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *amtNoTip;
@property (weak, nonatomic) IBOutlet UILabel *tipTotalAmt;
@property (weak, nonatomic) IBOutlet UILabel *tipAmt;
@property (weak, nonatomic) IBOutlet UISegmentedControl *qService;
@property double amt;

@end
