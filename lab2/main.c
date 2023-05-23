#include<stdio.h>
int main()
{ 
 int i, f;
 
 i = 2; 
 f = 1; 
 while (i <= 10)
 { 
  f = f * i;
 i = i + 1;
 }
 printf("%d\n", f);
 
}
