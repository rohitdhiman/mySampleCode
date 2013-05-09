//
//  RestConnection.m
//  IdentityCard
//
//  Created by Zeon Solutions on 21/12/11.
//  Copyright 2011 Zeon Solutions Pvt. Ltd. All rights reserved.
//

#import "RestConnection.h"


@interface RestConnection (private)
-(void)startRequest:(NSURLRequest *)request;
-(void)clearURLConnection;
@end


@implementation RestConnection

@synthesize delegate, baseURLString, request, response;

#pragma mark Accessor Methods

- (NSData *)data
{
	return [responseData copy];
}

- (NSString *)stringData
{
	return [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
}

#pragma mark Setup and Teardown Methods

- (id)initWithBaseURL:(NSString *)baseURL
{
	self = [super init];
	if (self != nil)
	{
		delegate = nil;
		self.baseURLString = baseURL;
		request = nil;
		response = nil;
		urlConnection = nil;
		responseData = nil;
	}
	
	return self;	
}

- (id)init
{
	return [self initWithBaseURL:@""];
}



#pragma mark Public Methods

- (void)performRequest:(NSURLRequest *)aRequest
{	
	NSMutableURLRequest *mutableRequest = [aRequest mutableCopy];
	
	// Add the base URL as necessary.
	if ([[[mutableRequest URL] absoluteString] rangeOfString:baseURLString].location == NSNotFound)
	{
		NSURL *url = [NSURL URLWithString:[[mutableRequest URL] absoluteString] 
							relativeToURL:[NSURL URLWithString:baseURLString]];
		[mutableRequest setURL:url];
	}
	
	if ([mutableRequest valueForHTTPHeaderField:@"Content-Type"] == nil)
		[mutableRequest setValue:@"application/xml;charset=utf-8" forHTTPHeaderField:@"Content-Type"];
	if ([mutableRequest valueForHTTPHeaderField:@"Accept"] == nil)
		[mutableRequest setValue:@"application/xml" forHTTPHeaderField:@"accept"];
	
	[self startRequest:mutableRequest];
	
}


#pragma mark Private Methods

- (void)startRequest:(NSURLRequest *)aRequest
{
	if (delegate != nil)
		[delegate willSendRequest:aRequest];
	
	// Clear any previous data and setup to collect the response and response data.
	request = aRequest;
	responseData = [NSMutableData new];
	response = nil;
	
	// Load the URL.
	urlConnection = [NSURLConnection connectionWithRequest:request
												   delegate:self];
}	

- (void)clearUrlConnection
{
	if (urlConnection != nil)
	{
		urlConnection = nil;
	}
	
	if (delegate != nil)
		[delegate finishedReceivingData:self.data];
	
}

@end


@implementation RestConnection (NSURLConnectionDelegate)

- (NSURLRequest *)connection:(NSURLConnection *)connection willSendRequest:(NSURLRequest *)aRequest redirectResponse:(NSURLResponse *)aResponse;
{
//	NSLog(@"In connection: willSendRequest: %@ redirectResponse: %@", aRequest, aResponse);
	return aRequest;
}

/*SSL Methods end*/
- (BOOL)connection:(NSURLConnection *)connection canAuthenticateAgainstProtectionSpace:(NSURLProtectionSpace *)protectionSpace
{
    return [protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust];
}

- (void)connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge;
{
	//NSLog(@"In connection: didReceiveAuthenticationChallenge: %@", challenge);
    if([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust])
        [challenge.sender useCredential:[NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust] forAuthenticationChallenge:challenge];
    [challenge.sender continueWithoutCredentialForAuthenticationChallenge:challenge];
}

- (void)connection:(NSURLConnection *)connection didCancelAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge;
{
	//NSLog(@"In connection: didCancelAuthenticationChallenge: %@", challenge);
}
/*SSL Methods start*/

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)aResponse;
{
	//NSLog(@"connection: didReceiveResponse: %@, %lld", [aResponse URL], [aResponse expectedContentLength]);
	response = aResponse;
	
	if (delegate != nil)
		[delegate didReceiveResponse:response];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)newData;
{
	//NSLog(@"In connection: didReceiveData:");
	[responseData appendData:newData];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection;
{
	//NSLog(@"In connectionDidFinishLoading:");
	[self clearUrlConnection];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error;
{
	//NSLog(@"In connection: didFailWithError: %@", error);
	[self clearUrlConnection];
}

- (NSCachedURLResponse *)connection:(NSURLConnection *)connection willCacheResponse:(NSCachedURLResponse *)cachedResponse;
{
	//NSLog(@"connection: willCacheResponse:");
	return nil;
}


@end