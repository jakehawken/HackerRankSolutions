#import <Foundation/Foundation.h>

@interface Solver : NSObject
+ (void)findAndPrintSolutionForInput: (NSArray<NSString*>*)input;
@end

@implementation Solver

+ (void)findAndPrintSolutionForInput:(NSArray<NSString*> *)input
{
  int maxTopicsKnown = 0;
  int numberOfMaxFound = 0;
  
  for (int i = 0; i < input.count - 1; i++)
  {
    NSString *person1 = input[i];
    for (int j = i + 1; j < input.count; j++)
    {
      NSString *person2 = input[j];
      int totalTopics = [self totalTopicsKnownByPerson1:person1 andPerson2:person2];
      if (totalTopics > maxTopicsKnown)
      {
        maxTopicsKnown = totalTopics;
        numberOfMaxFound = 1;
      }
      else if (totalTopics == maxTopicsKnown)
      {
        numberOfMaxFound++;
      }
    }
  }
  printf("%i\n", maxTopicsKnown);
  printf("%i\n", numberOfMaxFound);
}

+ (int)totalTopicsKnownByPerson1: (NSString*)person1 andPerson2: (NSString*)person2
{
  int totalTopicsKnown = 0;
  
  for (int i = 0; i < person1.length; i++)
  {
    char substring1 = [person1 characterAtIndex:i];
    char substring2 = [person2 characterAtIndex:i];
    if ('1' == substring1  || '1' == substring2 )
    {
      totalTopicsKnown++;
    }
  }
  return totalTopicsKnown;
}

@end

int main(int argc, const char * argv[]){
  @autoreleasepool
  {
    int numberOfPeople;
    int numberOfTopics;
    scanf("%i %i", &numberOfPeople, &numberOfTopics);
    
    NSMutableArray<NSString*> *people = [[NSMutableArray alloc] initWithCapacity:numberOfPeople];
    
    for(int i = 0; i < numberOfPeople; i++)
    {
      char text[numberOfTopics + 1];
      scanf("%s", text);
      NSString *person = [NSString stringWithFormat:@"%s", text];
      [people addObject:person];
    }
    
    [Solver findAndPrintSolutionForInput:people];
  }
  return 0;
}