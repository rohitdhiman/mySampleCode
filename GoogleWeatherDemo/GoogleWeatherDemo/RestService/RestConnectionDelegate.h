//
//  RestConnectionDelegate.h
//  IdentityCard
//
//  Created by Zeon Solutions on 21/12/11.
//  Copyright 2011 Zeon Solutions Pvt. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol RestConnectionDelegate
-(void)willSendRequest:(NSURLRequest *)request;
-(void)didReceiveResponse:(NSURLResponse *)response;
-(void)finishedReceivingData:(NSData *)data;
@end
