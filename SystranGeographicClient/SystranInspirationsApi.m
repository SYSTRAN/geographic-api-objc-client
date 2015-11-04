#import "SystranInspirationsApi.h"
#import "SystranQueryParamCollection.h"
#import "SystranInspirationResponse.h"
#import "SystranInspirationDetailsResponse.h"


@interface SystranInspirationsApi ()
    @property (readwrite, nonatomic, strong) NSMutableDictionary *defaultHeaders;
@end

@implementation SystranInspirationsApi

static SystranInspirationsApi* singletonAPI = nil;

#pragma mark - Initialize methods

- (id) init {
    self = [super init];
    if (self) {
        SystranConfiguration *config = [SystranConfiguration sharedConfig];
        if (config.apiClient == nil) {
            config.apiClient = [[SystranApiClient alloc] init];
        }
        self.apiClient = config.apiClient;
        self.defaultHeaders = [NSMutableDictionary dictionary];
    }
    return self;
}

- (id) initWithApiClient:(SystranApiClient *)apiClient {
    self = [super init];
    if (self) {
        self.apiClient = apiClient;
        self.defaultHeaders = [NSMutableDictionary dictionary];
    }
    return self;
}

#pragma mark -

+(SystranInspirationsApi*) apiWithHeader:(NSString*)headerValue key:(NSString*)key {

    if (singletonAPI == nil) {
        singletonAPI = [[SystranInspirationsApi alloc] init];
        [singletonAPI addHeader:headerValue forKey:key];
    }
    return singletonAPI;
}

+(SystranInspirationsApi*) sharedAPI {

    if (singletonAPI == nil) {
        singletonAPI = [[SystranInspirationsApi alloc] init];
    }
    return singletonAPI;
}

-(void) addHeader:(NSString*)value forKey:(NSString*)key {
    [self.defaultHeaders setValue:value forKey:key];
}

-(void) setHeaderValue:(NSString*) value
           forKey:(NSString*)key {
    [self.defaultHeaders setValue:value forKey:key];
}

-(unsigned long) requestQueueSize {
    return [SystranApiClient requestQueueSize];
}

#pragma mark - Api Methods

///
/// List dossiers
/// Get a list of `Inspirations` of type `dossier`.\n\nThe main criteria can be:\n* a position and a radius\n* a textual search\n\nAdditional critera can be added.
///  @param latitude Latitude location
///
///  @param longitude Longitude location
///
///  @param radius Radius in meters
///
///  @param address Address
///
///  @param country Country
///
///  @param state State
///
///  @param county County
///
///  @param city City
///
///  @param district District
///
///  @param postalCode Postal Code
///
///  @param limit Pagination limit
///
///  @param offset Pagination offset
///
///  @param acceptLanguage Preferred languages for response localization.\n\nSee [Accept-Language header specification for HTTP\n1.1](http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.4)
///
///  @param callback Javascript callback function name for JSONP Support
///
///  @returns SystranInspirationResponse*
///
-(NSNumber*) geographicInspirationsDossiersListGetWithCompletionBlock: (NSNumber*) latitude
         longitude: (NSNumber*) longitude
         radius: (NSNumber*) radius
         address: (NSString*) address
         country: (NSString*) country
         state: (NSString*) state
         county: (NSString*) county
         city: (NSString*) city
         district: (NSString*) district
         postalCode: (NSString*) postalCode
         limit: (NSNumber*) limit
         offset: (NSNumber*) offset
         acceptLanguage: (NSString*) acceptLanguage
         callback: (NSString*) callback
        
        completionHandler: (void (^)(SystranInspirationResponse* output, NSError* error))completionBlock { 
        

    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/geographic/inspirations/dossiers/list"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(latitude != nil) {
        
        queryParams[@"latitude"] = latitude;
    }
    if(longitude != nil) {
        
        queryParams[@"longitude"] = longitude;
    }
    if(radius != nil) {
        
        queryParams[@"radius"] = radius;
    }
    if(address != nil) {
        
        queryParams[@"address"] = address;
    }
    if(country != nil) {
        
        queryParams[@"country"] = country;
    }
    if(state != nil) {
        
        queryParams[@"state"] = state;
    }
    if(county != nil) {
        
        queryParams[@"county"] = county;
    }
    if(city != nil) {
        
        queryParams[@"city"] = city;
    }
    if(district != nil) {
        
        queryParams[@"district"] = district;
    }
    if(postalCode != nil) {
        
        queryParams[@"postalCode"] = postalCode;
    }
    if(limit != nil) {
        
        queryParams[@"limit"] = limit;
    }
    if(offset != nil) {
        
        queryParams[@"offset"] = offset;
    }
    if(callback != nil) {
        
        queryParams[@"callback"] = callback;
    }
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    if(acceptLanguage != nil) {
        headerParams[@"Accept-Language"] = acceptLanguage;
    }
    

    // HTTP header `Accept`
    headerParams[@"Accept"] = [SystranApiClient selectHeaderAccept:@[]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }

    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }
    else {
        responseContentType = @"";
    }

    // request content type
    NSString *requestContentType = [SystranApiClient selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[@"accessToken", @"apiKey"];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *files = [[NSMutableDictionary alloc] init];
    
    
    

    
    return [self.apiClient requestWithCompletionBlock: resourcePath
                                               method: @"GET"
                                           pathParams: pathParams
                                          queryParams: queryParams
                                           formParams: formParams
                                                files: files
                                                 body: bodyParam
                                         headerParams: headerParams
                                         authSettings: authSettings
                                   requestContentType: requestContentType
                                  responseContentType: responseContentType
                                         responseType: @"SystranInspirationResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((SystranInspirationResponse*)data, error);
              }
          ];
}

