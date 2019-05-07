PRJ=test-wasm
clang -emit-llvm --target=wasm32 -S -I../ -Os $PRJ.c
#clang -emit-llvm --target=wasm32 -S -I../ $PRJ.c
llc $PRJ.ll -march=wasm32
s2wasm --allocate-stack 100000 $PRJ.s > $PRJ.wast
wast2wasm -o $PRJ.wasm $PRJ.wast
ls -l $PRJ.wasm
