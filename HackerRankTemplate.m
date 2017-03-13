//Solution for <#Problem Name#> on Hacker Rank: <#URL#>
#import <Foundation/Foundation.h>

@interface Solver : NSObject
+ (void)findSolutionForInput:(NSArray*)input;
@end

@implementation Solver
+ (void)findSolutionForInput:(NSArray*)input
{
  
  
  NSString *solution = [NSString stringWithFormat:@"Solution!"];
  printf("%s", [solution UTF8String]);
}
@end


int main(int argc, const char * argv[]){
  @autoreleasepool
  {
    NSArray *input = @[];
    [Solver findSolutionForInput:input];
  }
  return 0;
}