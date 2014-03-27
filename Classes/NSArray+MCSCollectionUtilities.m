//
//  NSArray+MCSCollectionUtilities.m
//  MCSCollectionUtilities
//
//  Created by Rafał on 12.03.2014.
//  Copyright (c) 2014 Macoscope. All rights reserved.
//

#import "NSArray+MCSCollectionUtilities.h"

@implementation NSArray (MCSCollectionUtilities)

- (NSArray *)mcs_take:(NSInteger)number
{
  NSInteger count = [self count];
  number = MIN(count, number);
  
  return [self subarrayWithRange:NSMakeRange(0, number)];
}

- (NSArray *)mcs_takeWhile:(BOOL (^)(id))block
{
  NSInteger index = [self indexOfObjectPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
    
    return !block(obj);
    
  }];
  
  if (index == NSNotFound) {
    return [self copy];
  }
  
  return [self subarrayWithRange:NSMakeRange(0, index)];
}

- (NSArray *)mcs_skip:(NSInteger)number
{
  return [[self mcs_rotate:-number] mcs_take:([self count] - number)];
}

- (NSArray *)mcs_skipWhile:(BOOL (^)(id))block
{
  NSUInteger index = [self indexOfObjectPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
    
    return !block(obj);
    
  }];
  
  if (index == NSNotFound) {
    return [NSArray array];
  }
  
  return [[self mcs_rotate:-index] mcs_take:([self count] - index)];
}

- (NSArray *)mcs_where:(BOOL (^)(id))block
{
  NSMutableArray *resultArray = [NSMutableArray array];
  
  [self mcs_each:^(id object) {
    
    if (block(object)) {
      [resultArray addObject:object];
    }
    
  }];
  
  return [NSArray arrayWithArray:resultArray];
}

- (NSArray *)mcs_unique
{
  return [self mcs_unique:^BOOL(id object1, id object2) {
    return [object1 isEqual:object2];
  }];
}

- (NSArray *)mcs_unique:(BOOL (^)(id, id))block
{
  NSMutableArray *resultArray = [NSMutableArray array];
  
  [self mcs_each:^(id object) {
    
    BOOL unique =
    ![resultArray mcs_any:^BOOL(id objectAlreadyContained) {
      return block(object, objectAlreadyContained);
    }];
    
    if (unique) {
      [resultArray addObject:object];
    }
    
  }];
  
  return [NSArray arrayWithArray:resultArray];
}

- (NSArray *)mcs_union:(NSArray *)array
{
  return [self mcs_union:array comparator:^BOOL(id object1, id object2) {
    return [object1 isEqual:object2];
  }];
}

- (NSArray *)mcs_union:(NSArray *)array comparator:(BOOL (^)(id, id))block
{
  NSMutableArray *resultArray = [NSMutableArray arrayWithArray:self];
  
  [array mcs_each:^(id objectToAdd) {
    
    BOOL unique = ![resultArray mcs_any:^BOOL(id object) {
      return block(objectToAdd, object);
    }];
    
    if (unique) {
      [resultArray addObject:objectToAdd];
    }
    
  }];
  
  return [NSArray arrayWithArray:resultArray];
}

- (NSArray *)mcs_select:(id (^)(id))block
{
  NSMutableArray *resultArray = [NSMutableArray array];
  
  [self mcs_each:^(id object) {
    
    id returnedObject = block(object);
    if (returnedObject) {
      [resultArray addObject:object];
    }
    
  }];
  
  return [NSArray arrayWithArray:resultArray];
}

- (NSArray *)mcs_selectMany:(NSArray *(^)(id))block
{
  NSMutableArray *resultArray = [NSMutableArray array];
  
  [self mcs_each:^(id object) {
    
    [resultArray addObjectsFromArray:block(object)];
    
  }];
  
  return [NSArray arrayWithArray:resultArray];
}

- (NSArray *)mcs_map:(id (^)(id))block
{
  NSMutableArray *resultArray = [NSMutableArray array];
  
  [self mcs_each:^(id object) {
    
    [resultArray addObject:object];
    
  }];
  
  return [NSArray arrayWithArray:resultArray];
}

