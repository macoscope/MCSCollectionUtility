//
//  NSDictionary+MCKUtilities.h
//  MCKCOllectionsOperations
//
//  Created by Rafal Augustyniak on 15.03.2014.
//  Copyright (c) 2014 Rafał. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (MCKUtilities)

- (void)mcs_each:(void(^)(NSString *key, id object))block;

- (NSDictionary *)mcs_where:(BOOL(^)(NSString *key, id object))block;

- (NSArray *)mcs_sortedKeysArray:(NSComparator)block;
- (NSArray *)mcs_sortedValuesArray:(NSComparator)block;

- (NSInteger)mcs_count:(BOOL(^)(NSString *key, id object))block;

- (NSInteger)mcs_minInteger:(NSInteger(^)(NSString *key, id object))block;
- (CGFloat)mcs_minFloat:(CGFloat(^)(NSString *key, id object))block;

- (NSInteger)mcs_maxInteger:(NSInteger(^)(NSString *key, id object))block;
- (CGFloat)mcs_maxFloat:(CGFloat(^)(NSString *key, id object))block;

- (NSInteger)mcs_sumInteger:(NSInteger(^)(NSString *key, id object))block;
- (CGFloat)mcs_sumFloat:(CGFloat(^)(NSString *key, id object))block;

- (NSInteger)mcs_averageInteger:(NSInteger(^)(NSString *key, id object))block;
- (CGFloat)mcs_averageFloat:(CGFloat(^)(NSString *key, id object))block;

- (BOOL)mcs_single:(BOOL(^)(NSString *key, id object))block;
- (BOOL)mcs_any:(BOOL(^)(NSString *key, id object))block;
- (BOOL)mcs_all:(BOOL(^)(NSString *key, id object))block;

- (BOOL)mcs_hasAnyElement;


@end
