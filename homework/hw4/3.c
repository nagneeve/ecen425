#include <stdio.h>

#define square(x)  x * x

int main(){

int i = 5;

int square = square(i+1);


printf("%d\n", i);
printf("%d\n", square);


return 0;
};
