//
//  ViewController.m
//  TipCalculator
//
//  Created by Kevin Juneja on 6/29/13.
//  Copyright (c) 2013 Mod Squad. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSDictionary *dict = @{UITextAttributeFont : [UIFont boldSystemFontOfSize:14.0f]};
    
    [self.qService setTitleTextAttributes:dict forState:UIControlStateNormal];
    
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.amt = self.amtNoTip.text.doubleValue;
    [self.amtNoTip resignFirstResponder];
}


- (IBAction)segmentSwitch:(id)sender {
    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
    NSInteger selectedSegment = segmentedControl.selectedSegmentIndex;
    
    double tip = 0.0;
    double tipTotal = 0.0;
    
    self.amt = self.amtNoTip.text.doubleValue;
    [self.amtNoTip resignFirstResponder];
    
    if (selectedSegment == 0) {
        tip = self.amt * 0.05;
    }
    else if (selectedSegment == 1) {
        tip = self.amt * 0.10;
    }
    else if (selectedSegment == 2) {
        tip = self.amt * 0.15;
    }
    else {
        tip = self.amt * 0.20;
    }
    
    tipTotal = self.amt + tip;
    self.tipAmt.text = [NSString stringWithFormat:@"$%.02f", tip];
    self.tipTotalAmt.text = [NSString stringWithFormat:@"$%.02f", tipTotal];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.amtNoTip)
    {
        self.amt = self.amtNoTip.text.doubleValue;
        [textField resignFirstResponder];

        return YES;
    } else {
        return NO;
    }
}

- (IBAction)textFieldBeginEditing:(id)sender {
    self.qService.selectedSegmentIndex = -1;
    self.tipAmt.text = @"$0.00";
    self.tipTotalAmt.text = @"$0.00";
}

- (void)textFieldDoneEditing:(UITextField *)textField
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
