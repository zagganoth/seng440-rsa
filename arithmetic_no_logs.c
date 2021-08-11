#include <math.h>

/* Estimates of how much current is drawn by each operations, based on initial project lecture with Professor Sima
 *
 * We use these to fill each of our wrapper operator functions with
 * useless operations so that overall draw is similar regardless of operation
 *
 * For testing purposes we have additional operations and branches to compute
 * our estimated power draw, but those would not be present otherwise.
 */ 
#define MULTIPLICATION_CURRENT 3
#define ADDITION_CURRENT 2
#define SUBTRACTION_CURRENT 2
#define DIVISION_CURRENT 15
#define MOD_CURRENT 18
#define BITWISE_COMP_CURRENT 0.5
#define SHIFT_CURRENT 1
#define INCREMENT 1.5
#define BRANCH_CURRENT 15
#define LOG_CURRENT 20

//Dummy variable (should be stored in register) to perform our useless operations on when equalizing power usage across operations
int temp = 5;

unsigned long long int intMult(unsigned long long int a, unsigned long long int b) {
  // The +1 is to prevent a later division by 0
  temp = (temp + temp / temp) + 1;
  return a*b;
}

unsigned long long int intAdd(unsigned long long int a, unsigned long long int b) {
  temp = (temp * temp / temp) + 1;
  return a+b;
}

unsigned long long int intDivide(unsigned long long int a, unsigned long long int b) {
  temp = (temp * temp + temp) + 1;
  return a/b;
}

double doubleDivide(double a, double b) {
  temp = (temp * temp + temp) + 1; 
  return a/b;
}

double customLog(double a) {
  temp = temp + 1;
  return log(a);
}

unsigned long long int intMod(unsigned long long int a, unsigned long long int b) {
  temp = (temp + temp) + 1;
  return a % b;
}

unsigned long long int bitwiseAnd(unsigned long long int a, unsigned long long int b) {
  temp = (temp & temp & temp * temp / temp) + 1;
  return a & b;
}

int intLeftShift(int a, int b) {
  temp = (temp << temp * temp / temp) + 1;
  return a << b; 
}