///
/// List events
/// Get a list of `Inspirations` of type `event`.\n\nThe main criteria can be:\n* a position and a radius\n* a textual search\n\nAdditional critera can be added.
///  @param latitude Latitude location
///
///  @param longitude Longitude location
///
///  @param radius Radius in meters
///
///  @param address Address
///
///  @param country Country
///
///  @param state State
///
///  @param county County
///
///  @param city City
///
///  @param district District
///
///  @param postalCode Postal Code
///
///  @param limit Pagination limit
///
///  @param offset Pagination offset
///
///  @param acceptLanguage Preferred languages for response localization.\n\nSee [Accept-Language header specification for HTTP\n1.1](http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.4)
///
///  @param callback Javascript callback function name for JSONP Support
///
///  @returns SystranInspirationResponse*
///
-(NSNumber*) geographicInspirationsEventsListGetWithCompletionBlock: (NSNumber*) latitude
         longitude: (NSNumber*) longitude
         radius: (NSNumber*) radius
         address: (NSString*) address
         country: (NSString*) country
         state: (NSString*) state
         county: (NSString*) county
         city: (NSString*) city
         district: (NSString*) district
         postalCode: (NSString*) postalCode
         limit: (NSNumber*) limit
         offset: (NSNumber*) offset
         acceptLanguage: (NSString*) acceptLanguage
         callback: (NSString*) callback
        
        completionHandler: (void (^)(SystranInspirationResponse* output, NSError* error))completionBlock { 
        

    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/geographic/inspirations/events/list"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(latitude != nil) {
        
        queryParams[@"latitude"] = latitude;
    }
    if(longitude != nil) {
        
        queryParams[@"longitude"] = longitude;
    }
    if(radius != nil) {
        
        queryParams[@"radius"] = radius;
    }
    if(address != nil) {
        
        queryParams[@"address"] = address;
    }
    if(country != nil) {
        
        queryParams[@"country"] = country;
    }
    if(state != nil) {
        
        queryParams[@"state"] = state;
    }
    if(county != nil) {
        
        queryParams[@"county"] = county;
    }
    if(city != nil) {
        
        queryParams[@"city"] = city;
    }
    if(district != nil) {
        
        queryParams[@"district"] = district;
    }
    if(postalCode != nil) {
        
        queryParams[@"postalCode"] = postalCode;
    }
    if(limit != nil) {
        
        queryParams[@"limit"] = limit;
    }
    if(offset != nil) {
        
        queryParams[@"offset"] = offset;
    }
    if(callback != nil) {
        
        queryParams[@"callback"] = callback;
    }
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    if(acceptLanguage != nil) {
        headerParams[@"Accept-Language"] = acceptLanguage;
    }
    

    // HTTP header `Accept`
    headerParams[@"Accept"] = [SystranApiClient selectHeaderAccept:@[]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }

    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }
    else {
        responseContentType = @"";
    }

    // request content type
    NSString *requestContentType = [SystranApiClient selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[@"accessToken", @"apiKey"];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *files = [[NSMutableDictionary alloc] init];
    
    
    

    
    return [self.apiClient requestWithCompletionBlock: resourcePath
                                               method: @"GET"
                                           pathParams: pathParams
                                          queryParams: queryParams
                                           formParams: formParams
                                                files: files
                                                 body: bodyParam
                                         headerParams: headerParams
                                         authSettings: authSettings
                                   requestContentType: requestContentType
                                  responseContentType: responseContentType
                                         responseType: @"SystranInspirationResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((SystranInspirationResponse*)data, error);
              }
          ];
}

