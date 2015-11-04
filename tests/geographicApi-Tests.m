#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "SystranApiClient.h"
#import "SystranConfiguration.h"
#import "SystranPoiApi.h"
#import "SystranInspirationsApi.h"
#import "SystranDestinationsApi.h"
#import "SystranSupportedLanguagesApi.h"


@interface Geographic_ApiTest : XCTestCase {
    NSString *key;
    NSString *path;
    SystranPoiApi *poiApi;
    SystranDestinationsApi *destinationsApi;
    SystranInspirationsApi *inspirationsApi;
    SystranSupportedLanguagesApi *supportedLanguagesApi;
    SystranConfiguration *configuration;
}

@end

@implementation Geographic_ApiTest



- (void)setUp {
    path = @"<API KEY FILEPATH HERE>";
    key = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    [[SystranConfiguration sharedConfig] setApiKey:key forApiKeyIdentifier:@"key"];
    [[SystranConfiguration sharedConfig] setHost:@"https://platform.systran.net:8904"];
    
    destinationsApi = [[SystranDestinationsApi alloc]init];
    inspirationsApi = [[SystranInspirationsApi alloc]init];
    poiApi = [[SystranPoiApi alloc]init];
    supportedLanguagesApi = [[SystranSupportedLanguagesApi alloc]init];
    
}

- (void)testDestinationsList {
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"PoiDetailsGet"];
    [destinationsApi geographicDestinationsListGetWithCompletionBlock:nil longitude:nil radius:nil address:nil country:nil state:nil county:nil city:nil district:nil postalCode:nil limit:nil offset:nil acceptLanguage:nil callback:nil completionHandler:^(SystranDestinationResponse *output, NSError *error) {
        if(error) {
            XCTFail(@"got error %@", error);
        }
        if(output == nil){
            XCTFail(@"failed to fetch POI events");
        }
        else {
            XCTAssertNotNil(output, @"Pass");
            [expectation fulfill];
            
        }
        
    }];
    [self waitForExpectationsWithTimeout:20.0 handler:nil];
}

- (void)testDestinationsGet {
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"PoiDestinationsGet"];
    
    [destinationsApi geographicDestinationsListGetWithCompletionBlock:nil longitude:nil radius:nil address:nil country:nil state:nil county:nil city:nil district:nil postalCode:nil limit:nil offset:nil acceptLanguage:nil callback:nil completionHandler:^(SystranDestinationResponse *output, NSError *error) {
        if(error) {
            XCTFail(@"got error %@", error);
        }
        if(output == nil){
            XCTFail(@"failed to fetch POI events");
        }
        else {
            if([output.destinations count] > 0) {
                
                
                SystranDestination *destination = output.destinations[0];
                [destinationsApi geographicDestinationsGetGetWithCompletionBlock: destination._id acceptLanguage:nil callback: nil completionHandler:^(SystranDestinationDetailsResponse *output, NSError *error) {
                    if(error) {
                        XCTFail(@"got error %@", error);
                    }
                    if(output == nil){
                        XCTFail(@"failed to fetch POI events");
                    }
                    else {
                        XCTAssertNotNil(output, @"Pass");
                        [expectation fulfill];
                        
                    }
                    
                }];
            }
            else {
                XCTFail(@"no POI events to list");
            }
        }
        
    }];
    
    [self waitForExpectationsWithTimeout:20.0 handler:nil];
}


- (void)testSupportedLanguagesGet {
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"PoiDetailsGet"];
    
    [supportedLanguagesApi geographicSupportedLanguagesGetWithCompletionBlock:nil completionHandler:^(SystranSupportedLanguagesResponse *output, NSError *error) {
        if(error) {
            XCTFail(@"got error %@", error);
        }
        if(output == nil){
            XCTFail(@"failed to fetch POI events");
        }
        else {
            XCTAssertNotNil(output, @"Pass");
            [expectation fulfill];
            
        }
        
    }];
    [self waitForExpectationsWithTimeout:10.0 handler:nil];
}

- (void)testInspirationsDossiersList {
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"PoiDetailsGet"];
    
    [inspirationsApi geographicInspirationsDossiersListGetWithCompletionBlock:nil longitude:nil radius:nil address:nil country:nil state:nil county:nil city:nil district:nil postalCode:nil limit:nil offset:nil acceptLanguage:nil callback:nil completionHandler:^(SystranInspirationResponse *output, NSError *error) {
        if(error) {
            XCTFail(@"got error %@", error);
        }
        if(output == nil){
            XCTFail(@"failed to fetch POI events");
        }
        else {
            XCTAssertNotNil(output, @"Pass");
            [expectation fulfill];
            
        }
        
    }];
    [self waitForExpectationsWithTimeout:10.0 handler:nil];
}

