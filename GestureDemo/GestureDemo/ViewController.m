//
//  ViewController.m
//  GestureDemo
//
//  Created by Rohit Dhiman on 3/5/13.
//  Copyright (c) 2013 anchanto. All rights reserved.
//

#import "ViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface ViewController ()

@end

@implementation ViewController
@synthesize popoverButton = _popoverButton;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //Declare UITapGestureRecognizer
    UITapGestureRecognizer *singleTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                       action:@selector(singleTapGestureReconginzer:)];
    singleTapGesture.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:singleTapGesture];
    
    UITapGestureRecognizer *doubleTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                       action:@selector(doubleTapGestureRecognizer:)];
    
    doubleTapGesture.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:doubleTapGesture];
    
    [singleTapGesture requireGestureRecognizerToFail:doubleTapGesture];
    
}

//Gesture Selector Method for Single Tap
-(void)singleTapGestureReconginzer:(UITapGestureRecognizer *)gesture
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@""
                                                        message:@"Single Tap"
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil, nil];
    [alertView show];
}

//For double Tap Gesture
-(void)doubleTapGestureRecognizer:(UITapGestureRecognizer *)gesture
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@""
                                                        message:@"Double Tap"
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil, nil];
    [alertView show];
}

-(IBAction)popoverButtonTapped:(id)sender
{
//    UIImagePickerController *controller = [[UIImagePickerController alloc] init];
//    [controller setMediaTypes:[NSArray arrayWithObject:kUTTypeImage]];
//    //[controller setDelegate:self];
//    
//    UIPopoverController *popover = [[UIPopoverController alloc] initWithContentViewController:controller];
//    [popover setDelegate:self];
//    [popover presentPopoverFromBarButtonItem:sender
//                    permittedArrowDirections:UIPopoverArrowDirectionUp
//                                    animated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
