/*
** mruby-L1VM - An embeddable Ruby VM implementation (level 1)
**
** Copyright (c) 2019 Taisuke Fukuno @taisukef [ https://fukuno.jig.jp/2475 ]
**
** mruby 
** [ mruby: https://github.com/mruby/mruby ]
**
** Permission is hereby granted, free of charge, to any person obtaining
** a copy of this software and associated documentation files (the
** "Software"), to deal in the Software without restriction, including
** without limitation the rights to use, copy, modify, merge, publish,
** distribute, sublicense, and/or sell copies of the Software, and to
** permit persons to whom the Software is furnished to do so, subject to
** the following conditions:
**
** The above copyright notice and this permission notice shall be
** included in all copies or substantial portions of the Software.
**
** THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
** EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
** MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
** IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
** CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
** TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
** SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
**
** [ MIT license: http://www.opensource.org/licenses/mit-license.php ]
*/

#ifndef USE_STDIO
#include "typedef.h"
#endif

int mrb_strcmp(const char* buf1, const char* buf2);

// option
//#define SUPPORT_CONST
//#define SUPPORT_CLASS
//#define SUPPORT_ARRAY // need alloc/free

// TBD options
//#define SUPPORT_STRCAT // need alloc/free/strcat TBD
//#define SUPPORT_HASH // TBD
//#define SUPPORT_RANGE // TBD
//#define SUPPORT_OVER64KB // TBD
//#define SUPPORT_SENDV // TBD
//#define SUPPORT_GLOBALVAR // TBD

#define MAX_USERDEF 20 // *12 byte memory

static inline int b2l2(const uint8_t* n) {
	return (n[0] << 8) | n[1];
}

#ifdef SUPPORT_OVER64KB
int b2l4(const uint8_t* n) {
	return (n[0] << 24) | (n[1] << 16) | (n[2] << 8) | n[3];
}
#else
#define b2l4(n) b2l2((n) + 2)
#endif

enum {
	OP_NOP,
	OP_MOVE,
	OP_LOADL,
	OP_LOADI,
	OP_LOADINEG,
	OP_LOADI__1,
	OP_LOADI_0,
	OP_LOADI_1,
	OP_LOADI_2,
	OP_LOADI_3,
	OP_LOADI_4,
	OP_LOADI_5,
	OP_LOADI_6,
	OP_LOADI_7,
	OP_LOADSYM,
	OP_LOADNIL,
	OP_LOADSELF,
	OP_LOADT,
	OP_LOADF,
	OP_GETIV = 23,
	OP_SETIV,
	OP_GETCONST = 27,
	OP_SETCONST,
	OP_GETUPVAR = 31,
	OP_SETUPVAR,
	OP_JMP,
	OP_JMPIF,
	OP_JMPNOT,
	OP_SENDV = 44,
	OP_SENDVB,
	OP_SEND,
	OP_SENDB,
	OP_ENTER = 51,
	OP_RETURN = 55,
	OP_RETURN_BLK,
	OP_BREAK,
	OP_ADD = 59,
	OP_ADDI,
	OP_SUB,
	OP_SUBI,
	OP_MUL,
	OP_DIV,
	OP_EQ,
	OP_LT,
	OP_LE,
	OP_GT,
	OP_GE,
	OP_ARRAY = 70,
	OP_ARRAY2,
	OP_ARYCAT,
	OP_ARYPUSH = 73,
	OP_AREF = 75,
	OP_ASET, // unused?
	OP_APOST,
	OP_STRING = 79,
	OP_STRCAT,
	OP_HASH,
	OP_HASHADD,
	OP_HASHCAT,
	OP_BLOCK = 85,
	OP_METHOD,
	OP_RANGE_INC,
	OP_RANGE_EXC,
	OP_CLASS = 90,
	OP_EXEC = 92,
	OP_DEF,
	OP_TCLASS = 97,
	OP_EXT1 = 100,
	OP_EXT2,
	OP_EXT3,
	OP_STOP,
};

/*
void check(int n) {
	if (!n) {
		x_printf("!err\n");
	}
}
*/
#define check(x)

#define IREP_TYPE_SKIP 0
#define IREP_TYPE_LITERAL 1
#define IREP_TYPE_SYMBOL 2
#define IREP_TYPE_IREP 3

 // literal: type, len(big endian short), data... (no null terminate)
 // symbol : len(big endian short), data ... (with null terminate)