///
/// Get a specific Inspiration
/// Get a specific `Inspiration`.
///  @param _id Inspiration identifier
///
///  @param acceptLanguage Preferred languages for response localization.\n\nSee [Accept-Language header specification for HTTP\n1.1](http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.4)
///
///  @param callback Javascript callback function name for JSONP Support
///
///  @returns SystranInspirationDetailsResponse*
///
-(NSNumber*) geographicInspirationsGetGetWithCompletionBlock: (NSString*) _id
         acceptLanguage: (NSString*) acceptLanguage
         callback: (NSString*) callback
        
        completionHandler: (void (^)(SystranInspirationDetailsResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter '_id' is set
    if (_id == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `_id` when calling `geographicInspirationsGetGet`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/geographic/inspirations/get"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(_id != nil) {
        
        queryParams[@"id"] = _id;
    }
    if(callback != nil) {
        
        queryParams[@"callback"] = callback;
    }
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    if(acceptLanguage != nil) {
        headerParams[@"Accept-Language"] = acceptLanguage;
    }
    

    // HTTP header `Accept`
    headerParams[@"Accept"] = [SystranApiClient selectHeaderAccept:@[]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }

    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }
    else {
        responseContentType = @"";
    }

    // request content type
    NSString *requestContentType = [SystranApiClient selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[@"accessToken", @"apiKey"];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *files = [[NSMutableDictionary alloc] init];
    
    
    

    
    return [self.apiClient requestWithCompletionBlock: resourcePath
                                               method: @"GET"
                                           pathParams: pathParams
                                          queryParams: queryParams
                                           formParams: formParams
                                                files: files
                                                 body: bodyParam
                                         headerParams: headerParams
                                         authSettings: authSettings
                                   requestContentType: requestContentType
                                  responseContentType: responseContentType
                                         responseType: @"SystranInspirationDetailsResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((SystranInspirationDetailsResponse*)data, error);
              }
          ];
}

