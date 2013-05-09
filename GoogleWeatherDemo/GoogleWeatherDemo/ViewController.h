//
//  ViewController.h
//  GoogleWeatherDemo
//
//  Created by Rohit Dhiman on 7/5/13.
//  Copyright (c) 2013 anchanto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <UIWebViewDelegate, CLLocationManagerDelegate>
{
    UIWebView *mapWebView;
    UIButton *mapButton;
    
}
@property(nonatomic, strong) IBOutlet UIWebView *mapWebView;
@property(nonatomic, strong) IBOutlet UIButton *mapButton;

-(IBAction)mapButtonTapped:(id)sender;


@end