const uint8_t* irep_get(const uint8_t* p, int type, int n) {
	int lenirep = b2l4(p);
	//x_printf("irep record len: %d\n", lenirep); // ??
	p += 8;
	int nirep = b2l2(p);
	p += 2;
	{
		int codelen = b2l4(p);
		p += 4;
		int align = (int)p & 3;
		if (align) {
			p += 4 - align;
		}
		p += codelen;
	}
	{
		int plen = b2l4(p);
		//x_printf("litlen: %d\n", plen);
		if (type == IREP_TYPE_LITERAL) {
			check(n >= 0 && n < plen);
			plen = n;
		}
		p += 4;
		for (int i = 0; i < plen; i++) {
			uint8_t type = *p;
			uint16_t len = b2l2(p + 1);
			p += len + 3;
		}
		if (type == IREP_TYPE_LITERAL) {
			return p;
		}
	}
	{
		int symlen = b2l4(p);
		//x_printf("symlen: %d\n", symlen);
		if (type == IREP_TYPE_SYMBOL) {
			check(n >= 0 && n < symlen);
			symlen = n;
		}
		p += 4;
		for (int i = 0; i < symlen; i++) {
			uint16_t len = b2l2(p);
			p += len + 3; // len + '¥0'
		}
		if (type == IREP_TYPE_SYMBOL) {
			return p;
		}
	}
	{
		//x_printf("n ireps: %d\n", nirep);
		if (type == IREP_TYPE_IREP) {
			check(n >= 0 && n < nirep);
			nirep = n;
		}
		for (int i = 0; i < nirep; i++) {
			//x_printf("ireps[%d]\n", i);
			p = irep_get(p, IREP_TYPE_SKIP, 0);
		}
		if (type == IREP_TYPE_IREP) {
			return p;
		}
	}
	return p;
}

void showRegs(intptr_t* reg, int nregs) {
	for (int i = 0; i < nregs; i++) {
		x_printf("reg[%d] = %ld\n", i, reg[i]);
	}
}


#if defined(SUPPORT_STRCAT) || defined(SUPPORT_ARRAY)

void* mrb_malloc(int size) {
	x_printf("alloc %d\n", size);
	return malloc(size);
}
void mrb_free(void* p) {
	x_printf("free %ld\n", (intptr_t)p);
	free(p);
}

#endif

struct mrb_state {
	struct mrb_state* parent;
	intptr_t* reg;
};

enum {
	MRB_ERR_NOERR,
	MRB_ERR_UNSUPPORTED_OPCODE,
	MRB_ERR_NO_METHOD,
	MRB_ERR_EXCEED_MAX_USEROBJECT,
};

enum {
	MRB_OBJ_CONST,
	MRB_OBJ_OBJECT,
	MRB_OBJ_GLOBAL,
	MRB_OBJ_USER, // last
};

struct mrb_vm {
	int err;

	int nmemory;
	intptr_t memory[MAX_USERDEF * 3]; // obj, const char*, value

#ifdef SUPPORT_CLASS
	int nobject;
#endif

	void* userdata; // You can use freely!!
};

intptr_t* mrb_memory_find(struct mrb_vm* vm, intptr_t obj, const char* name) {
	intptr_t* mem = vm->memory;
	for (int i = 0; i < vm->nmemory * 3; i += 3) {
		if (mem[i] == obj && mrb_strcmp((const char*)mem[i + 1], name) == 0) {
			x_printf("get[ %ld %s %ld]\n", obj, (const char*)name, mem[i + 2]);
			return mem + i;
		}
	}
	return NULL;
}
int mrb_memory_add(struct mrb_vm* vm, intptr_t obj, const char* name, intptr_t val) { // 0 when out of memory
	x_printf("add[ %ld %s %ld]\n", obj, (const char*)name, val);
	intptr_t* chk = mrb_memory_find(vm, obj, name);
	if (chk) {
		chk[2] = val;
		return 1;
	}
	if (vm->nmemory == MAX_USERDEF) {
		x_printf("exceed max user object!!\n");
		vm->err = MRB_ERR_EXCEED_MAX_USEROBJECT;
		return 0;
	}
	intptr_t* mem = vm->memory + vm->nmemory * 3;
	*mem++ = obj;
	*mem++ = (intptr_t)name;
	*mem++ = val;
	vm->nmemory++;
	return 1;
}

// for 32bit
#define MRB_NIL 0x80000000 // this is ruby!
//#define MRB_NIL 80000000 // for debug, +4byte
//#define MRB_NIL 0 // like C (-20 byte)