- (void)testInspirationsEventsList {
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"PoiDetailsGet"];
    
    [inspirationsApi geographicInspirationsEventsListGetWithCompletionBlock:nil longitude:nil radius:nil address:nil country:nil state:nil county:nil city:nil district:nil postalCode:nil limit:nil offset:nil acceptLanguage:nil callback:nil completionHandler:^(SystranInspirationResponse *output, NSError *error) {
        if(error) {
            XCTFail(@"got error %@", error);
        }
        if(output == nil){
            XCTFail(@"failed to fetch POI events");
        }
        else {
            XCTAssertNotNil(output, @"Pass");
            [expectation fulfill];
            
        }
        
    }];
    [self waitForExpectationsWithTimeout:10.0 handler:nil];
}

- (void)testInspirationsGetGet {
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"PoiDetailsGet"];
    
    [inspirationsApi geographicInspirationsEventsListGetWithCompletionBlock:nil longitude:nil radius:nil address:nil country:nil state:nil county:nil city:nil district:nil postalCode:nil limit:nil offset:nil acceptLanguage:nil callback:nil completionHandler:^(SystranInspirationResponse *output, NSError *error) {
        if(error) {
            XCTFail(@"got error %@", error);
        }
        if(output == nil){
            XCTFail(@"failed to fetch POI events");
        }
        else {
            if ([output.inspirations count] > 0)
            {
                SystranInspiration *systranInspiration =  output.inspirations[0];
                
                [inspirationsApi geographicInspirationsGetGetWithCompletionBlock:systranInspiration._id acceptLanguage:nil callback:nil completionHandler:^(SystranInspirationDetailsResponse *output, NSError *error) {
                    if(error) {
                        XCTFail(@"got error %@", error);
                    }
                    if(output == nil){
                        XCTFail(@"failed to fetch POI events");
                    }
                    else {
                        XCTAssertNotNil(output, @"Pass");
                        [expectation fulfill];
                        
                    }
                    
                }];
            }
            else {
                XCTFail(@"no event to list");
            }
            
        }
        
    }];
    [self waitForExpectationsWithTimeout:30.0 handler:nil];
}

- (void)testInspirationsListGet {
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"PoiDetailsGet"];
    
    [inspirationsApi geographicInspirationsListGetWithCompletionBlock:nil longitude:nil radius:nil address:nil country:nil state:nil county:nil city:nil district:nil postalCode:nil limit:nil offset:nil acceptLanguage:nil callback:nil completionHandler:^(SystranInspirationResponse *output, NSError *error) {
        
        if(error) {
            XCTFail(@"got error %@", error);
        }
        if(output == nil){
            XCTFail(@"failed to fetch POI events");
        }
        else {
            XCTAssertNotNil(output, @"Pass");
            [expectation fulfill];
            
        }
        
    }];
    [self waitForExpectationsWithTimeout:10.0 handler:nil];
}

- (void)testInspirationsNewsInBriefListGet {
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"PoiDetailsGet"];
    
    
    [inspirationsApi geographicInspirationsNewsInBriefListGetWithCompletionBlock:nil longitude:nil radius:nil address:nil country:nil state:nil county:nil city:nil district:nil postalCode:nil limit:nil offset:nil acceptLanguage:nil callback:nil completionHandler:^(SystranInspirationResponse *output, NSError *error) {
        if(error) {
            XCTFail(@"got error %@", error);
        }
        if(output == nil){
            XCTFail(@"failed to fetch POI events");
        }
        else {
            XCTAssertNotNil(output, @"Pass");
            [expectation fulfill];
            
        }
        
    }];
    [self waitForExpectationsWithTimeout:10.0 handler:nil];
}

- (void)testInspirationsSlideShowsListGet {
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"PoiDetailsGet"];
    
    [inspirationsApi geographicInspirationsSlideShowsListGetWithCompletionBlock:nil longitude:nil radius:nil address:nil country:nil state:nil county:nil city:nil district:nil postalCode:nil limit:nil offset:nil acceptLanguage:nil callback:nil completionHandler:^(SystranInspirationResponse *output, NSError *error) {
        if(error) {
            XCTFail(@"got error %@", error);
        }
        if(output == nil){
            XCTFail(@"failed to fetch POI events");
        }
        else {
            XCTAssertNotNil(output, @"Pass");
            [expectation fulfill];
            
        }
        
    }];
    [self waitForExpectationsWithTimeout:10.0 handler:nil];
}

