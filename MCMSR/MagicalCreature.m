//
//  MagicalCreature.m
//  MCMSR
//
//  Created by Edik Shklyar on 5/14/15.
//  Copyright (c) 2015 Edik Shklyar. All rights reserved.
//

#import "MagicalCreature.h"

@implementation MagicalCreature

//-(instancetype)init{
//    abort();
//    return nil;
//
//}
-(instancetype)initWithName:(NSString *)name{
    self = [super self];
    if (name.length == 0) {
        [NSException raise:NSInvalidArgumentException format:@"Dragons must have a name."];
    }
    if (self){
        self.name = name;
    }
    return self;
}

@end

