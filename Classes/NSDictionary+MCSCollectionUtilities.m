//
//  NSDictionary+MCSCollectionUtilities.m
//  MCSCollectionUtilities
//
//  Created by Rafal Augustyniak on 15.03.2014.
//  Copyright (c) 2014 Macoscope. All rights reserved.
//

#import "NSDictionary+MCSCollectionUtilities.h"
#import "NSArray+MCSCollectionUtilities.h"

@implementation NSDictionary (MCSCollectionUtilities)

- (void)mcs_each:(void (^)(id <NSCopying>, id))block
{
  [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
    block(key, obj);
  }];
}

- (NSDictionary *)mcs_where:(BOOL (^)(id <NSCopying>, id))block
{
  NSMutableDictionary *resultDictionary = [[NSMutableDictionary alloc] init];
  [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
    if (block(key, obj)) {
      resultDictionary[key] = obj;
    }
  }];
  
  return [NSDictionary dictionaryWithDictionary:resultDictionary];
}

- (NSArray *)mcs_sortedKeysArray
{
  return [[self allKeys] mcs_sort];
}

- (NSArray *)mcs_sortedKeysArray:(NSComparisonResult (^)(id <NSCopying> key1, id <NSCopying> key2))block
{
  return [[self allKeys] sortedArrayUsingComparator:block];
}

- (NSArray *)mcs_sortedValuesArray
{
  return [[self allValues] mcs_sort];
}

- (NSArray *)mcs_sortedValuesArray:(NSComparator)block
{
  return [[self allValues] sortedArrayUsingComparator:block];
}

- (NSInteger)mcs_count:(BOOL (^)(id <NSCopying>, id))block
{
  __block NSInteger counter = 0;
  [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
    if (block(key, obj)) {
      counter++;
    }
  }];
  
  return counter;
}

- (NSInteger)mcs_minInteger:(NSInteger (^)(id <NSCopying>, id))block
{
  __block NSInteger min = NSIntegerMax;
  [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
    NSInteger evaluationResult = block(key, obj);
    if (evaluationResult < min) {
      min = evaluationResult;
    }
  }];
  
  return min;
}

- (CGFloat)mcs_minFloat:(CGFloat (^)(id <NSCopying>, id))block
{
  __block CGFloat min = CGFLOAT_MAX;
  [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
    CGFloat evaluationResult = block(key, obj);
    if (evaluationResult < min) {
      min = evaluationResult;
    }
  }];
  
  return min;
}

- (NSInteger)mcs_maxInteger:(NSInteger (^)(id <NSCopying>, id))block
{
  __block NSInteger max = NSIntegerMin;
  [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
    NSInteger evaluationResult = block(key, obj);
    if (evaluationResult > max) {
      max = evaluationResult;
    }
  }];
  
  return max;
}

- (CGFloat)mcs_maxFloat:(CGFloat (^)(id <NSCopying>, id))block
{
  __block CGFloat max = CGFLOAT_MIN;
  [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
    CGFloat evaluationResult = block(key, obj);
    if (evaluationResult > max) {
      max = evaluationResult;
    }
  }];
  
  return max;
}

- (NSInteger)mcs_sumInteger:(NSInteger (^)(id <NSCopying>, id))block
{
  __block NSInteger sum = 0;
  [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
    sum += block(key, obj);
  }];
  
  return sum;
}

- (CGFloat)mcs_sumFloat:(CGFloat (^)(id <NSCopying>, id))block
{
  __block CGFloat sum = 0;
  [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
    sum += block(key, obj);
  }];
  
  return sum;
}

- (NSInteger)mcs_averageInteger:(NSInteger (^)(id <NSCopying>, id))block
{
  return [self mcs_hasAnyElement] ? [self mcs_sumInteger:block]/[self count] : 0;
}

- (CGFloat)mcs_averageFloat:(CGFloat (^)(id <NSCopying>, id))block
{
  return [self mcs_hasAnyElement] ? [self mcs_sumFloat:block]/[self count] : 0.0;
}

- (BOOL)mcs_single:(BOOL (^)(id <NSCopying>, id))block
{
  return [self mcs_count:block] == 1;
}

- (BOOL)mcs_any:(BOOL (^)(id <NSCopying>, id))block
{
  return [self mcs_count:block] > 0;
}

- (BOOL)mcs_all:(BOOL (^)(id <NSCopying>, id))block
{
  return [self mcs_count:block] == [self count];
}

- (BOOL)mcs_hasAnyElement
{
  return [self count] > 0;
}

@end
