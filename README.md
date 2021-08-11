# SENG 440 - Mitigating Side-Channel Attacks against RSA
This is the repo for Team 22's project.
</br></br>
Compile C code using:
`gcc -o rsa.exe rsa.c`
</br></br>


Convert C code to assembly using:
`gcc -OX -S rsa.c`

where X is the optimization level (eg. -Os to aim for fewer lines, or -O3 to go for performance over line count)


The resulting assembly can be 'assembled' using:
`gcc rsa.s -o rsa.exe -lm`
</br></br>

Then run using `./rsa.exe XXXX` where XXXX is the message (only up to 4 characters a-z in length)