- (void)testInspirationsTestsListGet {
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"PoiDetailsGet"];
    
    [inspirationsApi geographicInspirationsTestsListGetWithCompletionBlock:nil longitude:nil radius:nil address:nil country:nil state:nil county:nil city:nil district:nil postalCode:nil limit:nil offset:nil acceptLanguage:nil callback:nil completionHandler:^(SystranInspirationResponse *output, NSError *error) {
        if(error) {
            XCTFail(@"got error %@", error);
        }
        if(output == nil){
            XCTFail(@"failed to fetch POI events");
        }
        else {
            XCTAssertNotNil(output, @"Pass");
            [expectation fulfill];
            
        }
        
    }];
    [self waitForExpectationsWithTimeout:10.0 handler:nil];
}

- (void)testPoiEventsGet {
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"PoiEventsGet"];
    [poiApi geographicPoiListGetWithCompletionBlock:nil longitude:nil radius:nil maximumLatitude:nil maximumLongitude:nil minimumLatitude:nil minimumLongitude:nil filter:nil name:nil mainType:nil type:nil address:nil country:nil state:nil county:nil city:nil district:nil postalCode:nil street:nil house:nil rankBy:nil openNow:nil minimumRating:nil maximumRating:nil minimumPrice:nil maximumPrice:nil limit:nil offset:nil acceptLanguage:nil callback:nil completionHandler:^(SystranPoiResponse *output, NSError *error) {
        if(error) {
            XCTFail(@"got error %@", error);
        }
        if(output == nil){
            XCTFail(@"failed to fetch POI events");
        }
        else {
            XCTAssertNotNil(output, @"Pass");
            [expectation fulfill];
            
        }
    }];
    [self waitForExpectationsWithTimeout:30.0 handler:nil];
}

- (void)testPoiListGet {
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"PoiEventsGet"];
    [poiApi geographicPoiListGetWithCompletionBlock:nil longitude:nil radius:nil maximumLatitude:nil maximumLongitude:nil minimumLatitude:nil minimumLongitude:nil filter:nil name:nil mainType:nil type:nil address:nil country:nil state:nil county:nil city:nil district:nil postalCode:nil street:nil house:nil rankBy:nil openNow:nil minimumRating:nil maximumRating:nil minimumPrice:nil maximumPrice:nil limit:nil offset:nil acceptLanguage:nil callback:nil completionHandler:^(SystranPoiResponse *output, NSError *error) {
        if(error) {
            XCTFail(@"got error %@", error);
        }
        if(output == nil){
            XCTFail(@"failed to fetch POI events");
        }
        else {
            XCTAssertNotNil(output, @"Pass");
            [expectation fulfill];
            
        }
    }];
    [self waitForExpectationsWithTimeout:30.0 handler:nil];
}

- (void)testPoiGet {
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"PoiDetailsGet"];
    [poiApi geographicPoiListGetWithCompletionBlock:nil longitude:nil radius:nil maximumLatitude:nil maximumLongitude:nil minimumLatitude:nil minimumLongitude:nil filter:nil name:nil mainType:nil type:nil address:nil country:nil state:nil county:nil city:nil district:nil postalCode:nil street:nil house:nil rankBy:nil openNow:nil minimumRating:nil maximumRating:nil minimumPrice:nil maximumPrice:nil limit:nil offset:nil acceptLanguage:nil callback:nil completionHandler:^(SystranPoiResponse *output, NSError *error) {
        if(error) {
            XCTFail(@"got error %@", error);
        }
        if(output == nil){
            XCTFail(@"failed to fetch POI events");
        }
        else {
            if ([output.pointsOfInterest count] > 0)
            {
                SystranLitePOI *systranLitePOI = output.pointsOfInterest[0];
                [poiApi geographicPoiGetGetWithCompletionBlock:nil acceptLanguage:systranLitePOI._id callback:nil completionHandler:^(SystranPoiDetailsResponse *output, NSError *error) {
                    if(error) {
                        XCTFail(@"got error %@", error);
                    }
                    if(output == nil){
                        XCTFail(@"failed to fetch POI");
                    }
                    else {
                        XCTAssertNotNil(output, @"Pass");
                        [expectation fulfill];
                        
                    }
                }];
            }
            else{
                XCTFail(@"no pointsOfInterest to list");
                
            }
        }
    }];
    [self waitForExpectationsWithTimeout:10.0 handler:nil];
}


- (void)testTypesGet {
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"PoiDetailsGet"];
    [poiApi geographicPoiTypesGetWithCompletionBlock:nil callback:nil completionHandler:^(SystranPoiTypesResponse *output, NSError *error) {
        if(error) {
            XCTFail(@"got error %@", error);
        }
        if(output == nil){
            XCTFail(@"failed to fetch POI types");
        }
        else {
            XCTAssertNotNil(output, @"Pass");
            [expectation fulfill];
            
        }
    }];
    [self waitForExpectationsWithTimeout:15.0 handler:nil];
}
@end
