//Solution for Min-Max Sum on HackerRank: https://www.hackerrank.com/challenges/mini-max-sum
#import <Foundation/Foundation.h>

@interface Solver : NSObject
+ (void)findSolutionForInput:(NSArray<NSNumber *> *)input;
@end

@implementation Solver
+ (void)findSolutionForInput:(NSArray<NSNumber *> *)input
{
  NSArray<NSNumber *> *sortedNumbers = [input sortedArrayUsingComparator:^NSComparisonResult(NSNumber *num1, NSNumber *num2) {
    return [num1 compare:num2];
  }];
  
  NSInteger min = 0;
  NSInteger max = 0;
  
  NSInteger rightIndex = sortedNumbers.count - 1;
  
  for (int leftIndex = 0; leftIndex < 4; leftIndex++) {
    min += sortedNumbers[leftIndex].integerValue;
    max += sortedNumbers[rightIndex].integerValue;
    rightIndex--;
  }
  
  NSString *solution = [NSString stringWithFormat:@"%ld %ld", min, max];
  printf("%s", [solution UTF8String]);
}
@end


int main(int argc, const char * argv[]){
  @autoreleasepool
  {
    int a0;
    int a1;
    int a2;
    int a3;
    int a4;
    scanf("%i %i %i %i %i",&a0,&a1,&a2,&a3,&a4);
    
    NSArray<NSNumber *> *input = @[@(a0), @(a1), @(a2), @(a3), @(a4)];
    [Solver findSolutionForInput:input];
  }
  return 0;
}