#define MRB_FALSE MRB_NIL
#define MRB_TRUE 1

#ifdef SUPPORT_CLASS
#define mrb_vm_init(pvm) { (pvm)->err = 0; (pvm)->nmemory = 0; (pvm)->nobject = MRB_OBJ_USER; }
#else
#define mrb_vm_init(pvm) { (pvm)->err = 0; (pvm)->nmemory = 0; }
#endif

intptr_t irep_atol(const char* s);

int irep_exec(struct mrb_vm* vm, const uint8_t* irep, struct mrb_state* parent, int paramreg);

static inline intptr_t num_times(struct mrb_vm* vm, intptr_t n, const uint8_t* irep, struct mrb_state* parent) {
	intptr_t reg[3];
	struct mrb_state state = { .parent = parent, .reg = reg };
	intptr_t ret = 0;
	reg[0] = MRB_NIL;
	for (int i = 0; i < n; i++) {
		reg[1] = i;
		ret = irep_exec(vm, irep, &state, 1);
	}
	return ret;
}

#ifdef SUPPORT_ARRAY
static inline intptr_t array_each(struct mrb_vm* vm, intptr_t* ar, const uint8_t* irep, struct mrb_state* parent) {
	intptr_t reg[3];
	struct mrb_state state = { .parent = parent, .reg = reg };
	intptr_t ret = 0;
	reg[0] = MRB_NIL;
	int n = ar[0];
	for (int i = 0; i < n; i++) {
		reg[1] = ar[i + 1];
		ret = irep_exec(vm, irep, &state, 1);
	}
	return ret;
}
#endif

void emb_method(struct mrb_vm* vm, const char* func, intptr_t* reg, int paramreg, int paramlen);

