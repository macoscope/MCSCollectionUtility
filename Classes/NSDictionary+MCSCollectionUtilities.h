//
//  NSDictionary+MCSCollectionUtilities.h
//  MCSCollectionUtilities
//
//  Created by Rafal Augustyniak on 15.03.2014.
//  Copyright (c) 2014 Macoscope. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (MCSCollectionUtilities)

- (void)mcs_each:(void(^)(id <NSCopying> key, id object))block;

- (NSArray *)mcs_sortedKeysArray;
- (NSArray *)mcs_sortedValuesArray;

- (NSArray *)mcs_sortedKeysArray:(NSComparisonResult(^)(id <NSCopying> key1, id <NSCopying> key2))block;
- (NSArray *)mcs_sortedValuesArray:(NSComparator)block;

- (NSDictionary *)mcs_where:(BOOL(^)(id <NSCopying> key, id object))block;

- (NSInteger)mcs_count:(BOOL(^)(id <NSCopying> key, id object))block;

- (NSInteger)mcs_minInteger:(NSInteger(^)(id <NSCopying> key, id object))block;
- (CGFloat)mcs_minFloat:(CGFloat(^)(id <NSCopying> key, id object))block;

- (NSInteger)mcs_maxInteger:(NSInteger(^)(id <NSCopying> key, id object))block;
- (CGFloat)mcs_maxFloat:(CGFloat(^)(id <NSCopying> key, id object))block;

- (NSInteger)mcs_sumInteger:(NSInteger(^)(id <NSCopying> key, id object))block;
- (CGFloat)mcs_sumFloat:(CGFloat(^)(id <NSCopying> key, id object))block;

- (NSInteger)mcs_averageInteger:(NSInteger(^)(id <NSCopying> key, id object))block;
- (CGFloat)mcs_averageFloat:(CGFloat(^)(id <NSCopying> key, id object))block;

- (BOOL)mcs_single:(BOOL(^)(id <NSCopying> key, id object))block;
- (BOOL)mcs_any:(BOOL(^)(id <NSCopying> key, id object))block;
- (BOOL)mcs_all:(BOOL(^)(id <NSCopying> key, id object))block;

- (BOOL)mcs_hasAnyElement;


@end
