//Solution for LibraryFine: https://www.hackerrank.com/challenges/library-fine
#import <Foundation/Foundation.h>

typedef struct {
  NSInteger year;
  NSInteger month;
  NSInteger day;
} SimpleDate;

SimpleDate SimpleDateMake(NSInteger year, NSInteger month, NSInteger day)
{
  SimpleDate date;
  date.year = year;
  date.month = month;
  date.day = day;
  return date;
}

int main(int argc, const char * argv[]){
  @autoreleasepool
  {
    int d1;
    int m1;
    int y1;
    scanf("%i %i %i",&d1,&m1,&y1);
    SimpleDate actual = SimpleDateMake(y1, m1, d1);
    
    int d2;
    int m2;
    int y2;
    scanf("%i %i %i",&d2,&m2,&y2);
    SimpleDate expected = SimpleDateMake(y2, m2, d2);
    
    if (actual.year < expected.year || (actual.year == expected.year && actual.month < expected.month) || (actual.year == expected.year && actual.month == expected.month && actual.day <= expected.day))
    {
      printf("0\n");
    }
    else
    {
      if (actual.year > expected.year)
      {
        printf("10000\n");
      }
      else
      {
        NSInteger baseFine = 0;
        NSInteger multiplier = 0;
        if (actual.month > expected.month)
        {
          baseFine = 500;
          multiplier = actual.month - expected.month;
        }
        else if (actual.day > expected.day)
        {
          baseFine = 15;
          multiplier = actual.day - expected.day;
        }
        printf("%ld\n", baseFine * multiplier);
      }
    }
  }
  return 0;
}