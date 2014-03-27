//
//  NSSet+MCSCollectionUtilities.h
//  MCSCollectionUtilities
//
//  Created by Rafał on 18.03.2014.
//  Copyright (c) 2014 Macoscope. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSSet (MCSCollectionUtilities)

- (NSArray *)mcs_sort:(NSComparator)block;

- (NSSet *)mcs_where:(BOOL(^)(id object))block;

- (NSSet *)mcs_union:(NSSet *)set;
- (NSSet *)mcs_union:(NSSet *)set comparator:(BOOL(^)(id obj1, id obj2))block;

- (NSSet *)mcs_unique;
- (NSSet *)mcs_unique:(BOOL(^)(id obj1, id obj2))block;

- (NSSet *)mcs_select:(id(^)(id object))block;
- (NSSet *)mcs_selectMany:(NSArray *(^)(id object))block;
- (NSSet *)mcs_map:(id(^)(id object))block;

- (void)mcs_each:(void(^)(id object))block;

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

- (BOOL)mcs_hasAnyElement;

- (NSSet *)mcs_sample;

@end
