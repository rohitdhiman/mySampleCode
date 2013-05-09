//
//  ViewController.m
//  GoogleWeatherDemo
//
//  Created by Rohit Dhiman on 7/5/13.
//  Copyright (c) 2013 anchanto. All rights reserved.
//

#import "ViewController.h"
#import "WeatherCondition.h"
#import "MapViewController.h"
#import <MapKit/MapKit.h>


@interface ViewController ()

@property (nonatomic, strong) NSString *urlString;
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;

@end

@implementation ViewController
@synthesize mapWebView = _mapWebView;
@synthesize mapButton = _mapButton;
@synthesize urlString = _urlString;
@synthesize coordinate = _coordinate;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //WeatherCondition *weatherCondition = [[WeatherCondition alloc] init];
    //[weatherCondition initWithQuery:@"http://www.google.com/ig/api?weather=Pune"];
    _urlString = [[NSString stringWithFormat:@"http://maps.google.com/maps?q=%@,+%@",@"India",@"Pune"] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",_urlString]]];
    [_mapWebView loadRequest:request];
    
    UITapGestureRecognizer *mapTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                             action:@selector(mapTapGesture:)];
    mapTap.numberOfTapsRequired = 1;
    [_mapWebView addGestureRecognizer:mapTap];
    
}

-(void)mapTapGesture:mapTapGesture:(UITapGestureRecognizer *)gesture
{
    CGPoint touchPoint = [gesture locationInView:_mapWebView];
    //_coordinate = [_mapWebView convertPoint:<#(CGPoint)#> fromView:<#(UIView *)#>];
    NSLog(@"Lat : %f",_coordinate.latitude);
    NSLog(@"Long : %f",_coordinate.longitude);
    
    
}

-(void)changeLocation:(CLLocationCoordinate2D)location
{
    NSString *jsCommand = [NSString stringWithFormat:@"changeLocation(%f, %f)",location.latitude,location.longitude];
    [_mapWebView stringByEvaluatingJavaScriptFromString:jsCommand];
    
}


- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSLog(@"URL : %@",request.URL);
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{

}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"Error: %@",error.localizedDescription);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)mapButtonTapped:(id)sender
{
    MapViewController *mapViewController = [[MapViewController alloc] initWithNibName:@"MapViewController"
                                                                               bundle:nil];
    [self.navigationController pushViewController:mapViewController
                                         animated:YES];
}

@end
