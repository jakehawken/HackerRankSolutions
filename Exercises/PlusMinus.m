//Solution for Plus Minus on Hacker Rank: https://www.hackerrank.com/challenges/plus-minus
#import <Foundation/Foundation.h>

int main(int argc, char *argv[]) {
  @autoreleasepool
  {
    int n;
    scanf("%i",&n);
    
    int positives = 0;
    int negatives = 0;
    int zeroes = 0;
    
    for(int i = 0; i < n; i++)
    {
      int nextNum;
      scanf("%d", &nextNum);
      
      if (nextNum > 0) {
        positives++;
      }
      if (nextNum < 0) {
        negatives++;
      }
      if (nextNum == 0) {
        zeroes++;
      }
    }
    
    double posFrac = (double)positives / (double)n;
    double negFrac = (double)negatives / (double)n;
    double zerFrac = (double)zeroes / (double)n;
    
    printf("%f\n", posFrac);
    printf("%f\n", negFrac);
    printf("%f\n", zerFrac);
  }
}