///
/// List Inspirations
/// Get a list of `Inspirations`.\n\nThe main criteria can be:\n* a position and a radius\n* a textual search\n\nAdditional critera can be added.
///  @param latitude Latitude location
///
///  @param longitude Longitude location
///
///  @param radius Radius in meters
///
///  @param address Address
///
///  @param country Country
///
///  @param state State
///
///  @param county County
///
///  @param city City
///
///  @param district District
///
///  @param postalCode Postal Code
///
///  @param limit Pagination limit
///
///  @param offset Pagination offset
///
///  @param acceptLanguage Preferred languages for response localization.\n\nSee [Accept-Language header specification for HTTP\n1.1](http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.4)
///
///  @param callback Javascript callback function name for JSONP Support
///
///  @returns SystranInspirationResponse*
///
-(NSNumber*) geographicInspirationsListGetWithCompletionBlock: (NSNumber*) latitude
         longitude: (NSNumber*) longitude
         radius: (NSNumber*) radius
         address: (NSString*) address
         country: (NSString*) country
         state: (NSString*) state
         county: (NSString*) county
         city: (NSString*) city
         district: (NSString*) district
         postalCode: (NSString*) postalCode
         limit: (NSNumber*) limit
         offset: (NSNumber*) offset
         acceptLanguage: (NSString*) acceptLanguage
         callback: (NSString*) callback
        
        completionHandler: (void (^)(SystranInspirationResponse* output, NSError* error))completionBlock { 
        

    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/geographic/inspirations/list"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(latitude != nil) {
        
        queryParams[@"latitude"] = latitude;
    }
    if(longitude != nil) {
        
        queryParams[@"longitude"] = longitude;
    }
    if(radius != nil) {
        
        queryParams[@"radius"] = radius;
    }
    if(address != nil) {
        
        queryParams[@"address"] = address;
    }
    if(country != nil) {
        
        queryParams[@"country"] = country;
    }
    if(state != nil) {
        
        queryParams[@"state"] = state;
    }
    if(county != nil) {
        
        queryParams[@"county"] = county;
    }
    if(city != nil) {
        
        queryParams[@"city"] = city;
    }
    if(district != nil) {
        
        queryParams[@"district"] = district;
    }
    if(postalCode != nil) {
        
        queryParams[@"postalCode"] = postalCode;
    }
    if(limit != nil) {
        
        queryParams[@"limit"] = limit;
    }
    if(offset != nil) {
        
        queryParams[@"offset"] = offset;
    }
    if(callback != nil) {
        
        queryParams[@"callback"] = callback;
    }
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    if(acceptLanguage != nil) {
        headerParams[@"Accept-Language"] = acceptLanguage;
    }
    

    // HTTP header `Accept`
    headerParams[@"Accept"] = [SystranApiClient selectHeaderAccept:@[]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }

    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }
    else {
        responseContentType = @"";
    }

    // request content type
    NSString *requestContentType = [SystranApiClient selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[@"accessToken", @"apiKey"];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *files = [[NSMutableDictionary alloc] init];
    
    
    

    
    return [self.apiClient requestWithCompletionBlock: resourcePath
                                               method: @"GET"
                                           pathParams: pathParams
                                          queryParams: queryParams
                                           formParams: formParams
                                                files: files
                                                 body: bodyParam
                                         headerParams: headerParams
                                         authSettings: authSettings
                                   requestContentType: requestContentType
                                  responseContentType: responseContentType
                                         responseType: @"SystranInspirationResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((SystranInspirationResponse*)data, error);
              }
          ];
}

///
/// List news in brief
/// Get a list of `Inspirations` of type `news in brief`.\n\nThe main criteria can be:\n* a position and a radius\n* a textual search\n\nAdditional critera can be added.
///  @param latitude Latitude location
///
///  @param longitude Longitude location
///
///  @param radius Radius in meters
///
///  @param address Address
///
///  @param country Country
///
///  @param state State
///
///  @param county County
///
///  @param city City
///
///  @param district District
///
///  @param postalCode Postal Code
///
///  @param limit Pagination limit
///
///  @param offset Pagination offset
///
///  @param acceptLanguage Preferred languages for response localization.\n\nSee [Accept-Language header specification for HTTP\n1.1](http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.4)
///
///  @param callback Javascript callback function name for JSONP Support
///
///  @returns SystranInspirationResponse*
///
-(NSNumber*) geographicInspirationsNewsInBriefListGetWithCompletionBlock: (NSNumber*) latitude
         longitude: (NSNumber*) longitude
         radius: (NSNumber*) radius
         address: (NSString*) address
         country: (NSString*) country
         state: (NSString*) state
         county: (NSString*) county
         city: (NSString*) city
         district: (NSString*) district
         postalCode: (NSString*) postalCode
         limit: (NSNumber*) limit
         offset: (NSNumber*) offset
         acceptLanguage: (NSString*) acceptLanguage
         callback: (NSString*) callback
        
        completionHandler: (void (^)(SystranInspirationResponse* output, NSError* error))completionBlock { 
        

    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/geographic/inspirations/newsInBrief/list"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(latitude != nil) {
        
        queryParams[@"latitude"] = latitude;
    }
    if(longitude != nil) {
        
        queryParams[@"longitude"] = longitude;
    }
    if(radius != nil) {
        
        queryParams[@"radius"] = radius;
    }
    if(address != nil) {
        
        queryParams[@"address"] = address;
    }
    if(country != nil) {
        
        queryParams[@"country"] = country;
    }
    if(state != nil) {
        
        queryParams[@"state"] = state;
    }
    if(county != nil) {
        
        queryParams[@"county"] = county;
    }
    if(city != nil) {
        
        queryParams[@"city"] = city;
    }
    if(district != nil) {
        
        queryParams[@"district"] = district;
    }
    if(postalCode != nil) {
        
        queryParams[@"postalCode"] = postalCode;
    }
    if(limit != nil) {
        
        queryParams[@"limit"] = limit;
    }
    if(offset != nil) {
        
        queryParams[@"offset"] = offset;
    }
    if(callback != nil) {
        
        queryParams[@"callback"] = callback;
    }
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    if(acceptLanguage != nil) {
        headerParams[@"Accept-Language"] = acceptLanguage;
    }
    

    // HTTP header `Accept`
    headerParams[@"Accept"] = [SystranApiClient selectHeaderAccept:@[]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }

    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }
    else {
        responseContentType = @"";
    }

    // request content type
    NSString *requestContentType = [SystranApiClient selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[@"accessToken", @"apiKey"];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *files = [[NSMutableDictionary alloc] init];
    
    
    

    
    return [self.apiClient requestWithCompletionBlock: resourcePath
                                               method: @"GET"
                                           pathParams: pathParams
                                          queryParams: queryParams
                                           formParams: formParams
                                                files: files
                                                 body: bodyParam
                                         headerParams: headerParams
                                         authSettings: authSettings
                                   requestContentType: requestContentType
                                  responseContentType: responseContentType
                                         responseType: @"SystranInspirationResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((SystranInspirationResponse*)data, error);
              }
          ];
}

