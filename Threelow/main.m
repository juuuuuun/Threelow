//
//  main.m
//  Threelow
//
//  Created by Jun Oh on 2019-01-09.
//  Copyright © 2019 Jun Oh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dice.h"
#import "GameController.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"\nTHREELOW!\n\n\n");
        
        int numberOfDice = 5;
        GameController* gameController = [[GameController alloc] init];
        [gameController addDice:numberOfDice];
        
        NSInteger numberOfHeldDiceLastTurn = gameController.heldDice.count;
        
        NSInteger scoreToBeat = 6 * numberOfDice;
        while (YES) {
            
            if(gameController.keptDice.count == gameController.allDice.count) {
                scoreToBeat = [gameController currentScore];
            }
            
            NSLog(@"%@", [gameController printValuesOfDice]);
            NSLog(@"\nScore to beat this game is: %li", scoreToBeat);
            
            char userInput[255];
            fgets(userInput, 255, stdin);
            NSString* inputString = [[NSString stringWithUTF8String:userInput] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            
            if([inputString isEqualToString:@"roll"]) {
                if(gameController.heldDice.count > numberOfHeldDiceLastTurn) {
                    [gameController rollDice];
                    numberOfHeldDiceLastTurn = gameController.heldDice.count;
                } else {
                    NSLog(@"You must hold at least 1 die before rolling again.");
                }
            }
            
            if([inputString hasPrefix:@"hold"]) {
                NSArray* inputArguments = [inputString componentsSeparatedByString:@" "];
                if(inputArguments.count < 2) {
                    NSLog(@"Hold needs 2 argument (e.g. hold 3)");
                } else {
                    
                    [gameController holdDie:[inputArguments[1] integerValue]];
                }
            }
            
            if([inputString isEqualToString:@"reset"]) {
                [gameController resetDice];
                numberOfHeldDiceLastTurn = gameController.heldDice.count;
            }
            
            if([inputString isEqualToString:@"new game"]) {
                scoreToBeat = 6 * numberOfDice;
                [gameController resetDice];
                numberOfHeldDiceLastTurn = gameController.heldDice.count;
            }
            
            if([inputString isEqualToString:@"there is no cow level"]) {
                for(Dice* dice in gameController.allDice) {
                    dice.rollValue = 3;
                }
            }
        }
        
        
    }
    return 0;
}
