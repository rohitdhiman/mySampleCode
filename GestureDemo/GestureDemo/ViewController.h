//
//  ViewController.h
//  GestureDemo
//
//  Created by Rohit Dhiman on 3/5/13.
//  Copyright (c) 2013 anchanto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPopoverControllerDelegate>
{
    UIButton *popoverButton;
}
@property(nonatomic, strong) IBOutlet UIButton *popoverButton;

-(IBAction)popoverButtonTapped:(id)sender;

@end
