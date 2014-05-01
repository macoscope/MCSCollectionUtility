

##MCSCollectionUtility

Categories for `NSArray`, `NSSet` and `NSDictionary` which provide many methods which make operations on collection easier and cleaner. 

##Installation

To use MCSCollectionUtility in your app just drag 'Classes' folder to yout project and import 'MCSCollectionUtility.h' file.

    #import "MCSCollectionUtility.h"
    
####Podfile

    pod "MCSCollectionUtility", "~> 1.0.0" 
    
##Examples

As there are o lot of methods available in created categories these examples provide only small portion of it. More effort was put in creation of the documentation which is available below the examples (section Documentation).


Check how many elements of the array contains strings which contain letter 'a'.

    NSArray *elements = @[@"Warsaw", @"Berlin", @"London", @"New York", @"Paris"];
   
    NSInteger count = [elements mcs_count:^BOOL(NSString *object) {
    	return [object rangeOfString:@"a"].location != NSNotFound;
    }];
    
    //result 2
    
    
Take the elements of the array as long as they are smaller than 10. Stop when first element doesn't fullfil this condition.
    
	NSArray *elements = @[@"1", @"5", @"7", @"10", @"16", @"8"];
	
	NSArray *newElementsArray = [elements mcs_takeWhile:^BOOL(NSNumber *object) {
		return [object integerValue] < 10;
	}];
	
	//result @[@"1", @"5", @"7"]


Create array with only one representation of the each element.

	NSArray *elements = @[@"1", @"2", @"3", @"1", @"4"];
	
	NSArray *newElementsArray = [elements mcs_unique]; 

	//result @["1", @"2", @"3", @"4"];
	

 
 
##Documentation

These paragraph provide documentation for methods available in categories contained in MCSCollectionUtility. 

####NSArray

    - (NSArray *)mcs_skip:(NSInteger)number;
    
Bypasses specified number of elements of the receiving array and return a new array containing remaining elements. It does not crash when *number* is greater than number of elements in receiving array.
    
    - (NSArray *)mcs_skipWhile:(BOOL(^)(id object))block;
    
Bypasses elements in the receiving array as long as value obtained by evaluation of the specified block is equal to `YES` and returns a new array containing remaining elements.

    - (NSArray *)mcs_take:(NSInteger)number;

Returns a new array containing specified number of contiguous elements from the start of the receiving array.

    - (NSArray *)mcs_takeWhile:(BOOL(^)(id object))block;
    
Returns a new array containing elements from the start of the receiving array for which value returned by evaluation of the specified block is equal to `YES`. Stops adding object to the result array when evaluation of the specified block returns value equal to `NO`.


    - (NSArray *)mcs_where:(BOOL(^)(id object))block;
    
Returns a new array containing elements of the received array for which specified block returned value equal to `YES`.


	- (NSArray *)mcs_union:(NSArray *)array;
	
Returns a new array with elements representing the union of the rececing array and *array* passed as argument using `compare:` selector;

    - (NSArray *)mcs_union:(NSArray *)array comparator:(BOOL(^)(id object1, id object2))block;

Returns a new array with elements representing the union of the receiving array and *array* passed as argument using specified block to compare two objects.

    - (NSArray *)mcs_unique;
    
Returns a new array with unique elements of the receiving array. Equality of the elements is determined using `isEqual:` selector.

    - (NSArray *)mcs_unique:(BOOL(^)(id obj1, id obj2));
    
Returns a new array with unique elements of the receiving array. Equality of the elements is determined using specified block.
 	
 
    - (NSArray *)mcs_select:(id(^)(id object))block;

Returns a new array with elements with are projection of the elements of the receiving array. Each elements of the receiving array is projected into object or *nil* using specified block.


    - (NSArray *)mcs_selectMany:(NSArray *(^)(id object))block;

Returns a new array with elements which are projection of the elements of the receiving array. Each element of the receiving array is projected into array of objects or *nil* using specified block. Flattens the resulting sequences into one which is returned by function.

 
    - (NSArray *)mcs_map:(id(^)(id object))block;

Returns a new array with elements with are projection of the elements of the receiving array. Each element of the receiving array is projected into exactly one object using specified block.


    - (void)mcs_each:(void(^)(id object))block;