int irep_exec(struct mrb_vm* vm, const uint8_t* irep, struct mrb_state* parent, int paramreg) {
	const uint8_t* p = irep;
	p += 4;
	int nlocals = b2l2(p);
	p += 2;
	int nregs = b2l2(p);
	intptr_t reg[nregs - 1]; // no need a reg for management
	p += 2;
	int nirep = b2l2(p);
	p += 2;
	x_printf("locals: %d, rergs: %d, ireps: %d\n", nlocals, nregs, nirep);
	{
		int codelen = b2l4(p);
		p += 4;
		int align = (int)p & 3;
		if (align) {
			p += 4 - align;
		}
	}
	struct mrb_state state = { .parent = parent, .reg = reg };

	int32_t a = 0;
	int32_t b = 0;
	int32_t c = 0;
	int opext = 0;
	const uint8_t* porg = p;
	reg[0] = paramreg ? parent->reg[paramreg] : MRB_OBJ_OBJECT; // self instance  0 means root object // vm->parentstate ? parentstate->caller : 0;
	intptr_t* tclass = mrb_memory_find(vm, reg[0], "_cls");
	if (tclass) {
		x_printf("irep_exec self:%ld target_class:%ld (%d)\n", reg[0], tclass[2], paramreg);
	} else {
		x_printf("irep_exec self:%ld target_class:%d, (%d)\n", reg[0], 0, paramreg);
	}
	for (;;) {
		x_printf("%3ld:%3d ", (intptr_t)(p - porg), *p);
		uint8_t op = *p++;
		//x_printf("op %d\n", op);
		switch (op) {
			case OP_NOP:
				x_printf("nop\n");
				break;
			case OP_MOVE:
				a = *p++; b = *p++;
				reg[a] = reg[b];
				x_printf("r[%d] = r[%d] : %ld\n", a, b, reg[b]);
				break;
			case OP_LOADL:
				a = *p++; b = *p++;
				reg[a] = irep_atol((const char*)(irep_get(irep, IREP_TYPE_LITERAL, b) + 3));
				x_printf("r[%d] = lit[%d]\n", a, b);
				break;
			case OP_LOADI:
			case OP_LOADINEG:
				a = *p++; b = *p++;
				if (opext == 2)
					b = (b << 8) + *p++;
				if (op == OP_LOADINEG)
					b = -b;
				reg[a] = b;
				x_printf("r[%d] = %d\n", a, b);
				break;
			case OP_LOADI__1:
			case OP_LOADI_0:
			case OP_LOADI_1:
			case OP_LOADI_2:
			case OP_LOADI_3:
			case OP_LOADI_4:
			case OP_LOADI_5:
			case OP_LOADI_6:
			case OP_LOADI_7:
				a = *p++;
				reg[a] = op - OP_LOADI_0;
				x_printf("r[%d] = %d\n", a, op - OP_LOADI_0);
				break;
			case OP_LOADSYM:
				a = *p++; b = *p++;
				reg[a] = (intptr_t)(irep_get(irep, IREP_TYPE_SYMBOL, b) + 2);
				x_printf("r[%d] = sym[%d] %s\n", a, b, (const char*)reg[a]);
				break;
			case OP_LOADNIL:
				a = *p++;
				reg[a] = MRB_NIL;
				x_printf("r[%d] = nil\n", a);
				break;
			case OP_LOADSELF:
				a = *p++;
				reg[a] = reg[0];
				x_printf("r[%d] = self %ld\n", a, reg[a]);
				break;
			case OP_LOADT:
			case OP_LOADF:
				a = *p++;
				reg[a] = op == OP_LOADT;
				x_printf("r[%d] = %s\n", a, op == OP_LOADT ? "true" : "false");
				break;
#ifdef SUPPORT_CLASS
			case OP_GETIV: // OPCODE(GETIV,      BB)       /* R(a) = ivget(Syms(b)) */
				a = *p++; b = *p++;
				const char* iconst = (const char*)(irep_get(irep, IREP_TYPE_SYMBOL, b) + 2);
				intptr_t* iv = mrb_memory_find(vm, reg[0], iconst);
				if (iv)
					reg[a] = iv[2];
				x_printf("r[%d]:%ld = %ld.ivtget(sym[%d]:%s)\n", a, reg[a], reg[0], b, iconst);
				break;
			case OP_SETIV: // OPCODE(SETIV,      BB)       /* ivset(Syms(b),R(a)) */
				a = *p++; b = *p++;
				const char* iconst2 = (const char*)(irep_get(irep, IREP_TYPE_SYMBOL, b) + 2);
				x_printf("%ld.ivtset(sym[%d]:%s, r[%d]:%ld)\n", reg[0], b, iconst2, a, reg[a]);
				mrb_memory_add(vm, reg[0], iconst2, reg[a]);
				break;
#endif
#ifdef SUPPORT_CONST
			case OP_GETCONST: //  class is const, 	OPCODE(GETCONST,   BB)       /* R(a) = constget(Syms(b)) */
				a = *p++; b = *p++;
				const char* sconst = (const char*)(irep_get(irep, IREP_TYPE_SYMBOL, b) + 2);
				intptr_t* gc = mrb_memory_find(vm, MRB_OBJ_CONST, sconst);
				if (gc)
					reg[a] = gc[2];
				x_printf("r[%d] = constget(sym[%d]:%s)\n", a, b, sconst);
				break;
			case OP_SETCONST: // OPCODE(SETCONST,   BB)       /* constset(Syms(b),R(a)) */
				a = *p++; b = *p++;
				const char* sconst2 = (const char*)(irep_get(irep, IREP_TYPE_SYMBOL, b) + 2);
				mrb_memory_add(vm, MRB_OBJ_CONST, sconst2, reg[a]);
				// warn if defined
				x_printf("constset(sym[%d]:%s, r[%d])\n", b, sconst2, a);
				break;
#endif
			case OP_GETUPVAR: // OPCODE(GETUPVAR,   BBB)      /* R(a) = uvget(b,c) */
			case OP_SETUPVAR: // OPCODE(SETUPVAR,   BBB)      /* uvset(b,c,R(a)) */
				a = *p++; b = *p++; c = *p++;
				struct mrb_state* s = state.parent;
				for (int iu = 0; iu < c; iu++) {
					s = s->parent;
				}
				if (op == OP_GETUPVAR) {
					x_printf("r[%d] = r[%d] of up:%d\n", a, b, c);
					reg[a] = s->reg[b];
				} else {
					x_printf("r[%d] of up:%d = r[%d]\n", b, c, a);
					s->reg[b] = reg[a];
				}
				break;
			case OP_JMP:
				a = *p++; a = (a << 8) | *p++;
				p = porg + a;
				x_printf("jmp %d\n", b);
				break;
			case OP_JMPIF:
			case OP_JMPNOT:
				a = *p++; b = *p++; b = (b << 8) | *p++;
				if (op == OP_JMPIF)
					x_printf("jmp %d if r[%d] == %ld\n", b, a, reg[a]);
				else
					x_printf("jmp %d if !r[%d] == %ld\n", b, a, reg[a]);
				if ((op == OP_JMPIF) == (reg[a] != MRB_NIL)) {
					p = porg + b;
				}
				break;
#ifdef SUPPORT_SENDV
			case OP_SENDV: // OPCODE(SENDV,      BB)       /* R(a) = call(R(a),Syms(b),*R(a+1)) */
				a = *p++; b = *p++;
				x_printf("r[%d] = r[%d].sym[%d](*r[%d])\n", a, a, b, a + 1);
				break;
			case OP_SENDVB: // OPCODE(SENDVB,     BB)       /* R(a) = call(R(a),Syms(b),*R(a+1),&R(a+2)) */
				a = *p++; b = *p++;
				x_printf("r[%d] = r[%d].sym[%d](*r[%d]) at block:r[%d]\n", a, a, b, a + 1, a + 2);
				break;
#endif
			case OP_SEND:
				a = *p++; b = *p++; c = *p++;
				const char* func = (const char*)(irep_get(irep, IREP_TYPE_SYMBOL, b) + 2);
				if (c)
					x_printf("r[%d] = r[%d].sym[%d:%s](r[%d]:%ld-r[%d])\n", a, a, b, func, a + 1, reg[a + 1], a + c);
				else
					x_printf("r[%d] = r[%d].sym[%d:%s]()\n", a, a, b, func);
				
#ifdef SUPPORT_CLASS
				intptr_t* fobj = mrb_memory_find(vm, reg[a], func);
				if (fobj) {
					reg[a] = irep_exec(vm, (const uint8_t*)fobj[2], &state, a);
					break;
				}
				intptr_t* send = mrb_memory_find(vm, reg[a], "_cls");
				if (send) {
					intptr_t* fsend = mrb_memory_find(vm, send[2], func);
					if (fsend) {
						reg[a] = irep_exec(vm, (const uint8_t*)fsend[2], &state, a);
						break;
					}
				}
#endif
				intptr_t* send2 = mrb_memory_find(vm, MRB_OBJ_OBJECT, func);
				if (send2) {
					reg[a] = irep_exec(vm, (const uint8_t*)send2[2], &state, a);
					break;
				}
#ifdef SUPPORT_CLASS
				if (mrb_strcmp("new", func) == 0) {
					intptr_t clsid = reg[a];
					reg[a] = vm->nobject++;
					mrb_memory_add(vm, reg[a], "_cls", clsid);

					x_printf("new cls:%ld obj:%ld\n", clsid, reg[a]);
					//x_printf("new %s %d\n", (const char*)reg[a], vm->nobject + MRB_OBJ_USER);
//					const char* clsname = mrb_memory_findName(vm, MRB_OBJ_CONST, reg[a]);
					intptr_t* finit = mrb_memory_find(vm, clsid, "initialize");
					if (finit) {
						/*
						intptr_t reg2[3];
						struct mrb_state state2 = { .parent = parent, .reg = reg2 };
						intptr_t ret = 0;
						reg2[0] = reg[a];
						*/
						irep_exec(vm, (const uint8_t*)finit[2], &state, a);
					} else {
						x_printf("no initilize func\n");
					}
					break;
				}
#endif
#ifdef SUPPORT_ARRAY
				if (mrb_strcmp("[]", func) == 0) {
					intptr_t* ar = (intptr_t*)reg[a];
					int n = reg[a + 1];
					x_printf("array %ld[%ld] == %ld\n", ar, n, ar[n + 1]);
					reg[a] = ar[n + 1];
					break;
				} else if (mrb_strcmp("size", func) == 0) {
					intptr_t* ar = (intptr_t*)reg[a];
					x_printf("array %ld.size == %ld\n", ar, ar[0]);
					reg[a] = ar[0];
					break;
				}
#endif
				emb_method(vm, func, reg, a, c);
				break;
			case OP_SENDB: // VM needs to check count of parameters in OP_ENTER
				a = *p++; b = *p++; c = *p++;
				if (c)
					x_printf("r[%d] = r[%d].sym[%d](r[%d]-r[%d]) at block:r[%d]\n", a, a, b, a + 1, a + c, a + c + 1);
				else
					x_printf("r[%d] = r[%d].sym[%d]() at block:r[%d]\n", a, a, b, a + 1); //?
				const char* funcb = (const char*)(irep_get(irep, IREP_TYPE_SYMBOL, b) + 2);
				x_printf("funcb:%s %ld\n", funcb, reg[a + 1]);
				if (mrb_strcmp(funcb, "times") == 0) {
					reg[a] = num_times(vm, reg[a], (const uint8_t*)reg[a + 1], &state);
					break;
				}
#ifdef SUPPORT_ARRAY
				if (mrb_strcmp(funcb, "each") == 0) {
					reg[a] = array_each(vm, (intptr_t*)reg[a], (const uint8_t*)reg[a + 1], &state);
				}
#endif
				break;
			case OP_ENTER: // block parameters
				a = *p++; a = (a << 8) | *p++; a = (a << 8) | *p++;
				int nparam = a >> 18; // no checks now
				for (int i = 0; i < nparam; i++) {
					reg[i + 1] = parent->reg[i + 1 + paramreg];
					x_printf("r[%d] = parent.reg[%d] (%ld) %d/%d\n", i + 1, i + 1 + paramreg, reg[i + 1], i, nparam);
				}
				x_printf("enter %d:%d:%d:%d:%d:%d:%d\n", a >> 18, (a >> 13) & 0x1f, (a >> 12) & 1, (a >> 7) & 0x1f, (a >> 2) & 0x1f, (a >> 1) & 1, a & 1);
				break;
			case OP_RETURN:
			case OP_RETURN_BLK:
			case OP_BREAK:
				a = *p++;
				x_printf("%s r[%d]\n", op == OP_RETURN ? "return" : "break", a);
				//showRegs(reg, nregs);
				return reg[a];
			case OP_ADD:
				a = *p++;
				reg[a] += reg[a + 1];
				x_printf("r[%d] = r[%d] + r[%d]\n", a, a, a + 1);
				break;
			case OP_ADDI:
				a = *p++; b = *p++;
				reg[a] += b;
				x_printf("r[%d] = r[%d] + %d\n", a, a, b);
				break;
			case OP_SUB:
				a = *p++;
				reg[a] -= reg[a + 1];
				x_printf("r[%d] = r[%d] - r[%d]\n", a, a, a + 1);
				break;
			case OP_SUBI:
				a = *p++; b = *p++;
				reg[a] -= b;
				x_printf("r[%d] = r[%d] + %d\n", a, a, b);
				break;
			case OP_MUL:
				a = *p++;
				reg[a] *= reg[a + 1];
				x_printf("r[%d] = r[%d] * r[%d]\n", a, a, a + 1);
				break;
			case OP_DIV:
				a = *p++;
				reg[a] /= reg[a + 1];
				x_printf("r[%d] = r[%d] / r[%d]\n", a, a, a + 1);
				break;
			
			case OP_EQ:
				a = *p++;
				reg[a] = reg[a] == reg[a + 1] ? MRB_TRUE : MRB_FALSE;
				x_printf("r[%d] = r[%d]==r[%d+1]\n", a, a, a);
				break;
			case OP_LT:
				a = *p++;
				reg[a] = reg[a] < reg[a + 1] ? MRB_TRUE : MRB_FALSE;
				x_printf("r[%d] = r[%d]<r[%d+1]\n", a, a, a);
				break;
			case OP_LE:
				a = *p++;
				reg[a] = reg[a] <= reg[a + 1] ? MRB_TRUE : MRB_FALSE;
				x_printf("r[%d] = r[%d]<=r[%d+1]\n", a, a, a);
				break;
			case OP_GT:
				a = *p++;
				reg[a] = reg[a] > reg[a + 1] ? MRB_TRUE : MRB_FALSE;
				x_printf("r[%d] = r[%d]>r[%d+1]\n", a, a, a);
				break;
			case OP_GE:
				a = *p++;
				reg[a] = reg[a] >= reg[a + 1] ? MRB_TRUE : MRB_FALSE;
				x_printf("r[%d] = r[%d]>=r[%d+1]\n", a, a, a);
				break;
#ifdef SUPPORT_ARRAY
			case OP_ARRAY: // 	OPCODE(ARRAY,      BB)       /* R(a) = ary_new(R(a),R(a+1)..R(a+b)) */
				a = *p++; b = *p++;
				x_printf("r[%d] = ary_new(r[%d]-r[%d]) size:%ld\n", a, a, a + b, b);
				intptr_t* nar = mrb_malloc(sizeof(intptr_t) * (b + 1));
				nar[0] = b;
				for (int i = 0; i < b; i++) {
					x_printf("[%ld]=%ld\n", i, reg[a + i]);
					nar[i + 1] = reg[a + i];
				}
				reg[a] = (intptr_t)nar;
				break;
			case OP_ARRAY2: //	OPCODE(ARRAY2,     BBB)      /* R(a) = ary_new(R(b),R(b+1)..R(b+c)) */ //  *rest使用時
				a = *p++; b = *p++; c = *p++;
				x_printf("r[%d] = ary_new(r[%d]-r[%d])\n", a, b, b + c);
				break;
			case OP_ARYCAT: // OPCODE(ARYCAT,     B)        /* ary_cat(R(a),R(a+1)) */
				a = *p++;
				x_printf("ary_cat(r[%d], r[%d])\n", a, a + 1);
				break;
			case OP_ARYPUSH: //	OPCODE(ARYPUSH,    B)        /* ary_push(R(a),R(a+1)) */ // use this for long array initializing
				a = *p++;
				x_printf("ary_push(r[%d], r[%d])\n", a, a + 1);
				break;
			case OP_AREF: // OPCODE(AREF,       BBB)      /* R(a) = R(b)[c] */
				a = *p++; b = *p++; c = *p++;
				x_printf("r[%d] = r[%d][%d]\n", a, b, c);
				break;
//			case OP_ASET: // OPCODE(ASET,       BBB)      /* R(a)[c] = R(b) */
//				break;
			case OP_APOST: // OPCODE(APOST,      BBB)      /* *R(a),R(a+1)..R(a+c) = R(a)[b..] */
				a = *p++; b = *p++; c = *p++;
				x_printf("r[%d]-r[%d] = r[%d][%d]-r[%d][%d]\n", a, a + c, a, b, a, b + c);
				break;
#endif
			case OP_STRING:
				a = *p++; b = *p++;
#ifdef SUPPORT_STRCAT
				const uint8_t* lit = irep_get(irep, IREP_TYPE_LITERAL, b);
				int len = b2l2(lit + 1);
				char* buf = mrb_alloc(len + 1);
				memcpy(buf, lit + 3, len);
				buf[len] = 0;
				reg[a] = (intptr_t)buf;
#else
				reg[a] = (intptr_t)irep_get(irep, IREP_TYPE_LITERAL, b) + 2;
#endif
				x_printf("r[%d] = str_dup(lit[%d] %s)\n", a, b, (const char*)reg[a]);
				break;
			case OP_STRCAT: // same as OP_ADD?
				a = *p++;
#ifdef SUPPORT_STRCAT
				char* sa = (char*)reg[a];
				const char* sb = (const char*)reg[a + 1];
				int newlen = strlen(sa) + strlen(sb) + 1;
				char* sc = m_alloc(newlen);
				strcpy(sc, sa);
				strcat(sc, sb);
				mrb_free(sa);
				reg[a] = (intptr_t)sc;
				x_printf("strcat %s\n", sc);
#endif
				x_printf("str_cat(R[%d], R[%d])\n", a, a + 1);
				break;
#ifdef SUPPORT_HASH
			case OP_HASH: // OPCODE(HASH,       BB)       /* R(a) = hash_new(R(a),R(a+1)..R(a+b)) */
				a = *p++; b = *p++;
				x_printf("r[%d] = hash_new(r[%d]-r[%d])\n", a, a, a + b);
				break;
			case OP_HASHADD: /* R(a) = hash_push(R(a),R(a+1)..R(a+b)) */ // for over 255 elements (not use OP_EXT)
				a = *p++; b = *p++;
				x_printf("r[%d] = hash_push(r[%d]-r[%d])\n", a, a, a + b);
				break;
			case OP_HASHCAT: /* R(a) = hash_cat(R(a),R(a+1)) */ // for over 255 elements
				a = *p++;
				x_printf("r[%d] = hash_cat(r[%d], r[%d])\n", a, a, a + 1);
				break;
#endif
			case OP_BLOCK: // make procedure
			case OP_METHOD: // OPCODE(METHOD,     BB)       /* R(a) = lambda(SEQ[b],L_METHOD) */
				a = *p++; b = *p++;
				reg[a] = (intptr_t)irep_get(irep, IREP_TYPE_IREP, b);
				x_printf("r[%d] = lamda(irep[%d],%s)\n", a, b, op == OP_BLOCK ? "L_BLOCK" : "L_METHOD");
				break;
#ifdef SUPPORT_RANGE
			case OP_RANGE_INC: // OPCODE(RANGE_INC,  B)        /* R(a) = range_new(R(a),R(a+1),FALSE) */
				a = *p++;
				x_printf("r[%d] = range_new(r[%d],r[%d],FALSE)\n", a, a, a + 1);
				break;
			case OP_RANGE_EXC: // OPCODE(RANGE_EXC,  B)        /* R(a) = range_new(R(a),R(a+1),TRUE) */
				a = *p++;
				x_printf("r[%d] = range_new(r[%d],r[%d],TRUE)\n", a, a, a + 1);
				break;
#endif
/*
			case OP_ARGARY: // OPCODE(ARGARY,     BS)        R(a) = argument array (16=m5:r1:m5:d1:lv4)
				a = *p++; b = *p++; b = (b << 8) + *p++;
				int m1 = (b >> 11) & 0x3f;
				int r  = (b >> 10) & 0x1;
				int m2 = (b >> 5) & 0x1f;
				int kd = (b >> 4) & 0x1;
				int lv = b & 0xf;
				x_printf("r[%d] = argument array(m1:%d, r:%d, m2:%d, kd:%d, lv:%d)\n", a, m1, r, m2, kd, lv);
				break;
				*/
#ifdef SUPPORT_CLASS
			case OP_CLASS: // OPCODE(CLASS,      BB)       /* R(a) = newclass(R(a),Syms(b),R(a+1)) */
				a = *p++; b = *p++;
				const char* cls = (const char*)(irep_get(irep, IREP_TYPE_SYMBOL, b) + 2);
				x_printf("r[%d].newclass(r[%d], sym[%d], r[%d]) %s:nclass%d\n", a, a, b, a + 1, cls, vm->nmemory); // -> global const?
				reg[a] = vm->nobject++; // object number
				mrb_memory_add(vm, MRB_OBJ_CONST, cls, reg[a]);
				break;
			case OP_EXEC: // OPCODE(EXEC,       BB)       /* R(a) = blockexec(R(a),SEQ[b]) */
				a = *p++; b = *p++;
				x_printf("r[%d] = blockexec(r[%d]) at block:r[%d]\n", a, a, b);
				const char* funce = (const char*)(irep_get(irep, IREP_TYPE_SYMBOL, b) + 2);
				x_printf("funce:%s %d\n", funce, b);
				const uint8_t* method = irep_get(irep, IREP_TYPE_IREP, b);
				reg[a] = irep_exec(vm, method, &state, a);
				break;
#endif
			case OP_DEF: // OPCODE(DEF,        BB)       /* R(a).newmethod(Syms(b),R(a+1)) */
				a = *p++; b = *p++;
				const char* funcm = (const char*)(irep_get(irep, IREP_TYPE_SYMBOL, b) + 2);
				x_printf("r[%d].newmethod(sym[%d], r[%d]) %s:nmethod%d\n", a, b, a + 1, funcm, vm->nmemory);
				// class r]a] # 
				mrb_memory_add(vm, reg[a], funcm, reg[a + 1]);
				break;
			case OP_TCLASS:
				a = *p++;
				reg[a] = reg[0]; // ??
				x_printf("r[%d] = target_class %ld\n", a, reg[0]);
				break;
			case OP_STOP:
				x_printf("stop\n");
				return 0;
			case OP_EXT1:
			case OP_EXT2:
			case OP_EXT3:
				opext = op - OP_EXT1 + 1;
				x_printf("OP_EXT%d\n", opext);
				break;
			default:
				x_printf("!! unsupported op code %d\n", op);
				vm->err = MRB_ERR_UNSUPPORTED_OPCODE;
				break;
		}
		if (vm->err) {
			return vm->err;
		}
	}
}

// for mrb 2.0 binary
#define mrb_getIREP(mrb) ((mrb) + 34)
#define mrb_run(vm, mrb) irep_exec((vm), mrb_getIREP(mrb), NULL, 0)

intptr_t irep_atol(const char* s) {
	int flg = 0;
	if (*s == '-') {
		flg = 1;
		s++;
	} else if (*s == '+') {
		s++;
	}
	intptr_t n = 0;
	for (;;) {
		int c = *s++;
		if (c < '0' || c > '9') {
			break;
		}
		n = n * 10 + (c - '0');
	}
	return flg ? -n : n;
}
int mrb_strcmp(const char* buf1, const char* buf2) {
	for (;;) {
		int n = *buf1++;
		int c = n - *buf2++;
		if (c)
			return c;
		if (!n)
			return 0;
	}
}
