#include <stdio.h>

    void getInput(int*, float*);
    void perform(int*, float*);
    
    int main(void) {
        int duration;
        float investment;
        

        printf("Enter investment duration: ");
        scanf("%d", &duration);
        printf("Enter investent amount: ");
        scanf("%f", &investment );

        getInput(&duration, &investment);
        perform(&duration, &investment);
        printf("Duration: %d \nInvestment: %f", duration, investment);
        printf("\n");
        
        
        return 0;
} 

    void getInput(int* dur, float* amount) {
        if(*dur < 0 || *dur > 365 || *amount < 0.0) {
        getInput(dur, amount);
       }
    } 
    
    void perform(int* dur, float* amount) {
          if (*dur >= 0 && *dur <= 30) {
            *amount *= 0.9;
      }
        
       if (*amount < 100000) {
          if (*dur >= 31 && *dur <= 120) {
              *amount *=1.02;
      }


       if(*dur >= 121 && *dur <= 240) {
          *amount *=1.06;
      }

       if(*dur >= 241 && *dur <= 365) {
          *amount *=1.12;
      }
    }

      
       if(*amount > 100000) {
          if (*dur >= 31 && *dur <=120) {
          *amount *=1.03;
      }
   
       if (*dur >= 121 && *dur <= 240) {
           *amount *= 1.08;
      }
    
      if (*dur >= 241 && *dur <= 365 ) {
          *amount *=1.15;
      }
   }
 } 
