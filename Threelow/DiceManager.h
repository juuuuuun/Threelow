//
//  DiceManager.h
//  Threelow
//
//  Created by Jun Oh on 2019-01-09.
//  Copyright © 2019 Jun Oh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dice.h"

NS_ASSUME_NONNULL_BEGIN

@interface DiceManager : NSObject

@property (nonatomic, strong, readonly) NSArray<Dice *>* allDice;

@end

NS_ASSUME_NONNULL_END
