//
//  MapViewController.h
//  GoogleWeatherDemo
//
//  Created by Rohit Dhiman on 8/5/13.
//  Copyright (c) 2013 anchanto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController <MKMapViewDelegate>
{
    MKMapView *mapView;
    CLLocationCoordinate2D coordinate;
    UILabel *locationLabel;
}
@property (nonatomic, strong) IBOutlet MKMapView *mapView;
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, strong) IBOutlet UILabel *locationLabel;


@end
