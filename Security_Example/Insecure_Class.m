#import "Insecure_Class.h"

@implementation Insecure
+(Insecure*)sharedManager
{
    static dispatch_once_t runOnce = 0;
    static Insecure* instance = nil;
    dispatch_once(&runOnce, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

+(Insecure*)standAloneManager
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
