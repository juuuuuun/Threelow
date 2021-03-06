//
//  Dice.m
//  Threelow
//
//  Created by Jun Oh on 2019-01-09.
//  Copyright © 2019 Jun Oh. All rights reserved.
//

#import "Dice.h"

@implementation Dice

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self roll];
    }
    return self;
}

- (void)roll {
    // arc4random_unifrom(value) will return a random number between 0 - (value-1)
    self.rollValue = arc4random_uniform(6) + 1;
}

@end