///
/// List slide shows
/// Get a list of `Inspirations` of type `slide show`.\n\nThe main criteria can be:\n* a position and a radius\n* a textual search\n\nAdditional critera can be added.
///  @param latitude Latitude location
///
///  @param longitude Longitude location
///
///  @param radius Radius in meters
///
///  @param address Address
///
///  @param country Country
///
///  @param state State
///
///  @param county County
///
///  @param city City
///
///  @param district District
///
///  @param postalCode Postal Code
///
///  @param limit Pagination limit
///
///  @param offset Pagination offset
///
///  @param acceptLanguage Preferred languages for response localization.\n\nSee [Accept-Language header specification for HTTP\n1.1](http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.4)
///
///  @param callback Javascript callback function name for JSONP Support
///
///  @returns SystranInspirationResponse*
///
-(NSNumber*) geographicInspirationsSlideShowsListGetWithCompletionBlock: (NSNumber*) latitude
         longitude: (NSNumber*) longitude
         radius: (NSNumber*) radius
         address: (NSString*) address
         country: (NSString*) country
         state: (NSString*) state
         county: (NSString*) county
         city: (NSString*) city
         district: (NSString*) district
         postalCode: (NSString*) postalCode
         limit: (NSNumber*) limit
         offset: (NSNumber*) offset
         acceptLanguage: (NSString*) acceptLanguage
         callback: (NSString*) callback
        
        completionHandler: (void (^)(SystranInspirationResponse* output, NSError* error))completionBlock { 
        

    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/geographic/inspirations/slideShows/list"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(latitude != nil) {
        
        queryParams[@"latitude"] = latitude;
    }
    if(longitude != nil) {
        
        queryParams[@"longitude"] = longitude;
    }
    if(radius != nil) {
        
        queryParams[@"radius"] = radius;
    }
    if(address != nil) {
        
        queryParams[@"address"] = address;
    }
    if(country != nil) {
        
        queryParams[@"country"] = country;
    }
    if(state != nil) {
        
        queryParams[@"state"] = state;
    }
    if(county != nil) {
        
        queryParams[@"county"] = county;
    }
    if(city != nil) {
        
        queryParams[@"city"] = city;
    }
    if(district != nil) {
        
        queryParams[@"district"] = district;
    }
    if(postalCode != nil) {
        
        queryParams[@"postalCode"] = postalCode;
    }
    if(limit != nil) {
        
        queryParams[@"limit"] = limit;
    }
    if(offset != nil) {
        
        queryParams[@"offset"] = offset;
    }
    if(callback != nil) {
        
        queryParams[@"callback"] = callback;
    }
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    if(acceptLanguage != nil) {
        headerParams[@"Accept-Language"] = acceptLanguage;
    }
    

    // HTTP header `Accept`
    headerParams[@"Accept"] = [SystranApiClient selectHeaderAccept:@[]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }

    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }
    else {
        responseContentType = @"";
    }

    // request content type
    NSString *requestContentType = [SystranApiClient selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[@"accessToken", @"apiKey"];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *files = [[NSMutableDictionary alloc] init];
    
    
    

    
    return [self.apiClient requestWithCompletionBlock: resourcePath
                                               method: @"GET"
                                           pathParams: pathParams
                                          queryParams: queryParams
                                           formParams: formParams
                                                files: files
                                                 body: bodyParam
                                         headerParams: headerParams
                                         authSettings: authSettings
                                   requestContentType: requestContentType
                                  responseContentType: responseContentType
                                         responseType: @"SystranInspirationResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((SystranInspirationResponse*)data, error);
              }
          ];
}

