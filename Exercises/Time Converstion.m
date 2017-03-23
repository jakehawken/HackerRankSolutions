//Solution for Time Conversion: https://www.hackerrank.com/challenges/time-conversion
#import <Foundation/Foundation.h>

@interface Solver : NSObject
+ (void)findAndPrintSolutionFor12HourTimeString:(NSString*)input;
@end

@implementation Solver
+ (void)findAndPrintSolutionFor12HourTimeString:(NSString*)input
{
  NSMutableArray<NSString *> *components = [input componentsSeparatedByString:@":"].mutableCopy;
  BOOL isATwelveHour = [components.firstObject isEqualToString:@"12"];
  BOOL isAM = [input containsString:@"AM"];
  
  if (isAM) {
    NSString *modifiedInput = input.copy;
    if (isATwelveHour) {
      components[0] = @"00";
      modifiedInput = [components componentsJoinedByString:@":"];
    }
    printf("%s", [[modifiedInput stringByReplacingOccurrencesOfString:@"AM" withString:@""] UTF8String]);
    return;
  }
  
  if (!isATwelveHour) {
    components[0] = @(components[0].intValue + 12).stringValue;
  }
  components[2] = [components[2] stringByReplacingOccurrencesOfString:@"PM" withString:@""];
  
  printf("%s", [[components componentsJoinedByString:@":"] UTF8String]);
}
@end


int main(int argc, const char * argv[]){
  @autoreleasepool
  {
    NSString* time;
    char* time_temp = (char *)malloc(10240 * sizeof(char));
    scanf("%s",time_temp);
    time = [NSString stringWithFormat:@"%s", time_temp];
    [Solver findAndPrintSolutionFor12HourTimeString:time];
  }
  return 0;
}