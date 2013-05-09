//
//  RestConnection.h
//  IdentityCard
//
//  Created by Zeon Solutions on 21/12/11.
//  Copyright 2011 Zeon Solutions Pvt. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RestConnectionDelegate.h"

@interface RestConnection : NSObject {
	@private 
	id<RestConnectionDelegate> __unsafe_unretained delegate;
	NSString *baseURLString;
	NSURLRequest *__weak request;
	NSURLResponse *__weak response;
	
	NSURLConnection *urlConnection;
	NSMutableData *responseData;
}

@property(nonatomic, unsafe_unretained)id<RestConnectionDelegate> delegate;
@property(nonatomic, copy)NSString *baseURLString;
@property(nonatomic, readonly)NSURLRequest *request;
@property(nonatomic, readonly)NSURLResponse *response;
@property(weak, nonatomic, readonly)NSData *data;
@property(weak, nonatomic, readonly)NSString *stringData;

-(id)initWithBaseURL:(NSString *)baseURL;
-(void)performRequest:(NSURLRequest *)aRequest;

@end
