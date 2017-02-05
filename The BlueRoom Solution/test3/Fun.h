//
//  Fun.h
//  test3
//
//  Created by Stephanie Wang on 2/5/17.
//  Copyright © 2017 hack@brown. All rights reserved.
//

#ifndef Fun_h
#define Fun_h

#import <Foundation/Foundation.h>
#include <stdlib.h>

extern NSArray* csvMenu;

NSArray<NSArray<NSString *>*> * sumAlgorithm (NSArray<NSArray<NSString*>*> * menu, float target);

NSArray<NSArray<NSString *>*> * restrictAlgorithm (NSString * restriction, NSArray<NSArray<NSString*>*> * combinations);

#endif /* Fun_h */
