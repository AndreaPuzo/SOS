# SOS
SOS (Simple OS) is a basic operating system built to run Voo (RISC) machine without executing kernel level code. The operating system is not ready yet because first I need an assembler and a linker (I am building), then I can work on the kernel, interrupts, segmentation, filesystem, etc. It is a long work but I think it will pay off in the end.
In this repository, for now, you will find the tests that I carry out and some examples of the hexadecimal format of Voo images.

### How to use it?

Compile the hex-sources using `h2o` then run the image.

```
$ h2o src/sos.x -o sos.iso
$ voo --config
$ voo doo
HELLO WORLD!
```

### Contributions

If you have the time and desire to contribute some tests, read the Voo documentation as soon as it is ready and have fun!
Remember to fork the project.
