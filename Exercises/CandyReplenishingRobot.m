//Solution for Candy Replenishing Robot on Hacker Rank: https://www.hackerrank.com/contests/w30/challenges/candy-replenishing-robot
#import <Foundation/Foundation.h>

@interface Solver : NSObject
+ (void)findSolutionForBowlSize:(NSInteger)bowlSize numberOfMinutes:(NSInteger)minutes candyGrabs:(NSArray<NSNumber *> *)candyGrabs;
@end

@implementation Solver
+ (void)findSolutionForBowlSize:(NSInteger)bowlSize numberOfMinutes:(NSInteger)minutes candyGrabs:(NSArray<NSNumber *> *)candyGrabs
{
  NSInteger numberOfCandies = bowlSize;
  NSInteger candiesAdded = 0;
  
  for (int i = 0; i < minutes - 1; i++) {
    NSInteger candyGrab = candyGrabs[i].integerValue;
    numberOfCandies -= candyGrab;
    
    if (numberOfCandies < 5) {
      NSInteger candiesToAdd = bowlSize - numberOfCandies;
      numberOfCandies += candiesToAdd;
      candiesAdded += candiesToAdd;
    }
  }
  
  NSString *solution = [NSString stringWithFormat:@"%ld", candiesAdded];
  printf("%s", [solution UTF8String]);
}
@end


int main(int argc, const char * argv[]){
  @autoreleasepool
  {
    int bowlMax; // "n"
    int partyLength; // "t"
    scanf("%i %i", &bowlMax, &partyLength);
    
    NSMutableArray<NSNumber *> *candyGrabs = [NSMutableArray array]; //"c(0)...c(t-1)"
    
    for (int i = 0; i < partyLength; i++) {
      int candyGrab;
      scanf("%i", &candyGrab);
      [candyGrabs addObject:@(candyGrab)];
    }
    
    [Solver findSolutionForBowlSize:(NSInteger)bowlMax numberOfMinutes:(NSInteger)partyLength candyGrabs:candyGrabs];
  }
  return 0;
}