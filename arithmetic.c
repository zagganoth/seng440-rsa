#include <math.h>

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

//Should act as dummy register for equalizing all arithmetic operations
int temp = 5;

unsigned long long int intMult(unsigned long long int a, unsigned long long int b, int calculatePower, float* currentDrawn) {
  if(calculatePower) {
    // should be 3 (a*b) + 2 (temp + temp) + 15 (/ temp) + 2 (+ 1) = 22
    currentDrawn += MULTIPLICATION_CURRENT + MULTIPLICATION_CURRENT + DIVISION_CURRENT + ADDITION_CURRENT;
  }
  //The +1 is to prevent / 0
  temp = (temp + temp / temp) + 1;
  return a*b;
}
unsigned long long int intAdd(unsigned long long int a, unsigned long long int b, int calculatePower, float* currentDrawn) {
  if(calculatePower) {
    //Should be 2 (a+b) + 3 (temp * temp) + 15 (/ temp) + 2 (+ 1) = 22
    currentDrawn += ADDITION_CURRENT + MULTIPLICATION_CURRENT + DIVISION_CURRENT + ADDITION_CURRENT;
  }
  temp = (temp * temp / temp) + 1;
  return a+b;
}
unsigned long long int intDivide(unsigned long long int a, unsigned long long int b, int calculatePower, float* currentDrawn) {
  if(calculatePower) {
    //Should be 15 (a/b) + 3 (temp * temp) + 2 (+ temp) + 2 (+ 1) = 22
    *currentDrawn+= DIVISION_CURRENT + MULTIPLICATION_CURRENT + ADDITION_CURRENT + ADDITION_CURRENT;
  }
  temp = (temp * temp + temp) + 1;
  return a/b;
}
double doubleDivide(double a, double b, int calculatePower, float* currentDrawn) {
  if(calculatePower) {
    //Should be 15 (a/b) + 3 (temp * temp) + 2 (+ temp) + 2 (+ 1) = 22
    *currentDrawn+= DIVISION_CURRENT + MULTIPLICATION_CURRENT + ADDITION_CURRENT + ADDITION_CURRENT;
  }
  temp = (temp * temp + temp) + 1; 
  return a/b;
}
double customLog(double a, int calculatePower, float* currentDrawn) {
  if(calculatePower) {
    *currentDrawn += LOG_CURRENT + ADDITION_CURRENT;
  }
  temp = temp + 1;
  return log(a);
}
unsigned long long int intMod(unsigned long long int a, unsigned long long int b, int calculatePower, float* currentDrawn) {
  if(calculatePower) {
    //Should be 18 (a%b) + 2 (temp + temp) + 2 (+ 1) = 22
    *currentDrawn += MOD_CURRENT + ADDITION_CURRENT + ADDITION_CURRENT;
  }
  temp = (temp + temp) + 1;
  return a % b;
}

unsigned long long int bitwiseAnd(unsigned long long int a, unsigned long long int b, int calculatePower, float* currentDrawn) {
  if(calculatePower) {
    //Should be 0.5 (a & b) + 1.5 (temp & temp & temp) + 3 (* temp) + 15 (/ temp) + 2 (+ 1) = 22
    *currentDrawn += BITWISE_COMP_CURRENT + BITWISE_COMP_CURRENT + BITWISE_COMP_CURRENT + BITWISE_COMP_CURRENT + MULTIPLICATION_CURRENT + DIVISION_CURRENT + ADDITION_CURRENT;
  }
  temp = (temp & temp & temp * temp / temp) + 1;
  return a & b;
}
int intLeftShift(int a, int b, int calculatePower, float* currentDrawn) {
  if(calculatePower) {
    //Should be 0.8 (a << b) + 3.2 (temp << temp << temp << temp) + 1 (temp & temp & temp) + 15 (/ temp) + 2 (+ 1) = 22
    *currentDrawn += SHIFT_CURRENT + SHIFT_CURRENT + SHIFT_CURRENT + SHIFT_CURRENT + SHIFT_CURRENT + BITWISE_COMP_CURRENT + BITWISE_COMP_CURRENT + DIVISION_CURRENT + ADDITION_CURRENT;
  }
  temp = (temp << temp << temp << temp & temp & temp / temp) + 1;
  return a << b; 
}