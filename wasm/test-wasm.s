	.text
	.file	"test-wasm.c"
	.hidden	irep_get
	.globl	irep_get
	.type	irep_get,@function
irep_get:                               # @irep_get
	.param  	i32, i32, i32
	.result 	i32
	.local  	i32, i32, i32, i32
# BB#0:                                 # %entry
	i32.const	$push1=, 14
	i32.add 	$push53=, $0, $pop1
	tee_local	$push52=, $6=, $pop53
	i32.const	$push2=, 4
	i32.const	$push51=, 3
	i32.and 	$push50=, $6, $pop51
	tee_local	$push49=, $3=, $pop50
	i32.sub 	$push3=, $pop2, $pop49
	i32.add 	$push4=, $pop52, $pop3
	i32.select	$push5=, $pop4, $6, $3
	i32.load8_u	$push6=, 12($0)
	i32.const	$push48=, 8
	i32.shl 	$push7=, $pop6, $pop48
	i32.load8_u	$push8=, 13($0)
	i32.or  	$push9=, $pop7, $pop8
	i32.add 	$push47=, $pop5, $pop9
	tee_local	$push46=, $3=, $pop47
	i32.const	$push45=, 4
	i32.add 	$6=, $pop46, $pop45
	i32.load8_u	$4=, 8($0)
	i32.load8_u	$5=, 9($0)
	block   	
	i32.load8_u	$push10=, 2($3)
	i32.const	$push44=, 8
	i32.shl 	$push11=, $pop10, $pop44
	i32.const	$push43=, 3
	i32.add 	$push12=, $3, $pop43
	i32.load8_u	$push13=, 0($pop12)
	i32.or  	$push14=, $pop11, $pop13
	i32.const	$push15=, 1
	i32.eq  	$push42=, $1, $pop15
	tee_local	$push41=, $3=, $pop42
	i32.select	$push40=, $2, $pop14, $pop41
	tee_local	$push39=, $0=, $pop40
	i32.const	$push38=, 1
	i32.lt_s	$push16=, $pop39, $pop38
	br_if   	0, $pop16       # 0: down to label0
# BB#1:
.LBB0_2:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	loop    	                # label1:
	i32.load8_u	$push18=, 1($6)
	i32.const	$push58=, 8
	i32.shl 	$push19=, $pop18, $pop58
	i32.load8_u	$push20=, 2($6)
	i32.or  	$push21=, $pop19, $pop20
	i32.add 	$push22=, $6, $pop21
	i32.const	$push57=, 3
	i32.add 	$6=, $pop22, $pop57
	i32.const	$push56=, -1
	i32.add 	$push55=, $0, $pop56
	tee_local	$push54=, $0=, $pop55
	br_if   	0, $pop54       # 0: up to label1
.LBB0_3:                                # %for.cond.cleanup
	end_loop
	end_block                       # label0:
	block   	
	br_if   	0, $3           # 0: down to label2
# BB#4:                                 # %cleanup.cont
	i32.load8_u	$0=, 2($6)
	i32.load8_u	$3=, 3($6)
	i32.const	$push28=, 4
	i32.add 	$6=, $6, $pop28
	block   	
	i32.const	$push63=, 8
	i32.shl 	$push24=, $0, $pop63
	i32.or  	$push25=, $3, $pop24
	i32.const	$push23=, 2
	i32.eq  	$push62=, $1, $pop23
	tee_local	$push61=, $3=, $pop62
	i32.select	$push60=, $2, $pop25, $pop61
	tee_local	$push59=, $0=, $pop60
	i32.const	$push26=, 1
	i32.lt_s	$push27=, $pop59, $pop26
	br_if   	0, $pop27       # 0: down to label3
# BB#5:
.LBB0_6:                                # %for.body36
                                        # =>This Inner Loop Header: Depth=1
	loop    	                # label4:
	i32.load8_u	$push29=, 0($6)
	i32.const	$push68=, 8
	i32.shl 	$push30=, $pop29, $pop68
	i32.load8_u	$push31=, 1($6)
	i32.or  	$push32=, $pop30, $pop31
	i32.add 	$push33=, $6, $pop32
	i32.const	$push67=, 3
	i32.add 	$6=, $pop33, $pop67
	i32.const	$push66=, -1
	i32.add 	$push65=, $0, $pop66
	tee_local	$push64=, $0=, $pop65
	br_if   	0, $pop64       # 0: up to label4
.LBB0_7:                                # %for.cond.cleanup35
	end_loop
	end_block                       # label3:
	br_if   	0, $3           # 0: down to label2
# BB#8:                                 # %cleanup.cont53
	i32.const	$push71=, 8
	i32.shl 	$push17=, $4, $pop71
	i32.or  	$push0=, $pop17, $5
	i32.const	$push34=, 3
	i32.eq  	$push35=, $1, $pop34
	i32.select	$push70=, $2, $pop0, $pop35
	tee_local	$push69=, $0=, $pop70
	i32.const	$push36=, 1
	i32.lt_s	$push37=, $pop69, $pop36
	br_if   	0, $pop37       # 0: down to label2
# BB#9:                                 # %for.body63.preheader
.LBB0_10:                               # %for.body63
                                        # =>This Inner Loop Header: Depth=1
	loop    	                # label5:
	i32.const	$push76=, 0
	i32.const	$push75=, 0
	i32.call	$6=, irep_get@FUNCTION, $6, $pop76, $pop75
	i32.const	$push74=, -1
	i32.add 	$push73=, $0, $pop74
	tee_local	$push72=, $0=, $pop73
	br_if   	0, $pop72       # 0: up to label5
.LBB0_11:                               # %cleanup73
	end_loop
	end_block                       # label2:
	copy_local	$push77=, $6
                                        # fallthrough-return: $pop77
	.endfunc
.Lfunc_end0:
	.size	irep_get, .Lfunc_end0-irep_get

	.hidden	showRegs
	.globl	showRegs
	.type	showRegs,@function
showRegs:                               # @showRegs
	.param  	i32, i32
# BB#0:                                 # %entry
                                        # fallthrough-return
	.endfunc
.Lfunc_end1:
	.size	showRegs, .Lfunc_end1-showRegs

	.hidden	mrb_memory_find
	.globl	mrb_memory_find
	.type	mrb_memory_find,@function
mrb_memory_find:                        # @mrb_memory_find
	.param  	i32, i32, i32
	.result 	i32
	.local  	i32, i32, i32, i32, i32, i32
# BB#0:                                 # %entry
	block   	
	block   	
	i32.load	$push10=, 4($0)
	tee_local	$push9=, $7=, $pop10
	i32.const	$push8=, 1
	i32.lt_s	$push0=, $pop9, $pop8
	br_if   	0, $pop0        # 0: down to label7
# BB#1:                                 # %for.body.preheader
	i32.const	$push11=, 3
	i32.mul 	$3=, $7, $pop11
	i32.const	$5=, 0
.LBB2_2:                                # %for.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_4 Depth 2
	loop    	                # label8:
	block   	
	i32.const	$push17=, 2
	i32.shl 	$push1=, $5, $pop17
	i32.add 	$push16=, $0, $pop1
	tee_local	$push15=, $7=, $pop16
	i32.const	$push14=, 8
	i32.add 	$push13=, $pop15, $pop14
	tee_local	$push12=, $8=, $pop13
	i32.load	$push2=, 0($pop12)
	i32.ne  	$push3=, $pop2, $1
	br_if   	0, $pop3        # 0: down to label9
