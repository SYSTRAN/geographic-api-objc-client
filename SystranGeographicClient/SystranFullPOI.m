#import "SystranFullPOI.h"

@implementation SystranFullPOI

/**
 * Maps json key to property name.
 * This method is used by `JSONModel`.
 */
+ (JSONKeyMapper *)keyMapper
{
  return [[JSONKeyMapper alloc] initWithDictionary:@{ @"id": @"_id", @"location": @"location", @"name": @"name", @"types": @"types", @"rating": @"rating", @"priceLevel": @"priceLevel", @"contact": @"contact", @"openNow": @"openNow", @"openingHours": @"openingHours", @"photos": @"photos", @"url": @"url", @"descriptions": @"descriptions", @"reviews": @"reviews", @"booking": @"booking" }];
}

/**
 * Indicates whether the property with the given name is optional.
 * If `propertyName` is optional, then return `YES`, otherwise return `NO`.
 * This method is used by `JSONModel`.
 */
+ (BOOL)propertyIsOptional:(NSString *)propertyName
{
  NSArray *optionalProperties = @[@"name", @"rating", @"priceLevel", @"contact", @"openNow", @"openingHours", @"photos", @"url", @"descriptions", @"reviews", @"booking"];

  if ([optionalProperties containsObject:propertyName]) {
    return YES;
  }
  else {
    return NO;
  }
}

/**
 * Gets the string presentation of the object.
 * This method will be called when logging model object using `NSLog`.
 */
- (NSString *)description {
    return [[self toDictionary] description];
}

@end
