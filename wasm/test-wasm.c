#include <typedef.h>

#define x_printf

#include <mruby_l1vm.h>

#define SIZE (16 * 1024)

uint8_t mem[SIZE];

uint8_t* getMemory() {
	return mem;
}
int getMemorySize() {
	return SIZE;
}
void emb_method(struct mrb_vm* vm, const char* func, intptr_t* reg, int a, int paramlen) {
	if (mrb_strcmp(func, "!=") == 0) {
		intptr_t ret = reg[a] != reg[a + 1] ? MRB_TRUE : MRB_FALSE;
		x_printf("%ld != %ld # => %ld\n", reg[a], reg[a + 1], ret);
		reg[a] = ret;
	} else {
		x_printf("no methods err!!\n");
		vm->err = MRB_ERR_NO_METHOD;
	}
}

int exec() {
	struct mrb_vm vm;
	mrb_vm_init(&vm);
	int res = mrb_run(&vm, (uint8_t*)mem);
	return res;
}
