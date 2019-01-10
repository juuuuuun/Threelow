//
//  GameController.h
//  Threelow
//
//  Created by Jun Oh on 2019-01-09.
//  Copyright © 2019 Jun Oh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dice.h"

NS_ASSUME_NONNULL_BEGIN

@interface GameController : NSObject

@property (nonatomic, strong, readonly) NSArray<Dice *>* allDice;
@property (nonatomic, strong) NSMutableSet<Dice *>* heldDice;
@property (nonatomic, strong) NSMutableSet<Dice *>* keptDice;
@property (nonatomic) NSInteger rollTaken;

-(void) addDice:(NSInteger)numberOfDice;

-(void) holdDie:(NSInteger)dieNumber;

-(void) rollDice;

-(void) resetDice;

-(NSInteger) currentScore;

-(NSString *) printValuesOfDice;

@end

NS_ASSUME_NONNULL_END
