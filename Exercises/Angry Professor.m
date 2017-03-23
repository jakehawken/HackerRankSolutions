//Solution for Angry Professor: https://www.hackerrank.com/challenges/angry-professor
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]){
  @autoreleasepool
  {
    int testCases;
    scanf("%i",&testCases);
    
    NSMutableArray<NSString *> *solutions = [NSMutableArray array];
    
    for(int i = 0; i < testCases; i++){
        int studentsInClass;
        int cancellationThreshold;
        scanf("%i %i",&studentsInClass,&cancellationThreshold);
        
        int studentsOnTime = 0;
        for(int j = 0; j < studentsInClass; j++){
          int arrivalTime;
          scanf("%d",&arrivalTime);
          if (arrivalTime <= 0) {
            studentsOnTime++;
          }
        }
        
        NSString *solutionString = (studentsOnTime < cancellationThreshold) ? @"YES" : @"NO";
        [solutions addObject:solutionString];
    }
    
    for (NSString *solution in solutions) {
      printf("%s\n", [solution UTF8String]);
    }
  }
  return 0;
}