# BB#3:                                 # %land.lhs.true
                                        #   in Loop: Header=BB2_2 Depth=1
	i32.const	$push18=, 12
	i32.add 	$push4=, $7, $pop18
	i32.load	$7=, 0($pop4)
	copy_local	$6=, $2
.LBB2_4:                                # %for.cond.i
                                        #   Parent Loop BB2_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	loop    	                # label10:
	i32.load8_u	$push20=, 0($7)
	tee_local	$push19=, $4=, $pop20
	i32.load8_u	$push5=, 0($6)
	i32.ne  	$push6=, $pop19, $pop5
	br_if   	1, $pop6        # 1: down to label9
# BB#5:                                 # %cleanup.i
                                        #   in Loop: Header=BB2_4 Depth=2
	i32.const	$push22=, 1
	i32.add 	$7=, $7, $pop22
	i32.const	$push21=, 1
	i32.add 	$6=, $6, $pop21
	br_if   	0, $4           # 0: up to label10
	br      	4               # 4: down to label6
.LBB2_6:                                # %for.inc
                                        #   in Loop: Header=BB2_2 Depth=1
	end_loop
	end_block                       # label9:
	i32.const	$push25=, 3
	i32.add 	$push24=, $5, $pop25
	tee_local	$push23=, $5=, $pop24
	i32.lt_s	$push7=, $pop23, $3
	br_if   	0, $pop7        # 0: up to label8
.LBB2_7:
	end_loop
	end_block                       # label7:
	i32.const	$8=, 0
.LBB2_8:                                # %cleanup
	end_block                       # label6:
	copy_local	$push26=, $8
                                        # fallthrough-return: $pop26
	.endfunc
.Lfunc_end2:
	.size	mrb_memory_find, .Lfunc_end2-mrb_memory_find

	.hidden	mrb_strcmp
	.globl	mrb_strcmp
	.type	mrb_strcmp,@function
mrb_strcmp:                             # @mrb_strcmp
	.param  	i32, i32
	.result 	i32
	.local  	i32, i32
# BB#0:                                 # %entry
.LBB3_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	block   	
	loop    	                # label12:
	i32.load8_s	$push4=, 0($0)
	tee_local	$push3=, $2=, $pop4
	i32.load8_s	$push0=, 0($1)
	i32.sub 	$push2=, $pop3, $pop0
	tee_local	$push1=, $3=, $pop2
	br_if   	1, $pop1        # 1: down to label11
# BB#2:                                 # %cleanup
                                        #   in Loop: Header=BB3_1 Depth=1
	i32.const	$push6=, 1
	i32.add 	$0=, $0, $pop6
	i32.const	$push5=, 1
	i32.add 	$1=, $1, $pop5
	br_if   	0, $2           # 0: up to label12
# BB#3:
	end_loop
	i32.const	$3=, 0
.LBB3_4:                                # %return
	end_block                       # label11:
	copy_local	$push7=, $3
                                        # fallthrough-return: $pop7
	.endfunc
.Lfunc_end3:
	.size	mrb_strcmp, .Lfunc_end3-mrb_strcmp

	.hidden	mrb_memory_add
	.globl	mrb_memory_add
	.type	mrb_memory_add,@function
mrb_memory_add:                         # @mrb_memory_add
	.param  	i32, i32, i32, i32
	.result 	i32
	.local  	i32
# BB#0:                                 # %entry
	block   	
	i32.call	$push17=, mrb_memory_find@FUNCTION, $0, $1, $2
	tee_local	$push16=, $4=, $pop17
	i32.eqz 	$push26=, $pop16
	br_if   	0, $pop26       # 0: down to label13
# BB#1:                                 # %if.then
	i32.store	8($4), $3
	i32.const	$push15=, 1
	return  	$pop15
.LBB4_2:                                # %if.end
	end_block                       # label13:
	block   	
	i32.load	$push19=, 4($0)
	tee_local	$push18=, $4=, $pop19
	i32.const	$push0=, 20
	i32.ne  	$push1=, $pop18, $pop0
	br_if   	0, $pop1        # 0: down to label14
# BB#3:                                 # %if.then1
	i32.const	$push12=, 3
	i32.store	0($0), $pop12
	i32.const	$push14=, 0
	return  	$pop14
.LBB4_4:                                # %if.end2
	end_block                       # label14:
	i32.const	$push2=, 12
	i32.mul 	$push3=, $4, $pop2
	i32.add 	$push25=, $0, $pop3
	tee_local	$push24=, $4=, $pop25
	i32.const	$push4=, 16
	i32.add 	$push5=, $pop24, $pop4
	i32.store	0($pop5), $3
	i32.const	$push23=, 12
	i32.add 	$push6=, $4, $pop23
	i32.store	0($pop6), $2
	i32.const	$push7=, 8
	i32.add 	$push8=, $4, $pop7
	i32.store	0($pop8), $1
	i32.const	$push9=, 4
	i32.add 	$push22=, $0, $pop9
	tee_local	$push21=, $0=, $pop22
	i32.load	$push10=, 0($0)
	i32.const	$push13=, 1
	i32.add 	$push11=, $pop10, $pop13
	i32.store	0($pop21), $pop11
	i32.const	$push20=, 1
                                        # fallthrough-return: $pop20
	.endfunc
.Lfunc_end4:
	.size	mrb_memory_add, .Lfunc_end4-mrb_memory_add

	.hidden	irep_exec
	.globl	irep_exec
	.type	irep_exec,@function
irep_exec:                              # @irep_exec
	.param  	i32, i32, i32, i32
	.result 	i32
	.local  	i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32
# BB#0:                                 # %entry
	i32.const	$push353=, 0
	i32.const	$push351=, 0
	i32.load	$push350=, __stack_pointer($pop351)
	i32.const	$push352=, 32
	i32.sub 	$push373=, $pop350, $pop352
	tee_local	$push372=, $12=, $pop373
	i32.store	__stack_pointer($pop353), $pop372
	i32.const	$push349=, 0
	i32.load8_u	$push0=, 6($1)
	i32.const	$push1=, 8
	i32.shl 	$push2=, $pop0, $pop1
	i32.load8_u	$push3=, 7($1)
	i32.or  	$push4=, $pop2, $pop3
	i32.const	$push371=, 2
	i32.shl 	$push5=, $pop4, $pop371
	i32.const	$push6=, 11
	i32.add 	$push7=, $pop5, $pop6
	i32.const	$push8=, 524272
	i32.and 	$push9=, $pop7, $pop8
	i32.sub 	$push370=, $12, $pop9
	tee_local	$push369=, $4=, $pop370
	copy_local	$push361=, $pop369
	i32.store	__stack_pointer($pop349), $pop361
	copy_local	$push368=, $12
	tee_local	$push367=, $14=, $pop368
	i32.store	4($pop367), $4
	i32.store	0($14), $2
	i32.const	$push10=, 14
	i32.add 	$push366=, $1, $pop10
	tee_local	$push365=, $12=, $pop366
	i32.const	$push364=, 4
	i32.const	$push11=, 3
	i32.and 	$push363=, $12, $pop11
	tee_local	$push362=, $13=, $pop363
	i32.sub 	$push12=, $pop364, $pop362
	i32.add 	$10=, $pop365, $pop12
	i32.const	$8=, 1
	block   	
	i32.eqz 	$push490=, $3
	br_if   	0, $pop490      # 0: down to label15
# BB#1:                                 # %cond.true
	i32.const	$push375=, 4
	i32.add 	$push14=, $2, $pop375
	i32.load	$push15=, 0($pop14)
	i32.const	$push374=, 2
	i32.shl 	$push13=, $3, $pop374
	i32.add 	$push16=, $pop15, $pop13
	i32.load	$8=, 0($pop16)
