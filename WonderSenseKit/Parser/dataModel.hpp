//
//  DataModel.h
//  WonderSenseKit
//
//  Created by Eita Yamaguchi on 2020/05/24.
//  Copyright © 2020 WonderWonder. All rights reserved.
//

#ifndef DataModel_h
#define DataModel_h

#import <Foundation/Foundation.h>

@interface RawData: NSObject

@property double ax;
@property double ay;
@property double az;
@property double gx;
@property double gy;
@property double gz;
@property double mx;
@property double my;
@property double mz;

@end

@interface SensorProperty: NSObject

@property uint dataRate;
@property uint8_t accFsr;
@property uint16_t gyroFsr;
@property float magXcoef;
@property float magYcoef;
@property float magZcoef;
@property float lpf;

@end

#endif /* DataModel_h */
