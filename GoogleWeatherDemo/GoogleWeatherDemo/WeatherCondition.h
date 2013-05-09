//
//  WeatherCondition.h
//  GoogleWeatherDemo
//
//  Created by Rohit Dhiman on 7/5/13.
//  Copyright (c) 2013 anchanto. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RestConnectionDelegate.h"
#import "RestConnection.h"

@interface WeatherCondition : NSObject <RestConnectionDelegate>
{
    NSString *condition;
    NSString *location;
    NSURL *conditionImageURL;
    NSInteger currentTemp;
    NSInteger lowTemp;
    NSInteger highTemp;
    
    RestConnection *restConnection;
}
@property (nonatomic, strong) NSString *condition;
@property (nonatomic, strong) NSString *location;
@property (nonatomic, strong) NSURL *conditionImageURL;
@property (nonatomic, assign) NSInteger currentTemp;
@property (nonatomic, assign) NSInteger lowTemp;
@property (nonatomic, assign) NSInteger highTemp;
@property (nonatomic, strong) RestConnection *restConnection;

-(WeatherCondition *)initWithQuery:(NSString *)query;

@end
