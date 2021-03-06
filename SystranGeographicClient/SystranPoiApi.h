#import <Foundation/Foundation.h>
#import "SystranPoiDetailsResponse.h"
#import "SystranPoiResponse.h"
#import "SystranPoiTypesResponse.h"
#import "SystranObject.h"
#import "SystranApiClient.h"


/**
 * NOTE: This class is auto generated by the swagger code generator program. 
 * https://github.com/swagger-api/swagger-codegen 
 * Do not edit the class manually.
 */

@interface SystranPoiApi: NSObject

@property(nonatomic, assign)SystranApiClient *apiClient;

-(instancetype) initWithApiClient:(SystranApiClient *)apiClient;
-(void) addHeader:(NSString*)value forKey:(NSString*)key;
-(unsigned long) requestQueueSize;
+(SystranPoiApi*) apiWithHeader:(NSString*)headerValue key:(NSString*)key;
+(SystranPoiApi*) sharedAPI;
///
///
/// Get a specific Point of interest
/// Get a specific `Point of interest`.
///
/// @param _id POI identifier
/// @param acceptLanguage Preferred languages for response localization.\n\nSee [Accept-Language header specification for HTTP\n1.1](http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.4)
/// @param callback Javascript callback function name for JSONP Support
/// 
///
/// @return SystranPoiDetailsResponse*
-(NSNumber*) geographicPoiGetGetWithCompletionBlock :(NSString*) _id 
     acceptLanguage:(NSString*) acceptLanguage 
     callback:(NSString*) callback 
    
    completionHandler: (void (^)(SystranPoiDetailsResponse* output, NSError* error))completionBlock;
    


///
///
/// List Point of interests
/// Get a list of `Point of interests`.\n\nThe main criteria can be:\n* a position and a radius\n* a bounding box\n* a textual search\n\nAdditional critera can be added.
///
/// @param latitude Latitude location
/// @param longitude Longitude location
/// @param radius Radius in meters
/// @param maximumLatitude Latitude of the top (northernmost) side of the bounding box
/// @param maximumLongitude Longitude of the right (easternmost) side of the bounding box
/// @param minimumLatitude Latitude of the bottom (southernmost) side of the bounding box
/// @param minimumLongitude Longitude of the left (westernmost) side of the bounding box
/// @param filter Filter on all relevent POI data (name, type, address, ...)
/// @param name POI name
/// @param mainType POI main type
/// @param type POI type
/// @param address POI address
/// @param country POI country
/// @param state POI state
/// @param county POI county
/// @param city POI city
/// @param district POI district
/// @param postalCode POI postal code
/// @param street POI street
/// @param house POI house
/// @param rankBy Ranking criteria
/// @param openNow Only open for business POI
/// @param minimumRating Minimum rating
/// @param maximumRating Maximum rating
/// @param minimumPrice Minumum price
/// @param maximumPrice Maximum price
/// @param limit Pagination limit
/// @param offset Pagination offset
/// @param acceptLanguage Preferred languages for response localization.\n\nSee [Accept-Language header specification for HTTP\n1.1](http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.4)
/// @param callback Javascript callback function name for JSONP Support
/// 
///
/// @return SystranPoiResponse*
-(NSNumber*) geographicPoiListGetWithCompletionBlock :(NSNumber*) latitude 
     longitude:(NSNumber*) longitude 
     radius:(NSNumber*) radius 
     maximumLatitude:(NSNumber*) maximumLatitude 
     maximumLongitude:(NSNumber*) maximumLongitude 
     minimumLatitude:(NSNumber*) minimumLatitude 
     minimumLongitude:(NSNumber*) minimumLongitude 
     filter:(NSArray* /* NSString */) filter 
     name:(NSArray* /* NSString */) name 
     mainType:(NSString*) mainType 
     type:(NSArray* /* NSString */) type 
     address:(NSString*) address 
     country:(NSString*) country 
     state:(NSString*) state 
     county:(NSString*) county 
     city:(NSString*) city 
     district:(NSString*) district 
     postalCode:(NSString*) postalCode 
     street:(NSString*) street 
     house:(NSString*) house 
     rankBy:(NSString*) rankBy 
     openNow:(NSNumber*) openNow 
     minimumRating:(NSNumber*) minimumRating 
     maximumRating:(NSNumber*) maximumRating 
     minimumPrice:(NSNumber*) minimumPrice 
     maximumPrice:(NSNumber*) maximumPrice 
     limit:(NSNumber*) limit 
     offset:(NSNumber*) offset 
     acceptLanguage:(NSString*) acceptLanguage 
     callback:(NSString*) callback 
    
    completionHandler: (void (^)(SystranPoiResponse* output, NSError* error))completionBlock;
    


///
///
/// Get available Point of interest types
/// Get available `Point of interest` types.
///
/// @param acceptLanguage Preferred languages for response localization.\n\nSee [Accept-Language header specification for HTTP\n1.1](http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.4)
/// @param callback Javascript callback function name for JSONP Support
/// 
///
/// @return SystranPoiTypesResponse*
-(NSNumber*) geographicPoiTypesGetWithCompletionBlock :(NSString*) acceptLanguage 
     callback:(NSString*) callback 
    
    completionHandler: (void (^)(SystranPoiTypesResponse* output, NSError* error))completionBlock;
    



@end
