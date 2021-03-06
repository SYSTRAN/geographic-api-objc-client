#import <Foundation/Foundation.h>
#import "SystranSupportedLanguagesResponse.h"
#import "SystranObject.h"
#import "SystranApiClient.h"


/**
 * NOTE: This class is auto generated by the swagger code generator program. 
 * https://github.com/swagger-api/swagger-codegen 
 * Do not edit the class manually.
 */

@interface SystranSupportedLanguagesApi: NSObject

@property(nonatomic, assign)SystranApiClient *apiClient;

-(instancetype) initWithApiClient:(SystranApiClient *)apiClient;
-(void) addHeader:(NSString*)value forKey:(NSString*)key;
-(unsigned long) requestQueueSize;
+(SystranSupportedLanguagesApi*) apiWithHeader:(NSString*)headerValue key:(NSString*)key;
+(SystranSupportedLanguagesApi*) sharedAPI;
///
///
/// Get Supported Languages
/// Get a list of languages in which geographic data can be localized.
///
/// @param callback Javascript callback function name for JSONP Support
/// 
///
/// @return SystranSupportedLanguagesResponse*
-(NSNumber*) geographicSupportedLanguagesGetWithCompletionBlock :(NSString*) callback 
    
    completionHandler: (void (^)(SystranSupportedLanguagesResponse* output, NSError* error))completionBlock;
    



@end
