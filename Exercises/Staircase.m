//Solution for Staircase on Hacker Rank: https://www.hackerrank.com/challenges/staircase
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]){
  @autoreleasepool
  {
    int n;
    scanf("%i",&n);
    
    NSMutableString *pyramid = [NSMutableString new];
    
    int spacesToAdd = n - 1;
    
    for (int i = 0; i < n; i++)
    {
      for (int j = 0; j < spacesToAdd; j++)
      {
        [pyramid appendString:@" "];
      }
      
      int poundsToAdd = n - spacesToAdd;
      for (int k = 0; k < poundsToAdd; k++)
      {
        [pyramid appendString:@"#"];
      }
      
      [pyramid appendString:@"\n"];
      spacesToAdd--;
    }
    
    printf("%s", pyramid.UTF8String);
    
  }
  return 0;
}