///
/// List tests
/// Get a list of `Inspirations` of type `test`.\n\nThe main criteria can be:\n* a position and a radius\n* a textual search\n\nAdditional critera can be added.
///  @param latitude Latitude location
///
///  @param longitude Longitude location
///
///  @param radius Radius in meters
///
///  @param address Address
///
///  @param country Country
///
///  @param state State
///
///  @param county County
///
///  @param city City
///
///  @param district District
///
///  @param postalCode Postal Code
///
///  @param limit Pagination limit
///
///  @param offset Pagination offset
///
///  @param acceptLanguage Preferred languages for response localization.\n\nSee [Accept-Language header specification for HTTP\n1.1](http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.4)
///
///  @param callback Javascript callback function name for JSONP Support
///
///  @returns SystranInspirationResponse*
///
-(NSNumber*) geographicInspirationsTestsListGetWithCompletionBlock: (NSNumber*) latitude
         longitude: (NSNumber*) longitude
         radius: (NSNumber*) radius
         address: (NSString*) address
         country: (NSString*) country
         state: (NSString*) state
         county: (NSString*) county
         city: (NSString*) city
         district: (NSString*) district
         postalCode: (NSString*) postalCode
         limit: (NSNumber*) limit
         offset: (NSNumber*) offset
         acceptLanguage: (NSString*) acceptLanguage
         callback: (NSString*) callback
        
        completionHandler: (void (^)(SystranInspirationResponse* output, NSError* error))completionBlock { 
        

    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/geographic/inspirations/tests/list"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(latitude != nil) {
        
        queryParams[@"latitude"] = latitude;
    }
    if(longitude != nil) {
        
        queryParams[@"longitude"] = longitude;
    }
    if(radius != nil) {
        
        queryParams[@"radius"] = radius;
    }
    if(address != nil) {
        
        queryParams[@"address"] = address;
    }
    if(country != nil) {
        
        queryParams[@"country"] = country;
    }
    if(state != nil) {
        
        queryParams[@"state"] = state;
    }
    if(county != nil) {
        
        queryParams[@"county"] = county;
    }
    if(city != nil) {
        
        queryParams[@"city"] = city;
    }
    if(district != nil) {
        
        queryParams[@"district"] = district;
    }
    if(postalCode != nil) {
        
        queryParams[@"postalCode"] = postalCode;
    }
    if(limit != nil) {
        
        queryParams[@"limit"] = limit;
    }
    if(offset != nil) {
        
        queryParams[@"offset"] = offset;
    }
    if(callback != nil) {
        
        queryParams[@"callback"] = callback;
    }
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    if(acceptLanguage != nil) {
        headerParams[@"Accept-Language"] = acceptLanguage;
    }
    

    // HTTP header `Accept`
    headerParams[@"Accept"] = [SystranApiClient selectHeaderAccept:@[]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }

    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }
    else {
        responseContentType = @"";
    }

    // request content type
    NSString *requestContentType = [SystranApiClient selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[@"accessToken", @"apiKey"];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *files = [[NSMutableDictionary alloc] init];
    
    
    

    
    return [self.apiClient requestWithCompletionBlock: resourcePath
                                               method: @"GET"
                                           pathParams: pathParams
                                          queryParams: queryParams
                                           formParams: formParams
                                                files: files
                                                 body: bodyParam
                                         headerParams: headerParams
                                         authSettings: authSettings
                                   requestContentType: requestContentType
                                  responseContentType: responseContentType
                                         responseType: @"SystranInspirationResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((SystranInspirationResponse*)data, error);
              }
          ];
}



@end