.LBB5_2:                                # %cond.end
	end_block                       # label15:
	i32.store	0($4), $8
	i32.const	$push379=, 1
	i32.add 	$7=, $3, $pop379
	i32.const	$push378=, 4
	i32.add 	$6=, $4, $pop378
	i32.const	$11=, 0
	i32.select	$push377=, $10, $12, $13
	tee_local	$push376=, $5=, $pop377
	copy_local	$12=, $pop376
.LBB5_3:                                # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_36 Depth 2
                                        #     Child Loop BB5_28 Depth 2
                                        #     Child Loop BB5_33 Depth 2
                                        #     Child Loop BB5_23 Depth 2
                                        #     Child Loop BB5_11 Depth 2
	block   	
	loop    	                # label17:
	block   	
	block   	
	block   	
	block   	
	block   	
	copy_local	$push390=, $12
	tee_local	$push389=, $3=, $pop390
	i32.load8_u	$push388=, 0($pop389)
	tee_local	$push387=, $8=, $pop388
	i32.const	$push386=, 103
	i32.gt_u	$push17=, $pop387, $pop386
	br_if   	0, $pop17       # 0: down to label22
# BB#4:                                 # %for.cond
                                        #   in Loop: Header=BB5_3 Depth=1
	i32.const	$push391=, 1
	i32.add 	$12=, $3, $pop391
	i32.const	$13=, 0
	block   	
	block   	
	block   	
	block   	
	block   	
	block   	
	block   	
	block   	
	block   	
	block   	
	block   	
	block   	
	block   	
	block   	
	block   	
	block   	
	block   	
	block   	
	block   	
	block   	
	block   	
	block   	
	block   	
	block   	
	block   	
	block   	
	block   	
	block   	
	block   	
	block   	
	block   	
	block   	
	block   	
	block   	
	br_table 	$8, 38, 7, 8, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 10, 11, 3, 3, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 4, 4, 12, 5, 5, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 13, 14, 34, 34, 34, 15, 34, 34, 34, 33, 33, 33, 34, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 34, 34, 34, 34, 34, 34, 34, 34, 34, 27, 28, 34, 34, 34, 34, 6, 6, 34, 34, 34, 34, 34, 34, 29, 34, 34, 34, 30, 34, 34, 1, 1, 1, 40, 38 # 38: down to label18
                                        # 7: down to label49
                                        # 8: down to label48
                                        # 2: down to label54
                                        # 0: down to label56
                                        # 9: down to label47
                                        # 10: down to label46
                                        # 11: down to label45
                                        # 3: down to label53
                                        # 34: down to label22
                                        # 4: down to label52
                                        # 12: down to label44
                                        # 5: down to label51
                                        # 13: down to label43
                                        # 14: down to label42
                                        # 15: down to label41
                                        # 33: down to label23
                                        # 16: down to label40
                                        # 17: down to label39
                                        # 18: down to label38
                                        # 19: down to label37
                                        # 20: down to label36
                                        # 21: down to label35
                                        # 22: down to label34
                                        # 23: down to label33
                                        # 24: down to label32
                                        # 25: down to label31
                                        # 26: down to label30
                                        # 27: down to label29
                                        # 28: down to label28
                                        # 6: down to label50
                                        # 29: down to label27
                                        # 30: down to label26
                                        # 1: down to label55
                                        # 40: down to label16
.LBB5_5:                                # %sw.bb57
                                        #   in Loop: Header=BB5_3 Depth=1
	end_block                       # label56:
	i32.const	$push306=, 1
	i32.add 	$push307=, $3, $pop306
	i32.load8_u	$push308=, 0($pop307)
	i32.const	$push309=, 2
	i32.shl 	$push310=, $pop308, $pop309
	i32.add 	$push311=, $4, $pop310
	i32.const	$push304=, -6
	i32.add 	$push305=, $8, $pop304
	i32.store	0($pop311), $pop305
	i32.const	$push392=, 2
	i32.add 	$12=, $3, $pop392
	br      	37              # 37: down to label18
.LBB5_6:                                # %sw.bb395
                                        #   in Loop: Header=BB5_3 Depth=1
	end_block                       # label55:
	i32.const	$push18=, -99
	i32.add 	$11=, $8, $pop18
	br      	36              # 36: down to label18
.LBB5_7:                                # %sw.bb40
                                        #   in Loop: Header=BB5_3 Depth=1
	end_block                       # label54:
	i32.const	$push313=, 1
	i32.add 	$push314=, $3, $pop313
	i32.load8_u	$10=, 0($pop314)
	i32.load8_u	$13=, 2($3)
	i32.const	$push393=, 2
	i32.ne  	$push312=, $11, $pop393
	br_if   	28, $pop312     # 28: down to label25
# BB#8:                                 # %if.then46
                                        #   in Loop: Header=BB5_3 Depth=1
	i32.const	$push315=, 8
	i32.shl 	$push316=, $13, $pop315
	i32.const	$push394=, 3
	i32.add 	$push317=, $3, $pop394
	i32.load8_u	$push318=, 0($pop317)
	i32.or  	$13=, $pop316, $pop318
	i32.const	$push319=, 4
	i32.add 	$12=, $3, $pop319
	br      	29              # 29: down to label24
.LBB5_9:                                # %sw.bb84
                                        #   in Loop: Header=BB5_3 Depth=1
	end_block                       # label53:
	i32.const	$push274=, 1
	i32.add 	$push275=, $3, $pop274
	i32.load8_u	$push276=, 0($pop275)
	i32.const	$push277=, 2
	i32.shl 	$push278=, $pop276, $pop277
	i32.add 	$push279=, $4, $pop278
	i32.const	$push272=, 17
	i32.eq  	$push273=, $8, $pop272
	i32.store	0($pop279), $pop273
	i32.const	$push395=, 2
	i32.add 	$12=, $3, $pop395
	br      	34              # 34: down to label18
.LBB5_10:                               # %sw.bb95
                                        #   in Loop: Header=BB5_3 Depth=1
	end_block                       # label52:
	i32.const	$push261=, 1
	i32.add 	$push262=, $3, $pop261
	i32.load8_u	$10=, 0($pop262)
	i32.load8_u	$9=, 2($3)
	i32.load	$13=, 0($14)
	block   	
	i32.load8_u	$push397=, 3($3)
	tee_local	$push396=, $12=, $pop397
	i32.eqz 	$push491=, $pop396
	br_if   	0, $pop491      # 0: down to label57
.LBB5_11:                               # %for.body
                                        #   Parent Loop BB5_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	loop    	                # label58:
	i32.load	$13=, 0($13)
	i32.const	$push263=, -1
	i32.add 	$push399=, $12, $pop263
	tee_local	$push398=, $12=, $pop399
	br_if   	0, $pop398      # 0: up to label58
.LBB5_12:                               # %for.cond.cleanup
                                        #   in Loop: Header=BB5_3 Depth=1
	end_loop
	end_block                       # label57:
	i32.const	$push407=, 4
	i32.add 	$12=, $3, $pop407
	i32.const	$push265=, 2
	i32.shl 	$push268=, $10, $pop265
	i32.add 	$push406=, $4, $pop268
	tee_local	$push405=, $3=, $pop406
	i32.load	$push267=, 4($13)
	i32.const	$push404=, 2
	i32.shl 	$push266=, $9, $pop404
	i32.add 	$push403=, $pop267, $pop266
	tee_local	$push402=, $13=, $pop403
	i32.const	$push264=, 31
	i32.eq  	$push401=, $8, $pop264
	tee_local	$push400=, $8=, $pop401
	i32.select	$push269=, $pop405, $pop402, $pop400
	i32.select	$push270=, $13, $3, $8
	i32.load	$push271=, 0($pop270)
	i32.store	0($pop269), $pop271
	br      	33              # 33: down to label18
