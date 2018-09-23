#ifndef Shenanigans_h
#define Shenanigans_h

#include <stdio.h>
#include <Foundation/Foundation.h>
bool swizzleInstance_Method(id instance, NSString* methodName, IMP newImplementation);
NSString* swizzled_conCatStringWithString(id selfRef, SEL _cmd, NSString* a, NSString* b);
bool swizzled_returnTrue(id selfRef, SEL _cmd);
#endif /* Shenanigans_h */