Enumerates through elements of the receiving array and evaluates specified block for each of them. 


    - (void)mcs_eachWithIndex:(void(^)(id object, NSUinteger index))block;
    
Enumerates through elements of the receiving array and evaluates specified block for each of them providing additional information about the index of the currently evaluated *object*.


    - (NSInteger)mcs_count:(BOOL(^)(id object))block;

Returns number of elements of the receiving array for which evaluation of the specified block returns value equal to *YES*.


    - (NSInteger)mcs_minInteger:(NSInteger(^)(id object))block;

Returns a minimal *NSInteger* value from the values received as the result of transformations of the elements of the receiving array using specified block.


    - (CGFloat)mcs_minFloat:(CGFloat(^)(id object))block;

Returns a minimal *CGFloat* value from the values received as the result of transformations of the elements of the receiving array using specified block.


    - (NSInteger)mcs_maxInteger:(NSInteger(^)(id object))block;
    
 Returns a maximal *NSInteger* value from the values received as the result of transformations of the elements of the receiving array using specified block.
 
    - (CGFloat)mcs_maxFloat:(CGFloat(^)(id object))block;
    
Returns a maximal *CGFloat* value from the values received as the result of transformations of the elements of the receiving array using specified block.

    - (NSInteger)mcs_sumInteger:(NSInteger(^)(id object))block;

Returns a sum of the *NSInteger* values received as the result of transformations of the elements of the receiving array using specified block.

    - (CGFloat)mcs_sumFloat:(CGFloat(^)(id object))block;

Returns a sum of the *CGFloat* values received as the result of transformations of the elements of the receiving array using specified block.

    - (NSInteger)mcs_averageInteger:(NSInteger(^)(id object))block;

Returns an average *NSInteger* value received as the result of transformations of the elements of the receiving array using specified block.

    - (CGFloat)mcs_averageFloat:(CGFloat(^)(id object))block;

Returns an average *CGFloat* value received as the result of transformations of the elements of the receiving array using specified block.


    - (id)mcs_first:(BOOL(^)(id object))block;

Returns the first object of the receiving array for which evaluation of the specified block returns value equal to *YES*.

    - (id)mcs_last:(BOOL(^)(id object))block;
    
Returns the last object of the receiving array for which evaluation of the specified block returns value equal to *YES*.

    - (BOOL)mcs_single:(BOOL(^)(id object))block;

Returns *YES* when evaluation of the specified block returns value equal to *YES* for exactly one element of the receiving array.

    - (BOOL)mcs_any:(BOOL(^)(id object))block;

Returns *YES* when evaluation of the specified block returns value equal to *YES* for at least one element of the receiving array.

    - (BOOL)mcs_all:(BOOL(^)(id object))block;
    
Returns *YES* when evaluation of the specified block returns value equal to *YES* for all elements of the receiving array.

    - (NSArray *)mcs_reverse;

Returns a new array containing elements of the receiving array in reversed order.

    - (BOOL)mcs_hasAnyElement
    
Returns *YES* when there is at least one element in the receiving array, returns *NO* otherwise.

    - (id)mcs_sample;
    
Returns one random object from the receiving array;

    - (NSArray *)mcs_sample:(NSInteger)count;
    
Returns a new array containing *count* random objects of thje receiving array;

    - (NSArray *)mcs_rotate:(NSInteger)count;
    
Returns a new array which elements rotated by *count*. When *count* is greater than *0* indexes of the elements are increased by *count* and when count is less than *0* indexes of elements are decreased by *count*. Array is treated as circle array.

	- (NSArray *)mcs_sort;
	
Returns a new array which elements of the receiving array sorted using `compare:` selector.
	
	- (NSArray *)mcs_sortInDescendingOrder;
	
Returns a new array which elements of the receiving array sorted in descending order using `compare:` selector.



##NSDictionary 

    - (void)mcs_each:(void(^)(id <NSCopying> key, id object))block;
    
Enumerates through elements of the receiving dictionary and evaluates specified block for each pair key-value contained in it. 

    - (NSDictionary *)mcs_where:(BOOL(^)(id <NSCopying> key, id object))block;

