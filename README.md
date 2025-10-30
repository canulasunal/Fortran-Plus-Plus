# FPPC (Fortran++ Compiler)

Fppc is the official implementation of the Fortran++ add on to Fortran 90. Fortran++ is designed to modernize and bring back Fortran to the area of general purpose programming. It adds modern features, a better standard library, and one to one binary Fortran 90 compatability. Thanks to the transpilatory nature, Fortran++ matches and sometimes exceeds speeds of vailla Fortranm making it one of the fast high level programming languages out there. The codebase in hackable, modular, and open source, licensed under the Apache 2.0 License. The main transpiler is written in Nim-Lang version 2.0.8 but is compatible with Nim 2.x.x. Additionally, the Fortran++ standard library extension is written in pure vanilla Fortran 90 to maintain the speed and purpose of Fortran. If you are already familiar with languages such such as Fortran 90 and above, switching to Fortran++ will be very easy and more ergonomic. Due to the modern nature of Fortran++, it is also a great language for those learning how to program, unlike other Fortran based languages such as Fortran and F++.

## Supported Backends

1. GCC-Fortran (gfortran) official and supported.
2. Flang (LLVM) upcoming in new major release.

## Unsupported Backends
These backends are not supported by the Fortran++ compiler due to their proprietary and non compatible nature.

1. Intel Fortran.
2. GCC-Fortran versions below Fortran 90 (e.g. F77).
