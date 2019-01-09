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
        
        while (YES) {
            NSLog(@"%@", [gameController printValuesOfDice]);
            
            char userInput[255];
            fgets(userInput, 255, stdin);
            NSString* inputString = [[NSString stringWithUTF8String:userInput] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            
            if([inputString isEqualToString:@"roll"]) {
                [gameController rollDice];
            }
            
            if([inputString hasPrefix:@"hold"]) {
                NSArray* inputArguments = [inputString componentsSeparatedByString:@" "];
                if(inputArguments.count < 2) {
                    NSLog(@"Hold needs 2 argument (e.g. hold 3)");
                    continue;
                } else {
                    [gameController holdDie:[inputArguments[1] integerValue]];
                }
            }
            
            if([inputString isEqualToString:@"reset"]) {
                [gameController resetDice];
            }
        }
        
        
    }
    return 0;
}
