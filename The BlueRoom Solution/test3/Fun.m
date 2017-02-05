//
//  Fun.m
//  the Blue Room Solution: test3
//
//  Created by Stephanie Wang on 2/5/17.
//  Copyright © 2017 hack@brown. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <stdlib.h>

NSArray<NSArray<NSString *>*> * sumAlgorithm (NSArray<NSArray<NSString*>*> * menu, float target)
{
    NSMutableArray *currentList = [NSMutableArray array];
    
    for (NSArray *row in menu)
    {
//        float number = atof(*row[2]);
        float number = [row[2] floatValue];
        if (number > target)
        {
            continue;
        }
        else if (number == target)
        {
//            return @[@[[NSNumber numberWithFloat:number]]];
            return @[@[row[1]]];
        }
        NSArray<NSArray<NSString *>*> * tempList = sumAlgorithm(menu, target - number);
        for (NSArray<NSNumber *>* combination in tempList)
        {
            NSMutableArray *newCombination = [combination mutableCopy];
            [newCombination addObject:row[1]];

            [currentList addObject:newCombination];
        }
    }
    return currentList;
}

NSArray<NSArray<NSString *>*> * restrictAlgorithm (NSString * restriction, NSArray<NSArray<NSString*>*> * combinations)
{
    NSMutableArray *goodCombos = [NSMutableArray array];
    for (NSArray<NSString *> *row in combinations)
    {
        if ([row containsObject:restriction])
        {
            [goodCombos addObject:row];
        }
    }
    
    return goodCombos;
}
