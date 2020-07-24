//
//  parserObjCpp.hpp
//  WonderSenseKit
//
//  Created by Eita Yamaguchi on 2020/03/15.
//  Copyright © 2020 WonderWonder. All rights reserved.
//

#ifndef parserObjCpp_h
#define parserObjCpp_h

#import <Foundation/Foundation.h>
#import "dataModel.hpp"

@interface parserObjCpp: NSObject

- (void)initParser:(SensorProperty *)data;
- (NSMutableArray *)parse:(NSData *)data;

@end

#endif /* parserObjCpp_h */
