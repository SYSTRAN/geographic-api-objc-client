#import "SystranPoiApi.h"
#import "SystranQueryParamCollection.h"
#import "SystranPoiDetailsResponse.h"
#import "SystranPoiResponse.h"
#import "SystranPoiTypesResponse.h"


@interface SystranPoiApi ()
    @property (readwrite, nonatomic, strong) NSMutableDictionary *defaultHeaders;
@end

@implementation SystranPoiApi

static SystranPoiApi* singletonAPI = nil;

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

+(SystranPoiApi*) apiWithHeader:(NSString*)headerValue key:(NSString*)key {

    if (singletonAPI == nil) {
        singletonAPI = [[SystranPoiApi alloc] init];
        [singletonAPI addHeader:headerValue forKey:key];
    }
    return singletonAPI;
}

+(SystranPoiApi*) sharedAPI {

    if (singletonAPI == nil) {
        singletonAPI = [[SystranPoiApi alloc] init];
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
/// Get a specific Point of interest
/// Get a specific `Point of interest`.
///  @param _id POI identifier
///
///  @param acceptLanguage Preferred languages for response localization.\n\nSee [Accept-Language header specification for HTTP\n1.1](http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.4)
///
///  @param callback Javascript callback function name for JSONP Support
///
///  @returns SystranPoiDetailsResponse*
///
-(NSNumber*) geographicPoiGetGetWithCompletionBlock: (NSString*) _id
         acceptLanguage: (NSString*) acceptLanguage
         callback: (NSString*) callback
        
        completionHandler: (void (^)(SystranPoiDetailsResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter '_id' is set
    if (_id == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `_id` when calling `geographicPoiGetGet`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/geographic/poi/get"];

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
                                         responseType: @"SystranPoiDetailsResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((SystranPoiDetailsResponse*)data, error);
              }
          ];
}

///
/// List Point of interests
/// Get a list of `Point of interests`.\n\nThe main criteria can be:\n* a position and a radius\n* a bounding box\n* a textual search\n\nAdditional critera can be added.
///  @param latitude Latitude location
///
///  @param longitude Longitude location
///
///  @param radius Radius in meters
///
///  @param maximumLatitude Latitude of the top (northernmost) side of the bounding box
///
///  @param maximumLongitude Longitude of the right (easternmost) side of the bounding box
///
///  @param minimumLatitude Latitude of the bottom (southernmost) side of the bounding box
///
///  @param minimumLongitude Longitude of the left (westernmost) side of the bounding box
///
///  @param filter Filter on all relevent POI data (name, type, address, ...)
///
///  @param name POI name
///
///  @param mainType POI main type
///
///  @param type POI type
///
///  @param address POI address
///
///  @param country POI country
///
///  @param state POI state
///
///  @param county POI county
///
///  @param city POI city
///
///  @param district POI district
///
///  @param postalCode POI postal code
///
///  @param street POI street
///
///  @param house POI house
///
///  @param rankBy Ranking criteria
///
///  @param openNow Only open for business POI
///
///  @param minimumRating Minimum rating
///
///  @param maximumRating Maximum rating
///
///  @param minimumPrice Minumum price
///
///  @param maximumPrice Maximum price
///
///  @param limit Pagination limit
///
///  @param offset Pagination offset
///
///  @param acceptLanguage Preferred languages for response localization.\n\nSee [Accept-Language header specification for HTTP\n1.1](http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.4)
///
///  @param callback Javascript callback function name for JSONP Support
///
///  @returns SystranPoiResponse*
///
-(NSNumber*) geographicPoiListGetWithCompletionBlock: (NSNumber*) latitude
         longitude: (NSNumber*) longitude
         radius: (NSNumber*) radius
         maximumLatitude: (NSNumber*) maximumLatitude
         maximumLongitude: (NSNumber*) maximumLongitude
         minimumLatitude: (NSNumber*) minimumLatitude
         minimumLongitude: (NSNumber*) minimumLongitude
         filter: (NSArray* /* NSString */) filter
         name: (NSArray* /* NSString */) name
         mainType: (NSString*) mainType
         type: (NSArray* /* NSString */) type
         address: (NSString*) address
         country: (NSString*) country
         state: (NSString*) state
         county: (NSString*) county
         city: (NSString*) city
         district: (NSString*) district
         postalCode: (NSString*) postalCode
         street: (NSString*) street
         house: (NSString*) house
         rankBy: (NSString*) rankBy
         openNow: (NSNumber*) openNow
         minimumRating: (NSNumber*) minimumRating
         maximumRating: (NSNumber*) maximumRating
         minimumPrice: (NSNumber*) minimumPrice
         maximumPrice: (NSNumber*) maximumPrice
         limit: (NSNumber*) limit
         offset: (NSNumber*) offset
         acceptLanguage: (NSString*) acceptLanguage
         callback: (NSString*) callback
        
        completionHandler: (void (^)(SystranPoiResponse* output, NSError* error))completionBlock { 
        

    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/geographic/poi/list"];

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
    if(maximumLatitude != nil) {
        
        queryParams[@"maximumLatitude"] = maximumLatitude;
    }
    if(maximumLongitude != nil) {
        
        queryParams[@"maximumLongitude"] = maximumLongitude;
    }
    if(minimumLatitude != nil) {
        
        queryParams[@"minimumLatitude"] = minimumLatitude;
    }
    if(minimumLongitude != nil) {
        
        queryParams[@"minimumLongitude"] = minimumLongitude;
    }
    if(filter != nil) {
        
        queryParams[@"filter"] = [[SystranQueryParamCollection alloc] initWithValuesAndFormat: filter format: @"multi"];
        
        
    }
    if(name != nil) {
        
        queryParams[@"name"] = [[SystranQueryParamCollection alloc] initWithValuesAndFormat: name format: @"multi"];
        
        
    }
    if(mainType != nil) {
        
        queryParams[@"mainType"] = mainType;
    }
    if(type != nil) {
        
        queryParams[@"type"] = [[SystranQueryParamCollection alloc] initWithValuesAndFormat: type format: @"multi"];
        
        
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
    if(street != nil) {
        
        queryParams[@"street"] = street;
    }
    if(house != nil) {
        
        queryParams[@"house"] = house;
    }
    if(rankBy != nil) {
        
        queryParams[@"rankBy"] = rankBy;
    }
    if(openNow != nil) {
        
        queryParams[@"openNow"] = openNow;
    }
    if(minimumRating != nil) {
        
        queryParams[@"minimumRating"] = minimumRating;
    }
    if(maximumRating != nil) {
        
        queryParams[@"maximumRating"] = maximumRating;
    }
    if(minimumPrice != nil) {
        
        queryParams[@"minimumPrice"] = minimumPrice;
    }
    if(maximumPrice != nil) {
        
        queryParams[@"maximumPrice"] = maximumPrice;
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
                                         responseType: @"SystranPoiResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                   completionBlock((SystranPoiResponse*)data, error);
              }
          ];
}

///
/// Get available Point of interest types
/// Get available `Point of interest` types.
///  @param acceptLanguage Preferred languages for response localization.\n\nSee [Accept-Language header specification for HTTP\n1.1](http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.4)
///
///  @param callback Javascript callback function name for JSONP Support
///
///  @returns SystranPoiTypesResponse*
///
-(NSNumber*) geographicPoiTypesGetWithCompletionBlock: (NSString*) acceptLanguage
         callback: (NSString*) callback
        
        completionHandler: (void (^)(SystranPoiTypesResponse* output, NSError* error))completionBlock { 
        

    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/geographic/poi/types"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
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
                                         responseType: @"SystranPoiTypesResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((SystranPoiTypesResponse*)data, error);
              }
          ];
}



@end