.LBB5_13:                               # %sw.bb126
                                        #   in Loop: Header=BB5_3 Depth=1
	end_block                       # label51:
	i32.const	$push246=, 4
	i32.add 	$push247=, $3, $pop246
	i32.load8_u	$push248=, 2($3)
	i32.const	$push249=, 8
	i32.shl 	$push250=, $pop248, $pop249
	i32.load8_u	$push251=, 3($3)
	i32.or  	$push252=, $pop250, $pop251
	i32.add 	$push253=, $5, $pop252
	i32.const	$push234=, 34
	i32.eq  	$push235=, $8, $pop234
	i32.const	$push236=, 1
	i32.add 	$push237=, $3, $pop236
	i32.load8_u	$push238=, 0($pop237)
	i32.const	$push239=, 2
	i32.shl 	$push240=, $pop238, $pop239
	i32.add 	$push241=, $4, $pop240
	i32.load	$push242=, 0($pop241)
	i32.const	$push243=, -2147483648
	i32.ne  	$push244=, $pop242, $pop243
	i32.xor 	$push245=, $pop235, $pop244
	i32.select	$12=, $pop247, $pop253, $pop245
	br      	32              # 32: down to label18
.LBB5_14:                               # %sw.bb365
                                        #   in Loop: Header=BB5_3 Depth=1
	end_block                       # label50:
	i32.const	$push39=, 1
	i32.add 	$push40=, $3, $pop39
	i32.load8_u	$push41=, 0($pop40)
	i32.const	$push45=, 2
	i32.shl 	$push46=, $pop41, $pop45
	i32.add 	$push47=, $4, $pop46
	i32.const	$push43=, 3
	i32.load8_u	$push42=, 2($3)
	i32.call	$push44=, irep_get@FUNCTION, $1, $pop43, $pop42
	i32.store	0($pop47), $pop44
	i32.const	$push408=, 3
	i32.add 	$12=, $3, $pop408
	br      	31              # 31: down to label18
.LBB5_15:                               # %sw.bb23
                                        #   in Loop: Header=BB5_3 Depth=1
	end_block                       # label49:
	i32.const	$push338=, 1
	i32.add 	$push339=, $3, $pop338
	i32.load8_u	$push340=, 0($pop339)
	i32.const	$push341=, 2
	i32.shl 	$push342=, $pop340, $pop341
	i32.add 	$push343=, $4, $pop342
	i32.load8_u	$push344=, 2($3)
	i32.const	$push409=, 2
	i32.shl 	$push345=, $pop344, $pop409
	i32.add 	$push346=, $4, $pop345
	i32.load	$push347=, 0($pop346)
	i32.store	0($pop343), $pop347
	i32.const	$push348=, 3
	i32.add 	$12=, $3, $pop348
	br      	30              # 30: down to label18
.LBB5_16:                               # %sw.bb31
                                        #   in Loop: Header=BB5_3 Depth=1
	end_block                       # label48:
	i32.const	$push327=, 1
	i32.add 	$push328=, $3, $pop327
	i32.load8_u	$push329=, 0($pop328)
	i32.const	$push335=, 2
	i32.shl 	$push336=, $pop329, $pop335
	i32.add 	$push337=, $4, $pop336
	i32.const	$push411=, 1
	i32.load8_u	$push330=, 2($3)
	i32.call	$push331=, irep_get@FUNCTION, $1, $pop411, $pop330
	i32.const	$push332=, 3
	i32.add 	$push333=, $pop331, $pop332
	i32.call	$push334=, irep_atol@FUNCTION, $pop333
	i32.store	0($pop337), $pop334
	i32.const	$push410=, 3
	i32.add 	$12=, $3, $pop410
	br      	29              # 29: down to label18
.LBB5_17:                               # %sw.bb65
                                        #   in Loop: Header=BB5_3 Depth=1
	end_block                       # label47:
	i32.const	$push294=, 1
	i32.add 	$push295=, $3, $pop294
	i32.load8_u	$push296=, 0($pop295)
	i32.const	$push298=, 2
	i32.shl 	$push301=, $pop296, $pop298
	i32.add 	$push302=, $4, $pop301
	i32.const	$push413=, 2
	i32.load8_u	$push297=, 2($3)
	i32.call	$push299=, irep_get@FUNCTION, $1, $pop413, $pop297
	i32.const	$push412=, 2
	i32.add 	$push300=, $pop299, $pop412
	i32.store	0($pop302), $pop300
	i32.const	$push303=, 3
	i32.add 	$12=, $3, $pop303
	br      	28              # 28: down to label18
.LBB5_18:                               # %sw.bb74
                                        #   in Loop: Header=BB5_3 Depth=1
	end_block                       # label46:
	i32.const	$push287=, 1
	i32.add 	$push288=, $3, $pop287
	i32.load8_u	$push289=, 0($pop288)
	i32.const	$push290=, 2
	i32.shl 	$push291=, $pop289, $pop290
	i32.add 	$push292=, $4, $pop291
	i32.const	$push293=, -2147483648
	i32.store	0($pop292), $pop293
	i32.const	$push414=, 2
	i32.add 	$12=, $3, $pop414
	br      	27              # 27: down to label18
.LBB5_19:                               # %sw.bb78
                                        #   in Loop: Header=BB5_3 Depth=1
	end_block                       # label45:
	i32.const	$push280=, 1
	i32.add 	$push281=, $3, $pop280
	i32.load8_u	$push282=, 0($pop281)
	i32.const	$push283=, 2
	i32.shl 	$push284=, $pop282, $pop283
	i32.add 	$push285=, $4, $pop284
	i32.load	$push286=, 0($4)
	i32.store	0($pop285), $pop286
	i32.const	$push415=, 2
	i32.add 	$12=, $3, $pop415
	br      	26              # 26: down to label18
.LBB5_20:                               # %sw.bb119
                                        #   in Loop: Header=BB5_3 Depth=1
	end_block                       # label44:
	i32.const	$push254=, 1
	i32.add 	$push255=, $3, $pop254
	i32.load8_u	$push256=, 0($pop255)
	i32.const	$push257=, 8
	i32.shl 	$push258=, $pop256, $pop257
	i32.load8_u	$push259=, 2($3)
	i32.or  	$push260=, $pop258, $pop259
	i32.add 	$12=, $5, $pop260
	br      	25              # 25: down to label18
.LBB5_21:                               # %sw.bb154
                                        #   in Loop: Header=BB5_3 Depth=1
	end_block                       # label43:
	i32.const	$push211=, 1
	i32.add 	$push212=, $3, $pop211
	i32.load8_u	$10=, 0($pop212)
	i32.const	$push215=, 4
	i32.add 	$12=, $3, $pop215
	block   	
	i32.const	$push422=, 1
	i32.const	$push421=, 2
	i32.load8_u	$push213=, 2($3)
	i32.call	$push214=, irep_get@FUNCTION, $1, $pop421, $pop213
	i32.const	$push420=, 2
	i32.add 	$push419=, $pop214, $pop420
	tee_local	$push418=, $13=, $pop419
	i32.call	$push417=, mrb_memory_find@FUNCTION, $0, $pop422, $pop418
	tee_local	$push416=, $3=, $pop417
	br_if   	0, $pop416      # 0: down to label59
