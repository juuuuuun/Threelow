//
//  DiceManager.m
//  Threelow
//
//  Created by Jun Oh on 2019-01-09.
//  Copyright © 2019 Jun Oh. All rights reserved.
//

#import "DiceManager.h"

@interface DiceManager () {
    NSMutableArray* _allDice;
}
@end

@implementation DiceManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        _allDice = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void) addDice:(Dice *)dice {
    [_allDice addObject:dice];
}

- (NSString *)printValuesOfDice {
    NSString* totalValues = [NSString string];
    for(Dice* dice in [self allDice]) {
        NSString* valueOfDice = [[NSString alloc] initWithFormat:@"\nValue of die %li is: %li", [[self allDice] indexOfObject:dice]+1, dice.rollValue];
        totalValues = [totalValues stringByAppendingString:valueOfDice];
    }
    return totalValues;
}

- (NSArray<Dice *> *)allDice {
    return [[NSArray alloc] initWithArray:_allDice];
}

@end
