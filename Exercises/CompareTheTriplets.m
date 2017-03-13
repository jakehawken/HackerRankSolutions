#import <Foundation/Foundation.h>

struct Problem {
  NSInteger clarity; 
  NSInteger originality; 
  NSInteger difficulty;
};

@interface Solver : NSObject
- (void)findSolutionForProblem1:(struct Problem)problem1 problem2:(struct Problem)problem2;
@end

@implementation Solver
- (void)findSolutionForProblem1:(struct Problem)problem1 problem2:(struct Problem)problem2
{
  NSInteger points1 = 0;
  NSInteger points2 = 0;
  
  if (problem1.clarity > problem2.clarity) {
    points1++;
  }
  else if (problem1.clarity < problem2.clarity) {
    points2++;
  }
  
  if (problem1.originality > problem2.originality) {
    points1++;
  }
  else if (problem1.originality < problem2.originality) {
    points2++;
  }
  
  if (problem1.difficulty > problem2.difficulty) {
    points1++;
  }
  else if (problem1.difficulty < problem2.difficulty) {
    points2++;
  }
  
  NSString *solution = [NSString stringWithFormat:@"%ld %ld", points1, points2];
  printf("%s", [solution UTF8String]);
}
@end


int main(int argc, const char * argv[])
{
  @autoreleasepool
  {
    int a0;
    int a1;
    int a2;
    scanf("%i %i %i",&a0,&a1,&a2);
    
    struct Problem problem1;
    problem1.clarity = a0;
    problem1.originality = a1;
    problem1.difficulty = a2;
    
    int b0;
    int b1;
    int b2;
    scanf("%i %i %i",&b0,&b1,&b2);
    
    struct Problem problem2;
    problem2.clarity = b0;
    problem2.originality = b1;
    problem2.difficulty = b2;
    
    Solver *solver = [Solver new];
    [solver findSolutionForProblem1:problem1 problem2:problem2];
  }
  return 0;
}