Returns a new dictionary containing key-value pairs of the received dictionary for which specified block returned value equal to `YES`.

    - (NSArray *)mcs_sortedKeys;
    
Returns a new array containing keys of the receiving dictionary ordered using *compare:* selector.

	- (NSArray *)mcs_sortedKeysArray:(NSComparisonResult(^)(id <NSCopying> key1, id <NSCopying> key2))block;
    
Returns a new array containing keys of the receiving dictionary ordered using specified block. 
    
    - (NSArrat *)mcs_sortedValuesArray;
    
Returns a new array containing values of the receiving dictionary ordered using *compare:* selector.
    
    - (NSArray *)mcs_sortedValuesArray:(NSComparator)block;
    
Returns a new array containing values of the receiving dictionary ordered using specified block;

    - (NSInteger)mcs_count:(BOOL(^)(id <NSCopying> key, id object))block;

Returns number of key-value pairs of the receiving dictionary for which evaluation of the specified block returns value equal to *YES*.

    - (NSInteger)mcs_minInteger:(NSInteger(^)(id <NSCopying> key, id object))block;

Returns a minimal *NSInteger* value from the values received as the result of transformations of the key-value pairs of the receiving dictionary using specified block.

    - (CGFloat)mcs_minFloat:(CGFloat(^)(id <NSCopying> key, id object))block;

Returns a minimal *CGFloat* value from the values received as the result of transformations of the key-value pairs of the receiving dictionary using specified block.

    - (NSInteger)mcs_maxInteger:(NSInteger(^)(id <NSCopying> key, id object))block;

 Returns a maximal *NSInteger* value from the values received as the result of transformations of the key-value pairs of the receiving dictionary using specified block.

	- (CGFloat)mcs_maxFloat:(CGFloat(^)(id <NSCopying> key, id object))block;

Returns a minimal *CGFloat* value from the values received as the result of transformations of the key-values of the receiving dictionary using specified block.

	- (NSInteger)mcs_sumInteger:(NSInteger(^)(id <NSCopying> key, id object))block;

Returns a sum of the *NSInteger* values received as the result of transformations of the key-value pairs of the receiving dictionary using specified block.

	- (CGFloat)mcs_sumFloat:(CGFloat(^)(id <NSCopying> key, id object))block;
	
Returns a sum of the *CGFloat* values received as the result of transformations of the key-value pairs of the receiving dictionary using specified block.

	- (NSInteger)mcs_averageInteger:(NSInteger(^)(id <NSCopying> key, id object))block;

Returns an average *NSInteger* value received as the result of transformations of the key-value pairs of the receiving dictionary using specified block.

	- (CGFloat)mcs_averageFloat:(CGFloat(^)(id <NSCopying> key, id object))block;

Returns an average *CGFloat* value received as the result of transformations of the key-value pairs of the receiving dictionary using specified block.

	- (BOOL)mcs_single:(BOOL(^)(id <NSCopying> key, id object))block;

Returns *YES* when evaluation of the specified block returns value equal to *YES* for exactly one key-value pair of the receiving dictionary.

    - (BOOL)mcs_any:(BOOL(^)(id <NSCopying> key, id object))block;

Returns *YES* when evaluation of the specified block returns value equal to *YES* for at least one key-value pair of the receiving dictionary.

    - (BOOL)mcs_all:(BOOL(^)(id <NSCopying> key, id object))block;

Returns *YES* when evaluation of the specified block returns value equal to *YES* for all key-value pairs of the receiving dictionary.

    - (BOOL)mcs_hasAnyElement;
    
Returns *YES* when there is at least one key-value pair in the receiving dictionary, returns *NO* otherwise.



##NSSet

`NSSet` operations set is pretty much a subset of the operations available for `NSArray`. Because of the fact `NSSet`doesn't keeps his its elements in any specified order there are no methods which are dependent on the order of collection's elements.

     - (void)mcs_each:(void(^)(id object))block;

Enumerates through elements of the receiving set and evaluates specified block for each of them. 

    - (NSArray *)mcs_sort:(NSComparator)block;
    
Returns a new array containing elements of the receiving set ordered using specified block.

    - (NSSet *)mcs_where:(BOOL(^)(id object))block;

