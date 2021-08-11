/* RSA Base Implementation from https://www.geeksforgeeks.org/rsa-algorithm-cryptography/
 * Heavily modified to fit requirements of Team 22's SENG440 Project to make 
 * decryptions using invalid keys draw the same amount of power as successes (mitigating side-channel attacks)
*/ 
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>
#include <string.h>
#include "arithmetic_no_logs.c"

// Used for RSA algorithm
unsigned long long int powersOf10[] = {
	1, 26, 676, 17576, 456976, 11881376, 308915776,8031810176,208827064576,5429503678976,141167095653376
};
int primes[] = {
	1571,3461,6131,9103,9013,2399,6977,3217,5081,6173,3461,4987,1031,1091,5689,8837,7297,1619,5573,
	5147,1499,9127,5147,4001,3319,9173,7043,6053,7351,8861,9601,1511,7057,5807,2309,2179,1019,8089,
	1951,5087,5623,3449,9371,4159,9311,8447,6599,5099,9749,8443,6143,2503,7589,2053,3851,2647,1657,
	7349,8123,4987,1213,1699,5387,3229,8377,8963,3257,7247,5081,9689,5839,3209,5839,3517,8501
};
int number_of_primes = 75;;

// Compute greatest common divisor between given a and h
// Based on https://www.geeksforgeeks.org/rsa-algorithm-cryptography/ (same as above)
int gcd(int a, int h) {
    int temp;
    while (1) {
        temp = a%h;
        if (!temp){
          return h;
		}
        a = h;
        h = temp;
    }
}

unsigned long long int exponentiateAndMod(unsigned long long int base, int exponent, int mod) {
  unsigned long long int zi = 1;
  int i;
  unsigned long long int pi = base;
  unsigned long long int pi1 = base;
  
  //Number of bits in exponent is given by log base 2 of exponent + 1
  int n = intAdd( doubleDivide(customLog(exponent), customLog(2)), 1);

  for(i^=i;!(i&n);i = intAdd(i,1)) {
    pi1 = intMod(intMult(pi, pi), mod);
    
    if(bitwiseAnd(exponent, intLeftShift(1,i))) {
      zi = intMod(intMult(zi, pi), mod);
    } //else make sure same amount of work is done
    else {
      intMod(intMult(1, 1), 1);
    }
	
    pi = pi1;
  }
  
  // Regardless of size of n, continue performing a series of useless operations to ensure a similar level of power consumption.
  for(;i < 90;i = intAdd(i,1)) {
    intMod(intMult(1,1), 1);
    bitwiseAnd(1, intLeftShift(1,1));
    intMod(intMult(1,1), 1);
	
  }

  return zi;
}

// Converts char* message into int
unsigned long long int encodeMessage(char* message, int msgLen) {
    int i;
    unsigned long long int encodedMessage = 0;
	
    for(i = msgLen; i > 0; i--) {
      if(message[msgLen-i] > 122 || message[msgLen-i] < 97) {
        printf("Invalid character provided: %c (please only provide a message containing the letters a-j\n",message[msgLen-i]);
        exit(0);
      }
      encodedMessage += (message[msgLen-i]-97) * powersOf10[i-1];
    }
	
    return encodedMessage;
}

// Converts int back into char* message
char* decodeMessage(unsigned long long int encodedMessage, int messageLen) {
  int i;
  char* decodedMessage = (char*)malloc(sizeof(char)*(messageLen+1));
  
  for(i = 0; i < messageLen; i++) {
    decodedMessage[i] = (encodedMessage / powersOf10[messageLen-i-1]) + 97;
    encodedMessage -= (decodedMessage[i]-97) * powersOf10[messageLen-i-1];
  }
  return decodedMessage;
}

int main(int argc, char** argv) {
	
  // Ensure valid number of arguments
	if(argc < 2) {
		printf("Missing message, please include message as argument\n");
		return EXIT_FAILURE;
  }
	// Store provided message
  char *message = argv[1];
  int msgLen = strlen(message);
	
	// Check against message length
  if(msgLen > 5) {
		printf("This program only supports up to a 5 character message. Please try again with a shorter message\n");
		return EXIT_FAILURE;
  }

  // Convert given message from char* to int
  unsigned long long int encodedMessage = encodeMessage(message, msgLen);
	// Seed random number generator with current time. From: https://www.geeksforgeeks.org/generating-random-number-range-c/
	srand(time(0));

  int P, Q, 	// The two random primes to be chosen
  PQ = 0,	// Their product
  phi, 	// The result of (P-1)*(Q-1)
  E = 2,	// The Encryption key
  D = 0,	// The Decryption key
  x,		// Temporary value used when computing 
  fakeD;	// A random incorrect decryption key

  while(E >= PQ || D < 0) {
    do {
      // Get random primes
      P = primes[rand() % (number_of_primes)];
      Q = primes[rand() % (number_of_primes)];

      // Precompute products:
      PQ = P * Q;
    } while(PQ < encodedMessage || P == Q);
    phi = (P-1)*(Q-1);

    // Compute E
    for(E = 2; gcd(E, phi) != 1 || E % 2 == 0; E++){};

    // Compute D
    for(x = 0; (((x * phi) + 1) % E) != 0 || D == phi; x++){};
    D = ((x * phi) + 1) / E;
	}
	
  // Generate an incorrect decryption key between 0 and 3*D /2 
  fakeD = (rand() % (3*D /2));
	
	// Encrypt the encoded message
  unsigned long long int encryptedMessage = exponentiateAndMod(encodedMessage, E, PQ);
	
	// Decrypt message using the correct decryption key:
  unsigned long long int decryptedMessage = exponentiateAndMod(encryptedMessage, D, PQ);

	char* decodedMessage = decodeMessage(decryptedMessage, msgLen);

	free(decodedMessage);
	
	// Decrypt message using incorrect decryption key
  decryptedMessage = exponentiateAndMod(encryptedMessage, fakeD, PQ);
	
	// Don't estimate power for our decoding (the decryption is already done)
  decodedMessage = decodeMessage(decryptedMessage, msgLen);
	
  free(decodedMessage);

  return 0;
}