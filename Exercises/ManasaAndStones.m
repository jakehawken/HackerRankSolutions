//Solution for Manasa And Stones: https://www.hackerrank.com/challenges/manasa-and-stones
#import <Foundation/Foundation.h>

@interface StoneCase : NSObject
@property (nonatomic, assign) NSInteger totalStones;
@property (nonatomic, assign) NSInteger differenceA;
@property (nonatomic, assign) NSInteger differenceB;
@end

@implementation StoneCase
- (instancetype)init {
  return [super init];
}
@end

@interface Solver : NSObject
+ (void)findAndPrintSolutionForInput:(NSMutableArray<StoneCase *> *)input;
@end

@implementation Solver
+ (void)findAndPrintSolutionForInput:(NSMutableArray<StoneCase *> *)input
{
  for (StoneCase *stoneCase in input) {
    NSInteger stepsToCalculate = stoneCase.totalStones - 1;
    NSInteger occurencesOfFirstNumber  = stepsToCalculate;
    NSInteger occurencesOfSecondNumber = 0;
    NSInteger smallerInteger = stoneCase.differenceA < stoneCase.differenceB ? stoneCase.differenceA : stoneCase.differenceB;
    NSInteger biggerInteger  = stoneCase.differenceA < stoneCase.differenceB ? stoneCase.differenceB : stoneCase.differenceA;
    
    NSMutableArray<NSNumber*> *solutions = [NSMutableArray array];

    while (occurencesOfFirstNumber >= 0 && occurencesOfSecondNumber <= stepsToCalculate) {
      NSInteger solutionToPrint = 0;
      
      solutionToPrint += smallerInteger * occurencesOfFirstNumber;
      solutionToPrint += biggerInteger * occurencesOfSecondNumber;
      
      NSNumber *solutionNumber = [NSNumber numberWithInteger:solutionToPrint];
      
      if (![solutions containsObject:solutionNumber]) {
        [solutions addObject:solutionNumber];
      }
      
      occurencesOfFirstNumber--;
      occurencesOfSecondNumber++;
    }
  
    for (int i = 0; i < solutions.count; i++)
    {
      printf("%ld ", [solutions[i] integerValue]);
    }
    printf("\n");
  }
}
@end


int main(int argc, const char * argv[]){
  @autoreleasepool
  {
    int testCases;
    scanf("%i", &testCases);
    
    NSMutableArray<StoneCase *> *input = [NSMutableArray array];
    
    for (int i = 0; i < testCases; i++) {
      int totalStones;
      scanf("%i", &totalStones);
      
      int diffA;
      scanf("%i", &diffA);
      
      int diffB;
      scanf("%i", &diffB);
      
      StoneCase *stoneCase = [[StoneCase alloc] init];
      stoneCase.totalStones = (NSInteger)totalStones;
      stoneCase.differenceA = (NSInteger)diffA;
      stoneCase.differenceB = (NSInteger)diffB;
      
      [input addObject:stoneCase];
    }
    [Solver findAndPrintSolutionForInput:input];
  }
  return 0;
}