# SENG 440 - Mitigating Side-Channel Attacks against RSA
This is the repo for Team 22's project.
</br></br>
Compile C code using:
`gcc -o rsa.exe rsa.c`
</br></br>


Convert C code to assembly using:
`gcc -Os -S rsa.c`

and to an executable with:
`gcc rsa.s -o rsa.exe -lm`
</br></br>

Then run using `./rsa.exe XXXX` where XXXX is the message (only up to 4 characters a-z in length)
