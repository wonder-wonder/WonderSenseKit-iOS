//
//  dataModel.m
//  WonderSenseKit
//
//  Created by Eita Yamaguchi on 2020/05/24.
//  Copyright © 2020 WonderWonder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "dataModel.h"

@implementation RawData : NSObject
@end

@implementation SensorProperty : NSObject

-(id) init
{
    if (self = [super init]) {
        _dataRate = 100;
        _accFsr = 2;
        _gyroFsr = 500;
        _magXcoef = 1.0;
        _magYcoef = 1.0;
        _magZcoef = 1.0;
        _lpf = 1;
    }
    return self;
}
@end
