//
//  GameController.m
//  Threelow
//
//  Created by Jun Oh on 2019-01-09.
//  Copyright © 2019 Jun Oh. All rights reserved.
//

#import "GameController.h"

@interface GameController () {
    NSMutableArray* _allDice;
}
@end

@implementation GameController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _allDice = [[NSMutableArray alloc] init];
        _heldDice = [[NSMutableSet alloc] init];
        _keptDice = [[NSMutableSet alloc] init];
        _rollTaken = 0;
    }
    return self;
}

- (void) addDice:(NSInteger)numberOfDice {
    for(int i = 0; i < numberOfDice; i++) {
        [_allDice addObject:[[Dice alloc] init]];
    }
    [self rollDice];
}

- (void)holdDie:(NSInteger)dieNumber {
    // dieNumber should be greater than 0 and smaller than or equal to the number of all dice in the collection
    if(dieNumber <= 0 || dieNumber > self.allDice.count) {
        NSLog(@"No such die exists");
        return;
    }
    
    // dieNumber will be 1 greater than die subscript required to add/remove since array is 0-based
    Dice* diceToAdd = [self.allDice objectAtIndex:dieNumber-1];
    if( [self.heldDice containsObject:diceToAdd]) {
        if( [self.keptDice containsObject:diceToAdd]) {
            NSLog(@"Cannot unhold die held from last turn");
        } else {
            [self.heldDice removeObject:diceToAdd];
        }
    } else {
        [self.heldDice addObject:diceToAdd];
    }
}

-(void)rollDice {
    for(Dice* dice in self.allDice) {
        if(![self.heldDice containsObject:dice]) {
            [dice roll];
        } else {
            [self.keptDice addObject:dice];
        }
    }
    if(!(self.keptDice.count == self.allDice.count)) {
        self.rollTaken++;
    }
}

- (void)resetDice {
    [self.keptDice removeAllObjects];
    [self.heldDice removeAllObjects];
    self.rollTaken = 0;
    [self rollDice];
}

- (NSInteger)currentScore {
    NSInteger totalScore = 0;
    for(Dice* dice in self.heldDice) {
        // If roll value is 3, do not add any value, since that is the point of Threelow
        if(dice.rollValue == 3) {
            continue;
        }
        totalScore += dice.rollValue;
    }
    return totalScore;
}

- (NSString *)printValuesOfDice {
    NSDictionary<NSNumber*, NSString*>* valueSymbols = @{
                                                         @1 : @"⚀",
                                                         @2 : @"⚁",
                                                         @3 : @"⚂",
                                                         @4 : @"⚃",
                                                         @5 : @"⚄",
                                                         @6 : @"⚅"
                                                         };
    
    NSString* totalValues = [NSString string];
    
    for(Dice* dice in [self allDice]) {
        
        NSString* valueOfDice;
        if([self.heldDice containsObject:dice]) {
            valueOfDice = [[NSString alloc] initWithFormat:@"\nValue of die %li is: [%@]", [[self allDice] indexOfObject:dice]+1, [valueSymbols objectForKey:[NSNumber numberWithInteger:dice.rollValue]]];
        } else {
            valueOfDice = [[NSString alloc] initWithFormat:@"\nValue of die %li is: %@", [[self allDice] indexOfObject:dice]+1, [valueSymbols objectForKey:[NSNumber numberWithInteger:dice.rollValue]]];
        }
        
        totalValues = [totalValues stringByAppendingString:valueOfDice];
    }
    
    totalValues = [totalValues stringByAppendingFormat:@"\nNumber of rolls so far: %li", self.rollTaken];
    
    if((self.keptDice.count == self.allDice.count)) {
        totalValues = [totalValues stringByAppendingFormat:@"\nYour final score is: %li", [self currentScore]];
    } else {
        totalValues = [totalValues stringByAppendingFormat:@"\nYour current score is: %li", [self currentScore]];
    }
    
    return totalValues;
}

- (NSArray<Dice *> *)allDice {
    return [[NSArray alloc] initWithArray:_allDice];
}

@end
