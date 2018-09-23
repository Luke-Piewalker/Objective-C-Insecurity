#import <Foundation/Foundation.h>

@interface Insecure : NSObject


+(Insecure*)sharedManager;
+(Insecure*)standAloneManager;
-(bool)returnTrue;
-(NSString*)conCatString:(NSString*) a withString:(NSString*) b;

@end