Returns a new set containing elements of the received array for which specified block returned value equal to `YES`.

     - (NSSet *)mcs_union:(NSSet *)set;

Returns a new set with elements representing the union of the rececing array and *set* passed as argument using `compare:` selector;

     - (NSSet *)mcs_union:(NSSet *)set comparator:(BOOL(^)(id obj1, id obj2))block;

Returns a new set with elements representing the union of the receiving set and *set* passed as argument using specified block to compare two objects.

    - (NSSet *)mcs_unique;

Returns a new set with unique elements of the receiving set. Equality of the elements is determined using `isEqual:` selector.

     - (NSSet *)mcs_unique:(BOOL(^)(id obj1, id obj2))block;

Returns a new set with unique elements of the receiving set. Equality of the elements is determined using specified block.

	 - (NSSet *)mcs_select:(id(^)(id object))block;

Returns a new set with elements with are projection of the elements of the receiving set. Each elements of the receiving set is projected into object or *nil* using specified block.

     - (NSSet *)mcs_selectMany:(NSArray *(^)(id object))block;

Returns a new set with elements which are projection of the elements of the receiving set. Each element of the receiving set is projected into set of objects or *nil* using specified block. Flattens the resulting sequences into one which is returned by function.

    - (NSSet *)mcs_map:(id(^)(id object))block;

Returns a new set with elements with are projection of the elements of the receiving set. Each element of the receiving set is projected into exactly one object using specified block.


     - (NSInteger)mcs_count:(BOOL(^)(id object))block;

Returns number of elements of the receiving set for which evaluation of the specified block returns value equal to *YES*.


     - (NSInteger)mcs_minInteger:(NSInteger(^)(id object))block;

Returns a minimal *NSinteger* value from the values received as the result of transformations of the elements of the receiving set using specified block.

    - (CGFloat)mcs_minFloat:(CGFloat(^)(id object))block;

Returns a minimal *CGFloat* value from the values received as the result of transformations of the elements of the receiving set using specified block.


     - (NSInteger)mcs_maxInteger:(NSInteger(^)(id object))block;

 Returns a maximal *NSInteter* value from the values received as the result of transformations of the elements of the receiving set using specified block.
 
     - (CGFloat)mcs_maxFloat:(CGFloat(^)(id object))block;

Returns a maximal *CGFloat* value from the values received as the result of transformations of the elements of the receiving set using specified block.


	 - (NSInteger)mcs_sumInteger:(NSInteger(^)(id object))block;

Returns a sum of the *NSInteger* values received as the result of transformations of the elements of the receiving array using specified block.

	- (CGFloat)mcs_sumFloat:(CGFloat(^)(id object))block;

Returns a sum of the *CGFloat* values received as the result of transformations of the elements of the receiving set using specified block.

	- (NSInteger)mcs_averageInteger:(NSInteger(^)(id object))block;

Returns an average *NSInteger* value received as the result of transformations of the elements of the receiving set using specified block.

     - (CGFloat)mcs_averageFloat:(CGFloat(^)(id object))block;

Returns an average *CGFloat* value received as the result of transformations of the elements of the receiving set using specified block.

	- (BOOL)mcs_single:(BOOL(^)(id object))block;

Returns *YES* when evaluation of the specified block returns value equal to *YES* for exactly one element of the receiving set.

	- (BOOL)mcs_any:(BOOL(^)(id object))block;

Returns *YES* when evaluation of the specified block returns value equal to *YES* for at least one element of the receiving set.

	- (BOOL)mcs_all:(BOOL(^)(id object))block;

Returns *YES* when evaluation of the specified block returns value equal to *YES* for all elements of the receiving set.

	- (BOOL)mcs_hasAnyElement;

Returns *YES* when there is at least one element in the receiving set, returns *NO* otherwise.

	- (NSSet *)mcs_sample;

Returns one random object from the receiving set.




## Contact

[Macoscope](http://macoscope.com)

## License

Copyright 2013 Macoscope, sp z o.o.

Licensed under the Apache License, Version 2.0 (the "License"); you may not use
this file except in compliance with the License. You may obtain a copy of the
License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed
under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
CONDITIONS OF ANY KIND, either express or implied. See the License for the
specific language governing permissions and limitations under the License.

