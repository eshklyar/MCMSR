//
//  MagicalCreature.h
//  MCMSR
//
//  Created by Edik Shklyar on 5/14/15.
//  Copyright (c) 2015 Edik Shklyar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MagicalCreature : NSObject
@property NSString *name;
@property NSMutableArray *creatures;

-(instancetype)initWithName:(NSString *)name;
@end
