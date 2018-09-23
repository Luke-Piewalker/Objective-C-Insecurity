#import "Secure_Class.h"

@implementation Secure
+(Secure*)sharedManager
{
    static dispatch_once_t runOnce = 0;
    static Secure* instance = nil;
    dispatch_once(&runOnce, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

+(Secure*)standAloneManager
{
    return [[super alloc] init];
}

-(bool)returnTrue
{
    return true;
}
-(NSString*)conCatString:(NSString*) a withString:(NSString*) b
{
    return [NSString stringWithFormat:@"%@%@",a,b];
}
@end
