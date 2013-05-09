//
//  WeatherCondition.m
//  GoogleWeatherDemo
//
//  Created by Rohit Dhiman on 7/5/13.
//  Copyright (c) 2013 anchanto. All rights reserved.
//

#import "WeatherCondition.h"
#import "XPathQuery.h"

@implementation WeatherCondition
@synthesize condition = _condition;
@synthesize location = _location;
@synthesize conditionImageURL = _conditionImageURL;
@synthesize currentTemp = _currentTemp;
@synthesize lowTemp = _lowTemp;
@synthesize highTemp = _highTemp;
@synthesize restConnection = _restConnection;

-(WeatherCondition *)initWithQuery:(NSString *)query
{
    if(self == [super init])
    {
        _restConnection = [RestConnection new];
        _restConnection.delegate = self;
        [_restConnection performRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",query]]]];
    }
    return self;
}

#pragma mark
#pragma mark RestConnectionDelegate Method

-(void)willSendRequest:(NSURLRequest *)request
{
    
}

-(void)didReceiveResponse:(NSURLResponse *)response
{

}

-(void)finishedReceivingData:(NSData *)data
{
    data  = [[_restConnection stringData] dataUsingEncoding:NSUTF8StringEncoding];
    if(data != nil)
    {
        NSString *xPathQuery = @"/*";
        NSArray *childArrayList = PerformXMLXPathQuery(data, xPathQuery);
        NSLog(@"ChildArray : %@",childArrayList);
    }
    
    /*
    if (data != NULL)
    {
		NSString *xPathQuery = @"/*";
		NSArray *arrayWithObjectList = PerformXMLXPathQuery(data, xPathQuery);
        
		for(NSDictionary *childOfObjectList in arrayWithObjectList)
        {
            NSArray *childArray = (NSArray *)[childOfObjectList objectForKey:kXMLNodeChildArray];
            for(NSDictionary *childDictionary in childArray)
            {
                if([[childDictionary objectForKey:kXMLNodeName] isEqualToString:kServerPingResult])
                {
                    serverPingData = [childDictionary objectForKey:kXMLNodeContent];
                    NSLog(@"\nserverpingresult = %@",serverPingData);
                }
            }
		}
	}
    */
}



@end
