#include "Swizzle.h"
#include <Foundation/Foundation.h>
#include <objc/runtime.h>

static IMP oldIMP;
// Compiler generates a function which looks like this for Insecure & Secure instance methods "returnTrue"
bool swizzled_returnTrue(id selfRef, SEL _cmd)
{
    return false;
}
NSString* swizzled_conCatStringWithString(id selfRef, SEL _cmd, NSString* a, NSString* b)
{
    return @"I can't do that Dave";
}

bool swizzleInstance_Method(id instance, NSString* methodName, IMP newImplementation)
{
    bool ret = false;
    do
    {
        if (instance == nil || methodName == nil)
        {
            NSLog(@"instance||methodName == nil");
            break;
        }
        SEL selector = NSSelectorFromString(methodName);
        
        // Check that instance does respond to that method
        if (!(class_respondsToSelector([instance class], selector)))
        {
            NSLog(@"Instance doesn't respond to that method");
            break;
        }
        
        Method method = class_getInstanceMethod([instance class], selector);
        if (method == NULL)
        {
            NSLog(@"Failed to lookup instance method");
            break;
        }
        oldIMP = method_setImplementation(method, newImplementation);
        
        ret = true;
    } while (false);
    
    return ret;
}