# BB#22:                                # %for.cond.i.i.preheader
                                        #   in Loop: Header=BB5_3 Depth=1
	i32.const	$3=, 0
.LBB5_23:                               # %for.cond.i.i
                                        #   Parent Loop BB5_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	loop    	                # label60:
	i32.add 	$push223=, $13, $3
	i32.load8_u	$push381=, 0($pop223)
	tee_local	$push380=, $8=, $pop381
	i32.const	$push220=, .L.str.55
	i32.add 	$push221=, $3, $pop220
	i32.load8_u	$push222=, 0($pop221)
	i32.ne  	$push224=, $pop380, $pop222
	br_if   	23, $pop224     # 23: down to label21
# BB#24:                                # %cleanup.i.i
                                        #   in Loop: Header=BB5_23 Depth=2
	i32.const	$push382=, 1
	i32.add 	$3=, $3, $pop382
	br_if   	0, $8           # 0: up to label60
# BB#25:                                # %if.then.i
                                        #   in Loop: Header=BB5_3 Depth=1
	end_loop
	i32.const	$push225=, 2
	i32.shl 	$push226=, $10, $pop225
	i32.add 	$push385=, $4, $pop226
	tee_local	$push384=, $3=, $pop385
	i32.const	$push383=, 1
	i32.const	$push232=, -2147483648
	i32.load	$push227=, 0($3)
	i32.const	$push228=, 4
	i32.add 	$push229=, $3, $pop228
	i32.load	$push230=, 0($pop229)
	i32.ne  	$push231=, $pop227, $pop230
	i32.select	$push233=, $pop383, $pop232, $pop231
	i32.store	0($pop384), $pop233
	br      	25              # 25: down to label18
.LBB5_26:                               # %if.then173
                                        #   in Loop: Header=BB5_3 Depth=1
	end_block                       # label59:
	i32.const	$push423=, 2
	i32.shl 	$push218=, $10, $pop423
	i32.add 	$push219=, $4, $pop218
	i32.load	$push216=, 8($3)
	i32.call	$push217=, irep_exec@FUNCTION, $0, $pop216, $14, $10
	i32.store	0($pop219), $pop217
	br      	24              # 24: down to label18
.LBB5_27:                               # %sw.bb178
                                        #   in Loop: Header=BB5_3 Depth=1
	end_block                       # label42:
	i32.const	$push190=, 1
	i32.add 	$push191=, $3, $pop190
	i32.load8_u	$10=, 0($pop191)
	i32.const	$push193=, 2
	i32.load8_u	$push192=, 2($3)
	i32.call	$push194=, irep_get@FUNCTION, $1, $pop193, $pop192
	i32.const	$push424=, 2
	i32.add 	$13=, $pop194, $pop424
	i32.const	$push195=, 4
	i32.add 	$12=, $3, $pop195
	i32.const	$3=, 0
.LBB5_28:                               # %for.cond.i
                                        #   Parent Loop BB5_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	loop    	                # label61:
	i32.add 	$push199=, $13, $3
	i32.load8_u	$push426=, 0($pop199)
	tee_local	$push425=, $8=, $pop426
	i32.const	$push196=, .L.str.29
	i32.add 	$push197=, $3, $pop196
	i32.load8_u	$push198=, 0($pop197)
	i32.ne  	$push200=, $pop425, $pop198
	br_if   	24, $pop200     # 24: down to label18
# BB#29:                                # %cleanup.i
                                        #   in Loop: Header=BB5_28 Depth=2
	i32.const	$push427=, 1
	i32.add 	$3=, $3, $pop427
	br_if   	0, $8           # 0: up to label61
# BB#30:                                # %if.then201
                                        #   in Loop: Header=BB5_3 Depth=1
	end_loop
	i32.const	$push201=, 2
	i32.shl 	$push202=, $10, $pop201
	i32.add 	$push430=, $4, $pop202
	tee_local	$push429=, $9=, $pop430
	i32.const	$push203=, 4
	i32.add 	$push204=, $pop429, $pop203
	i32.load	$10=, 0($pop204)
	i32.load	$8=, 0($9)
	i32.store	8($14), $14
	i32.const	$push205=, -2147483648
	i32.store	20($14), $pop205
	i32.const	$push357=, 20
	i32.add 	$push358=, $14, $pop357
	i32.store	12($14), $pop358
	block   	
	i32.const	$push428=, 1
	i32.ge_s	$push206=, $8, $pop428
	br_if   	0, $pop206      # 0: down to label62
# BB#31:                                #   in Loop: Header=BB5_3 Depth=1
	i32.const	$13=, 0
	br      	23              # 23: down to label19
.LBB5_32:                               # %for.body.i.preheader
                                        #   in Loop: Header=BB5_3 Depth=1
	end_block                       # label62:
	i32.const	$3=, 0
.LBB5_33:                               # %for.body.i
                                        #   Parent Loop BB5_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	loop    	                # label63:
	i32.const	$push207=, 24
	i32.add 	$push208=, $14, $pop207
	i32.store	0($pop208), $3
	i32.const	$push359=, 8
	i32.add 	$push360=, $14, $pop359
	i32.const	$push209=, 1
	i32.call	$13=, irep_exec@FUNCTION, $0, $10, $pop360, $pop209
	i32.const	$push433=, 1
	i32.add 	$push432=, $3, $pop433
	tee_local	$push431=, $3=, $pop432
	i32.ne  	$push210=, $8, $pop431
	br_if   	0, $pop210      # 0: up to label63
	br      	23              # 23: down to label19
.LBB5_34:                               # %sw.bb208
                                        #   in Loop: Header=BB5_3 Depth=1
	end_loop
	end_block                       # label41:
	i32.const	$push437=, 4
	i32.add 	$12=, $3, $pop437
	i32.const	$push181=, 1
	i32.add 	$push182=, $3, $pop181
	i32.load8_u	$push183=, 0($pop182)
	i32.const	$push436=, 2
	i32.shr_u	$push435=, $pop183, $pop436
	tee_local	$push434=, $13=, $pop435
	i32.eqz 	$push492=, $pop434
	br_if   	22, $pop492     # 22: down to label18
# BB#35:                                # %for.body223.lr.ph
                                        #   in Loop: Header=BB5_3 Depth=1
	i32.const	$push439=, 4
	i32.add 	$push185=, $2, $pop439
	i32.load	$push186=, 0($pop185)
	i32.const	$push438=, 2
	i32.shl 	$push184=, $7, $pop438
	i32.add 	$3=, $pop186, $pop184
	copy_local	$8=, $6
.LBB5_36:                               # %for.body223
                                        #   Parent Loop BB5_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	loop    	                # label64:
	i32.load	$push187=, 0($3)
	i32.store	0($8), $pop187
	i32.const	$push188=, 4
	i32.add 	$3=, $3, $pop188
	i32.const	$push442=, 4
	i32.add 	$8=, $8, $pop442
	i32.const	$push189=, -1
	i32.add 	$push441=, $13, $pop189
	tee_local	$push440=, $13=, $pop441
	br_if   	0, $pop440      # 0: up to label64
	br      	23              # 23: down to label18