- (void)mcs_each:(void (^)(id))block
{
  [self mcs_eachWithIndex:^(id object, NSUInteger index) {
    
    block(object);
    
  }];
}

- (void)mcs_eachWithIndex:(void (^)(id, NSUInteger))block
{
  NSUInteger index = 0;
  
  for (id object in self) {
    
    block(object, index);
    index++;
    
  }
}

- (NSInteger)mcs_count:(BOOL (^)(id))block
{
  return [[self mcs_where:block] count];
}

- (NSInteger)mcs_minInteger:(NSInteger (^)(id))block
{
  __block NSInteger min = NSIntegerMax;
  
  [self mcs_each:^(id object) {
    
    min = MIN(min, block(object));
    
  }];
  
  return min;
}

- (CGFloat)mcs_minFloat:(CGFloat (^)(id))block
{
  __block CGFloat min = CGFLOAT_MAX;
  
  [self mcs_each:^(id object) {
    
    min = MIN(min, block(object));
    
  }];
  
  return min;
}

- (NSInteger)mcs_maxInteger:(NSInteger (^)(id))block
{
  __block NSInteger max = NSIntegerMin;
  
  [self mcs_each:^(id object) {
    
    max = MAX(block(object), max);
    
  }];
  
  return max;
}

- (CGFloat)mcs_maxFloat:(CGFloat (^)(id))block
{
  __block CGFloat max = CGFLOAT_MIN;
  
  [self mcs_each:^(id object) {
    
    max = MAX(block(object), max);
    
  }];
  
  return max;
}

- (NSInteger)mcs_sumInteger:(NSInteger (^)(id))block
{
  __block NSInteger sum = 0;
  
  [self mcs_each:^(id object) {
    
    sum += block(object);
    
  }];
  
  return sum;
}

- (CGFloat)mcs_sumFloat:(CGFloat (^)(id))block
{
  __block CGFloat sum = 0;
  
  [self mcs_each:^(id object) {
    
    sum += block(object);
    
  }];
  
  return sum;
}

- (NSInteger)mcs_averageInteger:(NSInteger (^)(id))block
{
  return [self mcs_hasAnyElement] ? [self mcs_sumInteger:block]/[self count] : 0;
}

- (CGFloat)mcs_averageFloat:(CGFloat (^)(id))block
{
  return [self mcs_hasAnyElement] ? [self mcs_sumFloat:block]/[self count] : 0.0;
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

- (NSArray *)mcs_reverse
{
  return [[[self reverseObjectEnumerator] allObjects] copy];
}

- (BOOL)mcs_hasAnyElement
{
  return [self count] > 0;
}

- (id)mcs_sample
{
  return [self mcs_hasAnyElement] ? self[arc4random_uniform((u_int32_t)[self count])] : nil;
}

- (NSArray *)mcs_rotate:(NSInteger)shift
{
  shift = shift % (NSInteger)[self count];
  shift = shift < 0 ? shift + (NSInteger)[self count] : shift;
  
  if (shift == 0) {
    return [self copy];
  }
  
  NSRange leftRange = NSMakeRange([self count] - shift, shift);
  NSRange rightRange = NSMakeRange(0, [self count] - shift);
  
  NSArray *leftArray = [self subarrayWithRange:leftRange];
  NSArray *rightArray = [self subarrayWithRange:rightRange];
  
  return [leftArray arrayByAddingObjectsFromArray:rightArray];
}


- (id)mcs_first:(id (^)(id))block
{
  id resultObject;
  
  for (id object in self) {
    if (block(object)) {
      resultObject = object;
      break;
    }
  }
  
  return resultObject;
}

- (id)mcs_last:(id (^)(id))block
{
  id resultObject;
  
  for (id object in [self reverseObjectEnumerator]) {
    if (block(object)) {
      resultObject = object;
      break;
    }
  }
  
  return resultObject;
}

#pragma mark - Sorting

- (NSArray *)mcs_sort
{
  return [self sortedArrayUsingSelector:@selector(compare:)];
}

- (NSArray *)mcs_sortInDescendingOrder
{
  return [[self mcs_sort] mcs_reverse];
}

@end