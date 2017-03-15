//Solution for ACM-ICPC Team problem on Hacker Rank: https://www.hackerrank.com/challenges/acm-icpc-team
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]){
  @autoreleasepool
  {
    int numberOfPeople;
    int numberOfTopics;
    scanf("%i %i", &numberOfPeople, &numberOfTopics);
    
    char *people[numberOfPeople];
    
    for (int i = 0; i < numberOfPeople; i++)
    {
      char person[numberOfTopics];
      scanf("%s",&person);
      people[i] = strdup(person);
    }
    
    int maxTopics = 0;
    int teamsAtMax = 0;

    for (int i = 0; i < numberOfPeople; i ++)
    {
      char *person1 = people[i];
      for (int j = i + 1; j < numberOfPeople; j++)
      {
        char *person2 = people[j];
        
        int numberOfTopicsTeamKnows = 0;
        for (int k = 0; k < numberOfTopics; k++)
        {
          if (person1[k] == '1' || person2[k] == '1')
          {
            numberOfTopicsTeamKnows++;
          }
        }
        
        if (numberOfTopicsTeamKnows > maxTopics)
        {
          maxTopics = numberOfTopicsTeamKnows;
          teamsAtMax = 1;
        }
        else if (numberOfTopicsTeamKnows == maxTopics)
        {
          teamsAtMax++;
        }
      }
    }

    printf("%i\n", maxTopics);
    printf("%i", teamsAtMax);
  }
  return 0;
}