.LBB5_37:                               # %sw.bb258
                                        #   in Loop: Header=BB5_3 Depth=1
	end_loop
	end_block                       # label40:
	i32.const	$push167=, 1
	i32.add 	$push168=, $3, $pop167
	i32.load8_u	$push169=, 0($pop168)
	i32.const	$push170=, 2
	i32.shl 	$push171=, $pop169, $pop170
	i32.add 	$push445=, $4, $pop171
	tee_local	$push444=, $12=, $pop445
	i32.load	$push172=, 0($12)
	i32.const	$push173=, 4
	i32.add 	$push174=, $12, $pop173
	i32.load	$push175=, 0($pop174)
	i32.add 	$push176=, $pop172, $pop175
	i32.store	0($pop444), $pop176
	i32.const	$push443=, 2
	i32.add 	$12=, $3, $pop443
	br      	21              # 21: down to label18
.LBB5_38:                               # %sw.bb266
                                        #   in Loop: Header=BB5_3 Depth=1
	end_block                       # label39:
	i32.const	$push158=, 1
	i32.add 	$push159=, $3, $pop158
	i32.load8_u	$push160=, 0($pop159)
	i32.const	$push161=, 2
	i32.shl 	$push162=, $pop160, $pop161
	i32.add 	$push447=, $4, $pop162
	tee_local	$push446=, $12=, $pop447
	i32.load	$push163=, 0($12)
	i32.load8_u	$push164=, 2($3)
	i32.add 	$push165=, $pop163, $pop164
	i32.store	0($pop446), $pop165
	i32.const	$push166=, 3
	i32.add 	$12=, $3, $pop166
	br      	20              # 20: down to label18
.LBB5_39:                               # %sw.bb273
                                        #   in Loop: Header=BB5_3 Depth=1
	end_block                       # label38:
	i32.const	$push148=, 1
	i32.add 	$push149=, $3, $pop148
	i32.load8_u	$push150=, 0($pop149)
	i32.const	$push151=, 2
	i32.shl 	$push152=, $pop150, $pop151
	i32.add 	$push450=, $4, $pop152
	tee_local	$push449=, $12=, $pop450
	i32.load	$push153=, 0($12)
	i32.const	$push154=, 4
	i32.add 	$push155=, $12, $pop154
	i32.load	$push156=, 0($pop155)
	i32.sub 	$push157=, $pop153, $pop156
	i32.store	0($pop449), $pop157
	i32.const	$push448=, 2
	i32.add 	$12=, $3, $pop448
	br      	19              # 19: down to label18
.LBB5_40:                               # %sw.bb281
                                        #   in Loop: Header=BB5_3 Depth=1
	end_block                       # label37:
	i32.const	$push139=, 1
	i32.add 	$push140=, $3, $pop139
	i32.load8_u	$push141=, 0($pop140)
	i32.const	$push142=, 2
	i32.shl 	$push143=, $pop141, $pop142
	i32.add 	$push452=, $4, $pop143
	tee_local	$push451=, $12=, $pop452
	i32.load	$push144=, 0($12)
	i32.load8_u	$push145=, 2($3)
	i32.sub 	$push146=, $pop144, $pop145
	i32.store	0($pop451), $pop146
	i32.const	$push147=, 3
	i32.add 	$12=, $3, $pop147
	br      	18              # 18: down to label18
.LBB5_41:                               # %sw.bb288
                                        #   in Loop: Header=BB5_3 Depth=1
	end_block                       # label36:
	i32.const	$push129=, 1
	i32.add 	$push130=, $3, $pop129
	i32.load8_u	$push131=, 0($pop130)
	i32.const	$push132=, 2
	i32.shl 	$push133=, $pop131, $pop132
	i32.add 	$push455=, $4, $pop133
	tee_local	$push454=, $12=, $pop455
	i32.load	$push134=, 0($12)
	i32.const	$push135=, 4
	i32.add 	$push136=, $12, $pop135
	i32.load	$push137=, 0($pop136)
	i32.mul 	$push138=, $pop134, $pop137
	i32.store	0($pop454), $pop138
	i32.const	$push453=, 2
	i32.add 	$12=, $3, $pop453
	br      	17              # 17: down to label18
.LBB5_42:                               # %sw.bb295
                                        #   in Loop: Header=BB5_3 Depth=1
	end_block                       # label35:
	i32.const	$push119=, 1
	i32.add 	$push120=, $3, $pop119
	i32.load8_u	$push121=, 0($pop120)
	i32.const	$push122=, 2
	i32.shl 	$push123=, $pop121, $pop122
	i32.add 	$push458=, $4, $pop123
	tee_local	$push457=, $12=, $pop458
	i32.load	$push124=, 0($12)
	i32.const	$push125=, 4
	i32.add 	$push126=, $12, $pop125
	i32.load	$push127=, 0($pop126)
	i32.div_s	$push128=, $pop124, $pop127
	i32.store	0($pop457), $pop128
	i32.const	$push456=, 2
	i32.add 	$12=, $3, $pop456
	br      	16              # 16: down to label18
.LBB5_43:                               # %sw.bb302
                                        #   in Loop: Header=BB5_3 Depth=1
	end_block                       # label34:
	i32.const	$push107=, 1
	i32.add 	$push108=, $3, $pop107
	i32.load8_u	$push109=, 0($pop108)
	i32.const	$push110=, 2
	i32.shl 	$push111=, $pop109, $pop110
	i32.add 	$push462=, $4, $pop111
	tee_local	$push461=, $12=, $pop462
	i32.const	$push460=, 1
	i32.const	$push117=, -2147483648
	i32.load	$push112=, 0($12)
	i32.const	$push113=, 4
	i32.add 	$push114=, $12, $pop113
	i32.load	$push115=, 0($pop114)
	i32.eq  	$push116=, $pop112, $pop115
	i32.select	$push118=, $pop460, $pop117, $pop116
	i32.store	0($pop461), $pop118
	i32.const	$push459=, 2
	i32.add 	$12=, $3, $pop459
	br      	15              # 15: down to label18
.LBB5_44:                               # %sw.bb312
                                        #   in Loop: Header=BB5_3 Depth=1
	end_block                       # label33:
	i32.const	$push95=, 1
	i32.add 	$push96=, $3, $pop95
	i32.load8_u	$push97=, 0($pop96)
	i32.const	$push98=, 2
	i32.shl 	$push99=, $pop97, $pop98
	i32.add 	$push466=, $4, $pop99
	tee_local	$push465=, $12=, $pop466
	i32.const	$push464=, 1
	i32.const	$push105=, -2147483648
	i32.load	$push100=, 0($12)
	i32.const	$push101=, 4
	i32.add 	$push102=, $12, $pop101
	i32.load	$push103=, 0($pop102)
	i32.lt_s	$push104=, $pop100, $pop103
	i32.select	$push106=, $pop464, $pop105, $pop104
	i32.store	0($pop465), $pop106
	i32.const	$push463=, 2
	i32.add 	$12=, $3, $pop463
	br      	14              # 14: down to label18
.LBB5_45:                               # %sw.bb322
                                        #   in Loop: Header=BB5_3 Depth=1
	end_block                       # label32:
	i32.const	$push83=, 1
	i32.add 	$push84=, $3, $pop83
	i32.load8_u	$push85=, 0($pop84)
	i32.const	$push86=, 2
	i32.shl 	$push87=, $pop85, $pop86
	i32.add 	$push470=, $4, $pop87
	tee_local	$push469=, $12=, $pop470
	i32.const	$push468=, 1
	i32.const	$push93=, -2147483648
	i32.load	$push88=, 0($12)
	i32.const	$push89=, 4
	i32.add 	$push90=, $12, $pop89
	i32.load	$push91=, 0($pop90)
	i32.le_s	$push92=, $pop88, $pop91
	i32.select	$push94=, $pop468, $pop93, $pop92
	i32.store	0($pop469), $pop94
	i32.const	$push467=, 2
	i32.add 	$12=, $3, $pop467
	br      	13              # 13: down to label18
