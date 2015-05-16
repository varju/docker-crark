Overview
========

This image wraps the [Crark](http://www.crark.net/) binary in a Docker container.

This is mostly a proof of concept.  I've put no effort into getting GPU support working properly.


Usage example
-------------

Create an encrypted file:

```
$ cd /tmp
$ echo hello > foo.txt
$ rar a -pfoo foo.rar foo.txt
```

Crack the password:

```
$ docker run --rm -v /tmp:/data varju/crark crark -penglish.def /data/foo.rar
            cRARk 3.43 (OpenCL enabled) Freeware
  Copyright 1995-2001, 2006-12 by P. Semjanov, http://www.crark.net
 (c) PSW-soft Password Cracking Library PCL v. 2.0d by P. Semjanov


Testing archive /data/foo.rar : version 2.9
Testing     foo.txt
OpenCL GPU device #0 not found, CPU is used

Choosing best crypto functions................................
Chosen: AVX   (Sandy B), AVX   (Core iX) (-f3888), AES-NI
Clock cycles per password expected = 9825552/22413497 (*), theoretical = 24805332
Pure SHA-1 clock cycles per byte expected = 2.0/4.2 (*), theoretical = 5.0
Intel(R) Core(TM) i7-4790K CPU @ 4.00GHz found, CPU rate = 2.55 (*)
(*) May be inaccurate if Turbo Boost is on

Processing line 56 of password definition file...
Testing 1-chars passwords ...
Testing 2-chars passwords ...
Testing 3-chars passwords ...
foo - CRC OK
In hex (PCL style): \66 \6F \6F
Passwords tested = 4462 (time = 16.52, rate = 270 p/s)
Total     tested = 4462, slow tests = 569
```
