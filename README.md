# mruby-L1VM - An embeddable Ruby VM implementation (level 1)

mruby VM in 2KB ROM for 1KB RAM!

mruby is another Ruby for embeded  

mruby-L1VM has very limitted implementations  
see also mruby_l1vm.h  
https://github.com/taisukef/mruby-L1VM/blob/master/mruby_l1vm.h  

# How to run it?

```
$ gcc *.c
$ ./a.out test.mrb
```

Try your mrb file (mruby binary) compiled by mrbc (mruby compiler 2.0.1)

## sample

Runs on IchigoJam! (Arm Cortex-M0 ROM32KB/RAM4KB LPC1114 by NXP)  
https://fukuno.jig.jp/2475  

Runs with IchigoJam BASIC!  
https://fukuno.jig.jp/2476  

mruby on web with WebAssembly  
https://fukuno.jig.jp/2480  

## license

MIT license  
http://www.opensource.org/licenses/mit-license.php  

## links

mruby  
https://github.com/mruby/mruby  

Ruby  
https://www.ruby-lang.org/  