.LBB5_46:                               # %sw.bb332
                                        #   in Loop: Header=BB5_3 Depth=1
	end_block                       # label31:
	i32.const	$push71=, 1
	i32.add 	$push72=, $3, $pop71
	i32.load8_u	$push73=, 0($pop72)
	i32.const	$push74=, 2
	i32.shl 	$push75=, $pop73, $pop74
	i32.add 	$push474=, $4, $pop75
	tee_local	$push473=, $12=, $pop474
	i32.const	$push472=, 1
	i32.const	$push81=, -2147483648
	i32.load	$push76=, 0($12)
	i32.const	$push77=, 4
	i32.add 	$push78=, $12, $pop77
	i32.load	$push79=, 0($pop78)
	i32.gt_s	$push80=, $pop76, $pop79
	i32.select	$push82=, $pop472, $pop81, $pop80
	i32.store	0($pop473), $pop82
	i32.const	$push471=, 2
	i32.add 	$12=, $3, $pop471
	br      	12              # 12: down to label18
.LBB5_47:                               # %sw.bb342
                                        #   in Loop: Header=BB5_3 Depth=1
	end_block                       # label30:
	i32.const	$push59=, 1
	i32.add 	$push60=, $3, $pop59
	i32.load8_u	$push61=, 0($pop60)
	i32.const	$push62=, 2
	i32.shl 	$push63=, $pop61, $pop62
	i32.add 	$push478=, $4, $pop63
	tee_local	$push477=, $12=, $pop478
	i32.const	$push476=, 1
	i32.const	$push69=, -2147483648
	i32.load	$push64=, 0($12)
	i32.const	$push65=, 4
	i32.add 	$push66=, $12, $pop65
	i32.load	$push67=, 0($pop66)
	i32.ge_s	$push68=, $pop64, $pop67
	i32.select	$push70=, $pop476, $pop69, $pop68
	i32.store	0($pop477), $pop70
	i32.const	$push475=, 2
	i32.add 	$12=, $3, $pop475
	br      	11              # 11: down to label18
.LBB5_48:                               # %sw.bb352
                                        #   in Loop: Header=BB5_3 Depth=1
	end_block                       # label29:
	i32.const	$push49=, 1
	i32.add 	$push50=, $3, $pop49
	i32.load8_u	$push51=, 0($pop50)
	i32.const	$push54=, 2
	i32.shl 	$push56=, $pop51, $pop54
	i32.add 	$push57=, $4, $pop56
	i32.const	$push480=, 1
	i32.load8_u	$push52=, 2($3)
	i32.call	$push53=, irep_get@FUNCTION, $1, $pop480, $pop52
	i32.const	$push479=, 2
	i32.add 	$push55=, $pop53, $pop479
	i32.store	0($pop57), $pop55
	i32.const	$push58=, 3
	i32.add 	$12=, $3, $pop58
	br      	10              # 10: down to label18
.LBB5_49:                               # %sw.bb361
                                        #   in Loop: Header=BB5_3 Depth=1
	end_block                       # label28:
	i32.const	$push48=, 2
	i32.add 	$12=, $3, $pop48
	br      	9               # 9: down to label18
.LBB5_50:                               # %sw.bb376
                                        #   in Loop: Header=BB5_3 Depth=1
	end_block                       # label27:
	i32.const	$push26=, 1
	i32.add 	$push27=, $3, $pop26
	i32.load8_u	$push28=, 0($pop27)
	i32.const	$push30=, 2
	i32.shl 	$push33=, $pop28, $pop30
	i32.add 	$push484=, $4, $pop33
	tee_local	$push483=, $12=, $pop484
	i32.load	$push34=, 0($pop483)
	i32.const	$push482=, 2
	i32.load8_u	$push29=, 2($3)
	i32.call	$push31=, irep_get@FUNCTION, $1, $pop482, $pop29
	i32.const	$push481=, 2
	i32.add 	$push32=, $pop31, $pop481
	i32.const	$push35=, 4
	i32.add 	$push36=, $12, $pop35
	i32.load	$push37=, 0($pop36)
	i32.call	$drop=, mrb_memory_add@FUNCTION, $0, $pop34, $pop32, $pop37
	i32.const	$push38=, 3
	i32.add 	$12=, $3, $pop38
	br      	8               # 8: down to label18
.LBB5_51:                               # %sw.bb388
                                        #   in Loop: Header=BB5_3 Depth=1
	end_block                       # label26:
	i32.const	$push19=, 1
	i32.add 	$push20=, $3, $pop19
	i32.load8_u	$push21=, 0($pop20)
	i32.const	$push22=, 2
	i32.shl 	$push23=, $pop21, $pop22
	i32.add 	$push24=, $4, $pop23
	i32.load	$push25=, 0($4)
	i32.store	0($pop24), $pop25
	i32.const	$push485=, 2
	i32.add 	$12=, $3, $pop485
	br      	7               # 7: down to label18
.LBB5_52:                               #   in Loop: Header=BB5_3 Depth=1
	end_block                       # label25:
	i32.const	$push486=, 3
	i32.add 	$12=, $3, $pop486
.LBB5_53:                               # %if.end49
                                        #   in Loop: Header=BB5_3 Depth=1
	end_block                       # label24:
	i32.const	$push487=, 2
	i32.shl 	$push325=, $10, $pop487
	i32.add 	$push326=, $4, $pop325
	i32.const	$push322=, 0
	i32.sub 	$push323=, $pop322, $13
	i32.const	$push320=, 4
	i32.eq  	$push321=, $8, $pop320
	i32.select	$push324=, $pop323, $13, $pop321
	i32.store	0($pop326), $pop324
	br      	5               # 5: down to label18
.LBB5_54:                               # %sw.bb250
	end_block                       # label23:
	i32.load8_u	$push177=, 0($12)
	i32.const	$push178=, 2
	i32.shl 	$push179=, $pop177, $pop178
	i32.add 	$push180=, $4, $pop179
	i32.load	$13=, 0($pop180)
	br      	6               # 6: down to label16
.LBB5_55:                               # %sw.default
	end_block                       # label22:
	i32.const	$13=, 1
	br      	1               # 1: down to label20
.LBB5_56:                               # %if.else.i
	end_block                       # label21:
	i32.const	$13=, 2
.LBB5_57:                               # %cleanup404
	end_block                       # label20:
	i32.store	0($0), $13
	br      	3               # 3: down to label16
.LBB5_58:                               # %num_times.exit
                                        #   in Loop: Header=BB5_3 Depth=1
	end_block                       # label19:
	i32.store	0($9), $13
.LBB5_59:                               # %cleanup
                                        #   in Loop: Header=BB5_3 Depth=1
	end_block                       # label18:
	i32.load	$push489=, 0($0)
	tee_local	$push488=, $13=, $pop489
	i32.eqz 	$push493=, $pop488
	br_if   	0, $pop493      # 0: up to label17
.LBB5_60:                               # %cleanup404
	end_loop
	end_block                       # label16:
	i32.const	$push356=, 0
	i32.const	$push354=, 32
	i32.add 	$push355=, $14, $pop354
	i32.store	__stack_pointer($pop356), $pop355
	copy_local	$push494=, $13
                                        # fallthrough-return: $pop494
	.endfunc
.Lfunc_end5:
	.size	irep_exec, .Lfunc_end5-irep_exec

	.hidden	irep_atol
	.globl	irep_atol
	.type	irep_atol,@function
irep_atol:                              # @irep_atol
	.param  	i32
	.result 	i32
	.local  	i32, i32, i32
