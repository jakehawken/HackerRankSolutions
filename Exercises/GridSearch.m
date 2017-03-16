//Solution for The Grid Search: https://www.hackerrank.com/challenges/the-grid-search
#import <Foundation/Foundation.h>

@interface GridPair : NSObject
@property (nonatomic, strong, readonly) NSArray<NSString *> *parent;
@property (nonatomic, strong, readonly) NSArray<NSString *> *child;
- (instancetype)initWithParentGrid:(NSArray<NSString *> *)parentGrid childGrid:(NSArray<NSString *> *)childGrid;
@end

@implementation GridPair
- (instancetype)initWithParentGrid:(NSArray<NSString *> *)parentGrid childGrid:(NSArray<NSString *> *)childGrid {
  self = [super init];
  if (self) {
    _parent = parentGrid;
    _child = childGrid;
  }
  return self;
}
@end


@interface Solver : NSObject
+ (void)findAndPrintSolutionForInput:(NSArray<GridPair *>*)input;
@end

@implementation Solver

+ (void)findAndPrintSolutionForInput:(NSArray<GridPair *>*)input
{
  for (GridPair *pair in input) {
    if ([self gridPairParentContainsChild:pair]) {
      printf("YES\n");
    }
    else {
      printf("NO\n");
    }
  }
}

+ (BOOL)gridPairParentContainsChild:(GridPair *)gridPair {
  for (NSInteger i = 0; i <= gridPair.parent.count - gridPair.child.count; i++) {
    NSArray<NSValue *> *ranges = [self rangesOfSubstringsWithParentString:gridPair.parent[i] searchedString:gridPair.child.firstObject];
    if (ranges.count > 0) {
      for (NSValue *value in ranges) {
        NSRange range = [value rangeValue];
        NSInteger parentIndex = i+1;
        BOOL patternFound = YES;
        for (NSInteger j = 1; j < gridPair.child.count; j++) {
          NSString *parentRowSubstring = [gridPair.parent[parentIndex] substringWithRange:range];
          NSString *childRow = gridPair.child[j];
          if (![parentRowSubstring isEqualToString:childRow]) {
            patternFound = NO;
            break;
          }
          parentIndex++;
        }
        if (patternFound) {
          return YES;
        }
      }
    } 
  }
  return NO;
}

+ (NSArray<NSValue *> *)rangesOfSubstringsWithParentString:(NSString *)parentString searchedString:(NSString *)searchedString {
  NSMutableArray<NSValue *> *ranges = [NSMutableArray array];
  
  NSRange currentRange = [parentString rangeOfString:searchedString];
  if (currentRange.location == NSNotFound) {
    return ranges;
  }
  [ranges addObject:[NSValue valueWithRange:currentRange]];
  currentRange.location++;
  
  while (currentRange.location <= parentString.length - searchedString.length) {
    NSString *stringAtRange = [parentString substringWithRange:currentRange];
    if ([stringAtRange isEqualToString:searchedString]) {
      [ranges addObject:[NSValue valueWithRange:currentRange]];
    }
    currentRange.location++;
  }
  
  return ranges;
}
@end


int main(int argc, const char * argv[]){
  @autoreleasepool
  {
    int t;
    scanf("%i",&t);
    NSMutableArray<GridPair *> *testCases = [NSMutableArray arrayWithCapacity:t];
    
    for(int a0 = 0; a0 < t; a0++) {
        int parentGridRows;
        int parentGridColumns;
        scanf("%i %i",&parentGridRows,&parentGridColumns);
        
        NSMutableArray<NSString *> *parentGrid = [NSMutableArray array];
        for(int i = 0; i < parentGridRows; i++) {
           char* tempString = (char *)malloc(parentGridColumns * sizeof(char));
           scanf("%s",tempString);
           [parentGrid addObject:[NSString stringWithFormat:@"%s", tempString]];
        }
        
        int childGridRows;
        int childGridColumns;
        scanf("%i %i",&childGridRows,&childGridColumns);
        NSMutableArray<NSString *> *childGrid = [NSMutableArray array];;
        for(int i = 0; i < childGridRows; i++){
           char* tempString = (char *)malloc(childGridColumns * sizeof(char));
           scanf("%s",tempString);
           [childGrid addObject:[NSString stringWithFormat:@"%s", tempString]];
        }
        GridPair *gridPair = [[GridPair alloc] initWithParentGrid:parentGrid childGrid:childGrid];
        [testCases addObject:gridPair];
    }
    
    [Solver findAndPrintSolutionForInput:testCases];
  }
  return 0;
}