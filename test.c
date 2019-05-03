// [ CC0 license: https://creativecommons.jp/sciencecommons/aboutcc0/ ]

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#define x_printf printf
#define mrb_strcmp strcmp

#define USE_STDIO
#include "mruby_l1vm.h"

void emb_method(struct mrb_vm* vm, const char* func, intptr_t* reg, int a) {
	x_printf("emb_method %lx.%s\n", reg[a], func);
	if (mrb_strcmp(func, "cls") == 0) {
		x_printf("CLS\n");
	} else if (mrb_strcmp(func, "lc") == 0) {
		x_printf("LC %ld, %ld\n", reg[a + 1], reg[a + 2]);
	} else if (mrb_strcmp(func, "scr") == 0) {
		//reg[a] = 32;
		reg[a] = 0;
		x_printf("SCR(%ld, %ld) # => %ld\n", reg[a + 1], reg[a + 2], reg[a]);
	} else if (mrb_strcmp(func, "inkey") == 0) {
		reg[a] = 29;
		//reg[a] = 28;
		x_printf("INKEY() # => %ld\n", reg[a]);
	} else if (mrb_strcmp(func, "rnd") == 0) {
		reg[a] = 3;
		x_printf("RND(%ld) # => %ld\n", reg[a + 1], reg[a]);
	} else if (mrb_strcmp(func, "wait") == 0) {
		x_printf("WAIT %ld\n", reg[a + 1]);
	} else if (mrb_strcmp(func, "!=") == 0) {
		intptr_t ret = reg[a] != reg[a + 1] ? MRB_TRUE : MRB_FALSE;
		x_printf("%ld != %ld # => %ld\n", reg[a], reg[a + 1], ret);
		reg[a] = ret;
	} else if (mrb_strcmp(func, "print") == 0) {
		x_printf("PRINT %s\n", (const char*)reg[a + 1]);
	} else {
		x_printf("no methods err!!\n");
		vm->err = MRB_ERR_NO_METHOD;
	}
}

int main(int argc, char** argv) {
	int maxlen = 1024 * 100;
	uint8_t buf[maxlen];
	const char* fn = argc < 2 ? "test.mrb" : argv[1];
	x_printf("fopen %s\n", fn);
	FILE* fp = fopen(fn, "rb");
	int filelen = fread(buf, 1, maxlen, fp);
	
	struct mrb_vm vm;
	mrb_vm_init(&vm);

	x_printf("**********************************************************************\n");
	int n = mrb_run(&vm, buf);
	x_printf("%d\n", n);

	return 0;
}
