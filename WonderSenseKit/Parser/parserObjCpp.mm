//
//  parserObjCpp.mm
//  WonderSenseKit
//
//  Created by Eita Yamaguchi on 2020/03/15.
//  Copyright © 2020 WonderWonder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "parserObjCpp.h"
#import "parser.h"

@implementation parserObjCpp {}

- (void)initParser:(SensorProperty *)sProperty {
    
    sensor_property *s_property;
    s_property = (sensor_property *)malloc(sizeof(sensor_property));
    
    s_property->dataRate = sProperty.dataRate;
    s_property->accFsr = sProperty.accFsr;
    s_property->gyroFsr = sProperty.gyroFsr;
    s_property->magXcoef = sProperty.magXcoef;
    s_property->magYcoef = sProperty.magYcoef;
    s_property->magZcoef = sProperty.magZcoef;
    s_property->lpf = sProperty.lpf;
    
    init_parser((void *)s_property);
}

- (NSMutableArray *)parse:(NSData *)nsData {
    
    void *data = malloc(nsData.length);
    memcpy(data, nsData.bytes, nsData.length);
    sensor_data *sd_arr = parse(data);
    NSMutableArray *mArr = [NSMutableArray array];
    
    constexpr int packet_size = 4;
    for (int i = 0; i < packet_size; ++i) {
        
        RawData *data = [[RawData alloc] init];
        
        data.ax = sd_arr[i].ax;
        data.ay = sd_arr[i].ay;
        data.az = sd_arr[i].az;
        
        data.gx = sd_arr[i].gx;
        data.gy = sd_arr[i].gy;
        data.gz = sd_arr[i].gz;
        
        data.mx = sd_arr[i].mx;
        data.my = sd_arr[i].my;
        data.mz = sd_arr[i].mz;
        
        [mArr addObject: data];
    }
    
    return mArr;
}

@end