# BB#0:                                 # %entry
	i32.const	$1=, 0
	block   	
	block   	
	i32.load8_u	$push20=, 0($0)
	tee_local	$push19=, $2=, $pop20
	i32.const	$push1=, 43
	i32.eq  	$push2=, $pop19, $pop1
	br_if   	0, $pop2        # 0: down to label66
# BB#1:                                 # %entry
	i32.const	$push3=, 45
	i32.ne  	$push4=, $2, $pop3
	br_if   	1, $pop4        # 1: down to label65
# BB#2:                                 # %if.then
	i32.const	$1=, 1
	i32.const	$push21=, 1
	i32.add 	$0=, $0, $pop21
	br      	1               # 1: down to label65
.LBB6_3:                                # %if.then5
	end_block                       # label66:
	i32.const	$push5=, 1
	i32.add 	$0=, $0, $pop5
.LBB6_4:                                # %if.end7
	end_block                       # label65:
	i32.const	$3=, 0
	block   	
	i32.load8_u	$push25=, 0($0)
	tee_local	$push24=, $2=, $pop25
	i32.const	$push23=, -48
	i32.add 	$push6=, $pop24, $pop23
	i32.const	$push22=, 255
	i32.and 	$push7=, $pop6, $pop22
	i32.const	$push8=, 9
	i32.gt_u	$push9=, $pop7, $pop8
	br_if   	0, $pop9        # 0: down to label67
# BB#5:                                 # %cleanup.thread.preheader
	i32.const	$push26=, 1
	i32.add 	$0=, $0, $pop26
	i32.const	$3=, 0
.LBB6_6:                                # %cleanup.thread
                                        # =>This Inner Loop Header: Depth=1
	loop    	                # label68:
	i32.const	$push34=, 10
	i32.mul 	$push10=, $3, $pop34
	i32.const	$push33=, 24
	i32.shl 	$push11=, $2, $pop33
	i32.const	$push32=, 24
	i32.shr_s	$push12=, $pop11, $pop32
	i32.add 	$push13=, $pop10, $pop12
	i32.const	$push31=, -48
	i32.add 	$3=, $pop13, $pop31
	i32.load8_u	$2=, 0($0)
	i32.const	$push30=, 1
	i32.add 	$push0=, $0, $pop30
	copy_local	$0=, $pop0
	i32.const	$push29=, -48
	i32.add 	$push14=, $2, $pop29
	i32.const	$push28=, 255
	i32.and 	$push15=, $pop14, $pop28
	i32.const	$push27=, 10
	i32.lt_u	$push16=, $pop15, $pop27
	br_if   	0, $pop16       # 0: up to label68
.LBB6_7:                                # %for.end
	end_loop
	end_block                       # label67:
	i32.const	$push35=, 0
	i32.sub 	$push17=, $pop35, $3
	i32.select	$push18=, $pop17, $3, $1
                                        # fallthrough-return: $pop18
	.endfunc
.Lfunc_end6:
	.size	irep_atol, .Lfunc_end6-irep_atol

	.hidden	emb_method
	.globl	emb_method
	.type	emb_method,@function
emb_method:                             # @emb_method
	.param  	i32, i32, i32, i32, i32
	.local  	i32, i32
# BB#0:                                 # %entry
	i32.const	$6=, 0
.LBB7_1:                                # %for.cond.i
                                        # =>This Inner Loop Header: Depth=1
	block   	
	loop    	                # label70:
	i32.add 	$push2=, $1, $6
	i32.load8_u	$push17=, 0($pop2)
	tee_local	$push16=, $5=, $pop17
	i32.const	$push15=, .L.str.55
	i32.add 	$push0=, $6, $pop15
	i32.load8_u	$push1=, 0($pop0)
	i32.ne  	$push3=, $pop16, $pop1
	br_if   	1, $pop3        # 1: down to label69
# BB#2:                                 # %cleanup.i
                                        #   in Loop: Header=BB7_1 Depth=1
	i32.const	$push18=, 1
	i32.add 	$6=, $6, $pop18
	br_if   	0, $5           # 0: up to label70
# BB#3:                                 # %if.then
	end_loop
	i32.const	$push5=, 2
	i32.shl 	$push6=, $3, $pop5
	i32.add 	$push20=, $2, $pop6
	tee_local	$push19=, $6=, $pop20
	i32.const	$push13=, 1
	i32.const	$push12=, -2147483648
	i32.load	$push7=, 0($6)
	i32.const	$push8=, 4
	i32.add 	$push9=, $6, $pop8
	i32.load	$push10=, 0($pop9)
	i32.ne  	$push11=, $pop7, $pop10
	i32.select	$push14=, $pop13, $pop12, $pop11
	i32.store	0($pop19), $pop14
	return
.LBB7_4:                                # %if.else
	end_block                       # label69:
	i32.const	$push4=, 2
	i32.store	0($0), $pop4
                                        # fallthrough-return
	.endfunc
.Lfunc_end7:
	.size	emb_method, .Lfunc_end7-emb_method

	.hidden	getMemory
	.globl	getMemory
	.type	getMemory,@function
getMemory:                              # @getMemory
	.result 	i32
# BB#0:                                 # %entry
	i32.const	$push0=, mem
                                        # fallthrough-return: $pop0
	.endfunc
.Lfunc_end8:
	.size	getMemory, .Lfunc_end8-getMemory

	.hidden	getMemorySize
	.globl	getMemorySize
	.type	getMemorySize,@function
getMemorySize:                          # @getMemorySize
	.result 	i32
# BB#0:                                 # %entry
	i32.const	$push0=, 16384
                                        # fallthrough-return: $pop0
	.endfunc
.Lfunc_end9:
	.size	getMemorySize, .Lfunc_end9-getMemorySize

	.hidden	exec
	.globl	exec
	.type	exec,@function
exec:                                   # @exec
	.result 	i32
	.local  	i32, i32
# BB#0:                                 # %entry
	i32.const	$push6=, 0
	i32.const	$push4=, 0
	i32.load	$push3=, __stack_pointer($pop4)
	i32.const	$push5=, 256
	i32.sub 	$push12=, $pop3, $pop5
	tee_local	$push11=, $1=, $pop12
	i32.store	__stack_pointer($pop6), $pop11
	i64.const	$push0=, 0
	i64.store	0($1), $pop0
	i32.const	$push2=, mem+34
	i32.const	$push1=, 0
	i32.const	$push10=, 0
	i32.call	$0=, irep_exec@FUNCTION, $1, $pop2, $pop1, $pop10
	i32.const	$push9=, 0
	i32.const	$push7=, 256
	i32.add 	$push8=, $1, $pop7
	i32.store	__stack_pointer($pop9), $pop8
	copy_local	$push13=, $0
                                        # fallthrough-return: $pop13
	.endfunc
.Lfunc_end10:
	.size	exec, .Lfunc_end10-exec

	.type	.L.str.29,@object       # @.str.29
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.29:
	.asciz	"times"
	.size	.L.str.29, 6

	.hidden	mem                     # @mem
	.type	mem,@object
	.bss
	.globl	mem
	.p2align	4
mem:
	.skip	16384
	.size	mem, 16384

	.type	.L.str.55,@object       # @.str.55
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.55:
	.asciz	"!="
	.size	.L.str.55, 3


	.ident	"clang version 5.0.0 (http://llvm.org/git/clang.git 01734df77696b4d9ba1debc1823b29673cae6a6c) (http://llvm.org/git/llvm.git c67ef6aaf75865024462576a5b790e46ccc2e75e)"
