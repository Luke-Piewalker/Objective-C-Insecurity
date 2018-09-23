#import <Foundation/Foundation.h>

@interface Secure : NSObject
+(Secure*)sharedManager;
+(Secure*)standAloneManager;
-(bool)returnTrue;
-(NSString*)conCatString:(NSString*) a withString:(NSString*) b;
@end
