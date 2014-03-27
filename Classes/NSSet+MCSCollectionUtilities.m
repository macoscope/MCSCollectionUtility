//
//  NSSet+MCSCollectionUtilities.m
//  MCSCollectionUtilities
//
//  Created by Rafał on 18.03.2014.
//  Copyright (c) 2014 Macoscope. All rights reserved.
//

#import "NSSet+MCSCollectionUtilities.h"
#import "NSArray+MCSCollectionUtilities.h"

@implementation NSSet (MCSCollectionUtilities)


- (NSArray *)mcs_sort:(NSComparator)block
{
  NSArray *resultArray = [self allObjects];
  return [resultArray sortedArrayUsingComparator:block];
}

- (NSSet *)mcs_where:(BOOL (^)(id))block
{
  NSArray *resultArray = [[self allObjects] mcs_where:block];
  return [NSSet setWithArray:resultArray];
}

- (NSSet *)mcs_union:(NSSet *)set
{
  NSArray *resultArray = [[[self allObjects] mcs_union:[set allObjects]] mcs_unique];
  return [NSSet setWithArray:resultArray];
}

- (NSSet *)mcs_union:(NSSet *)set comparator:(BOOL(^)(id obj1, id obj2))block
{
  NSArray *resultArray = [[self allObjects] mcs_union:[set allObjects] comparator:block];
  return [NSSet setWithArray:resultArray];
}

- (NSSet *)mcs_unique
{
  NSArray *resultArray = [[self allObjects] mcs_unique];
  return [NSSet setWithArray:resultArray];
}

- (NSSet *)mcs_unique:(BOOL (^)(id, id))block
{
  NSArray *resultArray = [[self allObjects] mcs_unique:block];
  return [NSSet setWithArray:resultArray];
}

- (NSSet *)mcs_select:(id (^)(id))block
{
  NSArray *resultArray = [[self allObjects] mcs_select:block];
  return [NSSet setWithArray:resultArray];
}

- (NSSet *)mcs_selectMany:(NSArray *(^)(id))block
{
  NSArray *resultArray = [[self allObjects] mcs_selectMany:block];
  return [NSSet setWithArray:resultArray];
}

- (NSSet *)mcs_map:(id (^)(id))block
{
  NSArray *resultArray = [[self allObjects] mcs_map:block];
  return [NSSet setWithArray:resultArray];
}

- (void)mcs_each:(void (^)(id))block
{
  [[self allObjects] mcs_each:block];
}

- (NSInteger)mcs_count:(BOOL (^)(id))block
{
  return [[self mcs_where:block] count];
}

- (NSInteger)mcs_minInteger:(NSInteger (^)(id))block
{
  return [[self allObjects] mcs_minInteger:block];
}

- (CGFloat)mcs_minFloat:(CGFloat (^)(id))block
{
  return [[self allObjects] mcs_minFloat:block];
}

- (NSInteger)mcs_maxInteger:(NSInteger (^)(id))block
{
  return [[self allObjects] mcs_maxInteger:block];
}

- (CGFloat)mcs_maxFloat:(CGFloat (^)(id))block
{
  return [[self allObjects] mcs_maxFloat:block];
}

- (NSInteger)mcs_sumInteger:(NSInteger (^)(id))block
{
  return [[self allObjects] mcs_sumInteger:block];
}

- (CGFloat)mcs_sumFloat:(CGFloat (^)(id))block
{
  return [[self allObjects] mcs_sumFloat:block];
}

- (NSInteger)mcs_averageInteger:(NSInteger (^)(id))block
{
  return [self mcs_hasAnyElement] ?  [self mcs_sumInteger:block]/[self count] : 0;
}

- (CGFloat)mcs_averageFloat:(CGFloat (^)(id))block
{
  return [self mcs_hasAnyElement] ?  [self mcs_sumFloat:block]/[self count] : 0.0;
}

- (BOOL)mcs_single:(BOOL (^)(id))block
{
  return [self mcs_count:block] == 1;
}

- (BOOL)mcs_any:(BOOL (^)(id))block
{
  return [self mcs_count:block] > 0;
}

- (BOOL)mcs_all:(BOOL (^)(id))block
{
  return [self mcs_count:block] == [self count];
}

- (BOOL)mcs_hasAnyElement
{
  return [self count] > 0;
}

- (NSSet *)mcs_sample
{
  return [[self allObjects] mcs_sample];
}

@end
