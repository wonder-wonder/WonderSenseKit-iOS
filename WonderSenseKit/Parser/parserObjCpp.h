//
//  parserObjCpp.hpp
//  WonderSenseKit
//
//  Created by Eita Yamaguchi on 2020/03/15.
//  Copyright © 2020 WonderWonder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "dataModel.h"

@interface parserObjCpp: NSObject

- (void)initParser:(SensorProperty *)data;
- (NSMutableArray *)parse:(NSData *)data;

@end
