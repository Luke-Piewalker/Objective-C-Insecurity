#import <Foundation/Foundation.h>
#include "Insecure_Class.h"
#include "Secure_Class.h"
#include "Swizzle.h"

void testInsecure(Insecure* instance)
{
    if ([instance returnTrue])
    {
        NSLog(@"Returned True!!!!");
    }
    else
    {
        NSLog(@"Returned False!!!!");
    }
    NSLog(@"%@\n", [instance conCatString:@"Hi " withString:@"friend!"]);
}

void testSecure(Secure* instance)
{
    if ([instance returnTrue])
    {
        NSLog(@"Returned True!!!!");
    }
    else
    {
        NSLog(@"Returned False!!!!");
    }
    NSLog(@"%@\n", [instance conCatString:@"Goodbye " withString:@"friend!"]);
}

int main(int argc, const char * argv[]) {
    
    @autoreleasepool {
        
        Insecure* insecure = [Insecure sharedManager];
        Secure* secure = [Secure sharedManager];
        
        NSLog(@"_____Showing default behavior_______");
        
        testInsecure(insecure);
        testSecure(secure);
        
        NSLog(@"_____ Swizzle functions _____");
        
        swizzleInstance_Method(insecure, @"returnTrue", (IMP)swizzled_returnTrue);
        swizzleInstance_Method(insecure, @"conCatString:withString:", (IMP)swizzled_conCatStringWithString);
        testInsecure(insecure);
    }
    return 0;
}
