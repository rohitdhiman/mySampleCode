//
//  MapViewController.m
//  GoogleWeatherDemo
//
//  Created by Rohit Dhiman on 8/5/13.
//  Copyright (c) 2013 anchanto. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

-(void)displayRegion;

@end

@implementation MapViewController
@synthesize mapView = _mapView;
@synthesize coordinate = _coordinate;
@synthesize locationLabel = _locationLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _mapView.delegate= self;
    //for displaying intial position
    [self displayRegion];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                 action:@selector(mapTapGesture:)];
    tapGesture.numberOfTapsRequired = 1;
    [_mapView addGestureRecognizer:tapGesture];
    
}

-(void)mapTapGesture:(UITapGestureRecognizer *)gesture
{
    if(gesture.state != UIGestureRecognizerStateEnded)
        return;
    
    CGPoint touchPoint = [gesture locationInView:_mapView];
    _coordinate = [_mapView convertPoint:touchPoint
                    toCoordinateFromView:_mapView];
    
    NSLog(@"Lat: %f Long: %f",_coordinate.latitude,_coordinate.longitude);
    _locationLabel.text = [NSString stringWithFormat:@"Lat: %f Long: %f",_coordinate.latitude,_coordinate.longitude];
    
}

-(void)displayRegion
{
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    span.latitudeDelta = 0.2;
    span.longitudeDelta = 0.2;
    CLLocationCoordinate2D location;
    location.latitude = 22.569722;
    location.longitude = 88.369722;
    
    region.span = span;
    region.center = location;
    
    [_mapView setRegion:region animated:YES];
    [_mapView regionThatFits:region];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
