#import <Foundation/Foundation.h>
#import "SystranObject.h"

/**
 * NOTE: This class is auto generated by the swagger code generator program.
 * https://github.com/swagger-api/swagger-codegen
 * Do not edit the class manually.
 */



@protocol SystranChapter
@end

@interface SystranChapter : SystranObject

/* Chapter order 
 */
@property(nonatomic) NSString* order;
/* Chapter title 
 */
@property(nonatomic) NSString* title;
/* Chapter introduction 
 */
@property(nonatomic) NSString* introduction;
/* Chapter content 
 */
@property(nonatomic) NSString* content;

@end