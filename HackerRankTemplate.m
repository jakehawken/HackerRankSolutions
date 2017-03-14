//Solution for "Diagonal Difference" on Hacker Rank: https://www.hackerrank.com/challenges/diagonal-difference
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]){
  @autoreleasepool
  {
    int n;
      scanf("%i",&n);
      int a[n][n];
      for(int a_i = 0; a_i < n; a_i++){
         for(int a_j = 0; a_j < n; a_j++){
          scanf("%d",&a[a_i][a_j]);
         }
      }
      
      int primary = 0;
      int secondary = 0;
      
      int lc = 0;
      int rc = n-1;
      int row = 0;
      
      while (lc < n) {
        primary += a[row][lc];
        secondary += a[row][rc];
        
        lc++;
        rc--;
        row++;
      }
      
      printf("%i", abs(secondary - primary));
  }
  return 0;
}
