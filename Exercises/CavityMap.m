//Solution for Cavity Map: https://www.hackerrank.com/challenges/cavity-map
#import <Foundation/Foundation.h>

@interface Solver : NSObject
+ (void)findAndPrintSolutionForInput: (NSArray<NSString*>*)input;
@end

typedef struct {
  NSInteger x;
  NSInteger y;
} MatrixIndex;

MatrixIndex MatrixIndexMake(NSInteger x, NSInteger y) {
  MatrixIndex index;
  index.x = x;
  index.y = y;
  return index;
}

@interface Solver()
@end

@implementation Solver

+ (void)findAndPrintSolutionForInput: (NSArray<NSString*>*)input
{
  NSMutableArray* cavityMap = [input mutableCopy];
  
  MatrixIndex index = MatrixIndexMake(0, 0);
  
  for (int i = 0; i < cavityMap.count; i++)
  {
    index.y = i;
    for (int j = 0; j < cavityMap.count; j++)
    {
      index.x = j;
      if ([self point:index isCavityinMatrix:cavityMap])
      {
        NSString *currentRow = cavityMap[index.y];
        NSMutableString *newRow = [NSMutableString string];
        for (int i = 0; i < cavityMap.count; i++)
        {
          NSString *character;
          if (i == index.x)
          {
            character = @"X";
          }
          else
          {
            character = [currentRow substringWithRange:NSMakeRange(i, 1)];
          }
          [newRow appendString:character];
        }
        cavityMap[index.y] = newRow;
      }
    }
  }
  for (int i = 0; i < cavityMap.count; i++)
  {
    printf("%s\n", [cavityMap[i] UTF8String]);
  }
}

+ (BOOL)point: (MatrixIndex)point isCavityinMatrix: (NSArray<NSString*>*)matrix
{
  NSInteger digit = [[matrix[(int)point.y] substringWithRange:NSMakeRange(point.x, 1)] integerValue];
  MatrixIndex topNeighbor = MatrixIndexMake(point.x, point.y - 1);
  MatrixIndex bottomNeighbor = MatrixIndexMake(point.x, point.y + 1);
  MatrixIndex leftNeighbor = MatrixIndexMake(point.x - 1, point.y);
  MatrixIndex rightNeighbor = MatrixIndexMake(point.x + 1, point.y);
  
  if ([self itemAtPoint:topNeighbor inMatrix:matrix verifiesCaviticityOf:digit])
  {
    if ([self itemAtPoint:bottomNeighbor inMatrix:matrix verifiesCaviticityOf:digit])
    {
      if ([self itemAtPoint:leftNeighbor inMatrix:matrix verifiesCaviticityOf:digit])
      {
        if ([self itemAtPoint:rightNeighbor inMatrix:matrix verifiesCaviticityOf:digit])
        {
          return YES;
        }
      }
    }
  }
  return NO;
}

+ (BOOL)itemAtPoint: (MatrixIndex)point inMatrix: (NSArray<NSString*>*)matrix verifiesCaviticityOf: (NSInteger)possibleCavity
{
  if (point.y >= 0 && point.y < matrix.count && point.x >= 0 && point.x < matrix.count)
  {
    NSString *stringOfDigit = [matrix[point.y] substringWithRange:NSMakeRange(point.x, 1)];
    if ([stringOfDigit isEqualToString:@"X"]) {return NO;}
    NSInteger digit = [stringOfDigit integerValue];
    return digit < possibleCavity;
  }
  else return NO;
}

@end


int main(int argc, const char * argv[]){
  @autoreleasepool
  {
    int n;
    scanf("%i",&n);
    NSMutableArray<NSString*>* grid = [NSMutableArray array];
    for(int i = 0; i < n; i++){
       char* grid_temp = (char *)malloc(10240 * sizeof(char));
       scanf("%s",grid_temp);
       [grid addObject:[NSString stringWithFormat:@"%s", grid_temp]];
    }
    [Solver findAndPrintSolutionForInput:grid];
  }
  return 0;
}