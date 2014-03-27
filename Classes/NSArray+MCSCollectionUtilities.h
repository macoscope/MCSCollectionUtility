//
//  NSArray+MCSCollectionUtilities.h
//  MCSCollectionUtilities
//
//  Created by Rafał on 12.03.2014.
//  Copyright (c) 2014 Macoscope. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (MCSCollectionUtilities)

- (void)mcs_each:(void(^)(id object))block;
- (void)mcs_eachWithIndex:(void(^)(id object, NSUInteger index))block;

- (NSArray *)mcs_skip:(NSInteger)number;
- (NSArray *)mcs_skipWhile:(BOOL(^)(id object))block;

- (NSArray *)mcs_take:(NSInteger)number;
- (NSArray *)mcs_takeWhile:(BOOL(^)(id object))block;

- (NSArray *)mcs_where:(BOOL(^)(id object))block;

- (NSArray *)mcs_unique;
- (NSArray *)mcs_unique:(BOOL(^)(id object1, id object2))block;

- (NSArray *)mcs_union:(NSArray *)array;
- (NSArray *)mcs_union:(NSArray *)array comparator:(BOOL(^)(id object1, id object2))block;

- (NSArray *)mcs_select:(id(^)(id object))block;
- (NSArray *)mcs_selectMany:(NSArray *(^)(id object))block;
- (NSArray *)mcs_map:(id(^)(id object))block;

- (NSInteger)mcs_count:(BOOL(^)(id object))block;

- (NSInteger)mcs_minInteger:(NSInteger(^)(id object))block;
- (CGFloat)mcs_minFloat:(CGFloat(^)(id object))block;

- (NSInteger)mcs_maxInteger:(NSInteger(^)(id object))block;
- (CGFloat)mcs_maxFloat:(CGFloat(^)(id object))block;

- (NSInteger)mcs_sumInteger:(NSInteger(^)(id object))block;
- (CGFloat)mcs_sumFloat:(CGFloat(^)(id object))block;

- (NSInteger)mcs_averageInteger:(NSInteger(^)(id object))block;
- (CGFloat)mcs_averageFloat:(CGFloat(^)(id object))block;

- (BOOL)mcs_single:(BOOL(^)(id object))block;
- (BOOL)mcs_any:(BOOL(^)(id object))block;
- (BOOL)mcs_all:(BOOL(^)(id object))block;

- (id)mcs_first:(id(^)(id object))block;
- (id)mcs_last:(id(^)(id object))block;

- (NSArray *)mcs_reverse;

- (BOOL)mcs_hasAnyElement;

- (id)mcs_sample;

- (NSArray *)mcs_rotate:(NSInteger)shift;

- (NSArray *)mcs_sort;
- (NSArray *)mcs_sortInDescendingOrder;


@end
