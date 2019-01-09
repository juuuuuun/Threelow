//
//  main.m
//  Threelow
//
//  Created by Jun Oh on 2019-01-09.
//  Copyright © 2019 Jun Oh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dice.h"
#import "DiceManager.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"⚀ ⚁ ⚂ ⚃ ⚄ ⚅");
        
        int numberOfDice = 5;
        DiceManager* diceManager = [[DiceManager alloc] init];
        for(int i = 0; i < numberOfDice; i++) {
            [diceManager addDice:[[Dice alloc] init]];
        }
        
        NSLog(@"%@", [diceManager printValuesOfDice]);
        
        while (YES) {
            char userInput[255];
            fgets(userInput, 255, stdin);
            NSString* inputString = [[NSString stringWithUTF8String:userInput] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            
            if([inputString isEqualToString:@"roll"]) {
                for(Dice* dice in diceManager.allDice) {
                    [dice roll];
                }
                NSLog(@"%@", [diceManager printValuesOfDice]);
            }
        }
        
        
    }
    return 0;
}
