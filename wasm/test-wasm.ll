; ModuleID = 'test-wasm.c'
source_filename = "test-wasm.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32:64-S128"
target triple = "wasm32"

%struct.mrb_vm = type { i32, i32, [60 x i32], i8* }
%struct.mrb_state = type { %struct.mrb_state*, i32* }

@.str.29 = private unnamed_addr constant [6 x i8] c"times\00", align 1
@mem = hidden global [16384 x i8] zeroinitializer, align 16
@.str.55 = private unnamed_addr constant [3 x i8] c"!=\00", align 1

; Function Attrs: nounwind optsize readonly
define hidden i8* @irep_get(i8* %p, i32 %type, i32 %n) local_unnamed_addr #0 {
entry:
  %add.ptr1 = getelementptr inbounds i8, i8* %p, i32 8
  %0 = load i8, i8* %add.ptr1, align 1, !tbaa !1
  %conv.i = zext i8 %0 to i32
  %shl.i = shl nuw nsw i32 %conv.i, 8
  %arrayidx1.i = getelementptr inbounds i8, i8* %p, i32 9
  %1 = load i8, i8* %arrayidx1.i, align 1, !tbaa !1
  %conv2.i = zext i8 %1 to i32
  %or.i = or i32 %shl.i, %conv2.i
  %add.ptr4 = getelementptr inbounds i8, i8* %p, i32 12
  %2 = load i8, i8* %add.ptr4, align 1, !tbaa !1
  %conv.i140 = zext i8 %2 to i32
  %shl.i141 = shl nuw nsw i32 %conv.i140, 8
  %arrayidx1.i142 = getelementptr inbounds i8, i8* %p, i32 13
  %3 = load i8, i8* %arrayidx1.i142, align 1, !tbaa !1
  %conv2.i143 = zext i8 %3 to i32
  %or.i144 = or i32 %shl.i141, %conv2.i143
  %add.ptr6 = getelementptr inbounds i8, i8* %p, i32 14
  %4 = ptrtoint i8* %add.ptr6 to i32
  %and = and i32 %4, 3
  %tobool = icmp eq i32 %and, 0
  %sub = sub nsw i32 4, %and
  %add.ptr7 = getelementptr inbounds i8, i8* %add.ptr6, i32 %sub
  %p.addr.0 = select i1 %tobool, i8* %add.ptr6, i8* %add.ptr7
  %add.ptr8 = getelementptr inbounds i8, i8* %p.addr.0, i32 %or.i144
  %add.ptr9 = getelementptr inbounds i8, i8* %add.ptr8, i32 2
  %5 = load i8, i8* %add.ptr9, align 1, !tbaa !1
  %conv.i135 = zext i8 %5 to i32
  %shl.i136 = shl nuw nsw i32 %conv.i135, 8
  %arrayidx1.i137 = getelementptr inbounds i8, i8* %add.ptr9, i32 1
  %6 = load i8, i8* %arrayidx1.i137, align 1, !tbaa !1
  %conv2.i138 = zext i8 %6 to i32
  %or.i139 = or i32 %shl.i136, %conv2.i138
  %cmp = icmp eq i32 %type, 1
  %n.call10 = select i1 %cmp, i32 %n, i32 %or.i139
  %add.ptr13 = getelementptr inbounds i8, i8* %add.ptr8, i32 4
  %cmp14152 = icmp sgt i32 %n.call10, 0
  br i1 %cmp14152, label %for.body.preheader, label %for.cond.cleanup

for.body.preheader:                               ; preds = %entry
  br label %for.body

for.cond.cleanup.loopexit:                        ; preds = %for.body
  br label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond.cleanup.loopexit, %entry
  %p.addr.1.lcssa = phi i8* [ %add.ptr13, %entry ], [ %add.ptr19, %for.cond.cleanup.loopexit ]
  br i1 %cmp, label %cleanup73, label %cleanup.cont

for.body:                                         ; preds = %for.body.preheader, %for.body
  %p.addr.1154 = phi i8* [ %add.ptr19, %for.body ], [ %add.ptr13, %for.body.preheader ]
  %i.0153 = phi i32 [ %inc, %for.body ], [ 0, %for.body.preheader ]
  %add.ptr16 = getelementptr inbounds i8, i8* %p.addr.1154, i32 1
  %7 = load i8, i8* %add.ptr16, align 1, !tbaa !1
  %conv.i130 = zext i8 %7 to i32
  %shl.i131 = shl nuw nsw i32 %conv.i130, 8
  %arrayidx1.i132 = getelementptr inbounds i8, i8* %p.addr.1154, i32 2
  %8 = load i8, i8* %arrayidx1.i132, align 1, !tbaa !1
  %conv2.i133 = zext i8 %8 to i32
  %or.i134 = or i32 %shl.i131, %conv2.i133
  %add = add nuw nsw i32 %or.i134, 3
  %add.ptr19 = getelementptr inbounds i8, i8* %p.addr.1154, i32 %add
  %inc = add nuw nsw i32 %i.0153, 1
  %exitcond157 = icmp eq i32 %inc, %n.call10
  br i1 %exitcond157, label %for.cond.cleanup.loopexit, label %for.body

cleanup.cont:                                     ; preds = %for.cond.cleanup
  %add.ptr24 = getelementptr inbounds i8, i8* %p.addr.1.lcssa, i32 2
  %9 = load i8, i8* %add.ptr24, align 1, !tbaa !1
  %conv.i125 = zext i8 %9 to i32
  %shl.i126 = shl nuw nsw i32 %conv.i125, 8
  %arrayidx1.i127 = getelementptr inbounds i8, i8* %p.addr.1.lcssa, i32 3
  %10 = load i8, i8* %arrayidx1.i127, align 1, !tbaa !1
  %conv2.i128 = zext i8 %10 to i32
  %or.i129 = or i32 %shl.i126, %conv2.i128
  %cmp26 = icmp eq i32 %type, 2
  %n.call25 = select i1 %cmp26, i32 %n, i32 %or.i129
  %add.ptr30 = getelementptr inbounds i8, i8* %p.addr.1.lcssa, i32 4
  %cmp33148 = icmp sgt i32 %n.call25, 0
  br i1 %cmp33148, label %for.body36.preheader, label %for.cond.cleanup35

for.body36.preheader:                             ; preds = %cleanup.cont
  br label %for.body36

for.cond.cleanup35.loopexit:                      ; preds = %for.body36
  br label %for.cond.cleanup35

for.cond.cleanup35:                               ; preds = %for.cond.cleanup35.loopexit, %cleanup.cont
  %p.addr.2.lcssa = phi i8* [ %add.ptr30, %cleanup.cont ], [ %add.ptr42, %for.cond.cleanup35.loopexit ]
  br i1 %cmp26, label %cleanup73, label %cleanup.cont53

for.body36:                                       ; preds = %for.body36.preheader, %for.body36
  %i31.0150 = phi i32 [ %inc44, %for.body36 ], [ 0, %for.body36.preheader ]
  %p.addr.2149 = phi i8* [ %add.ptr42, %for.body36 ], [ %add.ptr30, %for.body36.preheader ]
  %11 = load i8, i8* %p.addr.2149, align 1, !tbaa !1
  %conv.i120 = zext i8 %11 to i32
  %shl.i121 = shl nuw nsw i32 %conv.i120, 8
  %arrayidx1.i122 = getelementptr inbounds i8, i8* %p.addr.2149, i32 1
  %12 = load i8, i8* %arrayidx1.i122, align 1, !tbaa !1
  %conv2.i123 = zext i8 %12 to i32
  %or.i124 = or i32 %shl.i121, %conv2.i123
  %add41 = add nuw nsw i32 %or.i124, 3
  %add.ptr42 = getelementptr inbounds i8, i8* %p.addr.2149, i32 %add41
  %inc44 = add nuw nsw i32 %i31.0150, 1
  %exitcond156 = icmp eq i32 %inc44, %n.call25
  br i1 %exitcond156, label %for.cond.cleanup35.loopexit, label %for.body36

cleanup.cont53:                                   ; preds = %for.cond.cleanup35
  %cmp54 = icmp eq i32 %type, 3
  %n.call2 = select i1 %cmp54, i32 %n, i32 %or.i
  %cmp60145 = icmp sgt i32 %n.call2, 0
  br i1 %cmp60145, label %for.body63.preheader, label %cleanup73

for.body63.preheader:                             ; preds = %cleanup.cont53
  br label %for.body63

for.body63:                                       ; preds = %for.body63.preheader, %for.body63
  %i58.0147 = phi i32 [ %inc66, %for.body63 ], [ 0, %for.body63.preheader ]
  %p.addr.3146 = phi i8* [ %call64, %for.body63 ], [ %p.addr.2.lcssa, %for.body63.preheader ]
  %call64 = tail call i8* @irep_get(i8* %p.addr.3146, i32 0, i32 0) #6
  %inc66 = add nuw nsw i32 %i58.0147, 1
  %exitcond = icmp eq i32 %inc66, %n.call2
  br i1 %exitcond, label %cleanup73.loopexit, label %for.body63

cleanup73.loopexit:                               ; preds = %for.body63
  br label %cleanup73

cleanup73:                                        ; preds = %cleanup73.loopexit, %cleanup.cont53, %for.cond.cleanup35, %for.cond.cleanup
  %retval.2 = phi i8* [ %p.addr.2.lcssa, %for.cond.cleanup35 ], [ %p.addr.1.lcssa, %for.cond.cleanup ], [ %p.addr.2.lcssa, %cleanup.cont53 ], [ %call64, %cleanup73.loopexit ]
  ret i8* %retval.2
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #1

; Function Attrs: norecurse nounwind optsize readnone
define hidden void @showRegs(i32* nocapture %reg, i32 %nregs) local_unnamed_addr #2 {
entry:
  ret void
}

; Function Attrs: norecurse nounwind optsize readonly
define hidden i32* @mrb_memory_find(%struct.mrb_vm* readonly %vm, i32 %obj, i8* nocapture readonly %name) local_unnamed_addr #3 {
entry:
  %nmemory = getelementptr inbounds %struct.mrb_vm, %struct.mrb_vm* %vm, i32 0, i32 1
  %0 = load i32, i32* %nmemory, align 4, !tbaa !4
  %cmp24 = icmp sgt i32 %0, 0
  br i1 %cmp24, label %for.body.preheader, label %cleanup

for.body.preheader:                               ; preds = %entry
  %mul = mul nsw i32 %0, 3
  br label %for.body

for.body:                                         ; preds = %for.body.preheader, %for.inc
  %i.025 = phi i32 [ %add6, %for.inc ], [ 0, %for.body.preheader ]
  %arrayidx = getelementptr inbounds %struct.mrb_vm, %struct.mrb_vm* %vm, i32 0, i32 2, i32 %i.025
  %1 = load i32, i32* %arrayidx, align 4, !tbaa !8
  %cmp1 = icmp eq i32 %1, %obj
  br i1 %cmp1, label %land.lhs.true, label %for.inc

land.lhs.true:                                    ; preds = %for.body
  %add = add nuw nsw i32 %i.025, 1
  %arrayidx2 = getelementptr inbounds %struct.mrb_vm, %struct.mrb_vm* %vm, i32 0, i32 2, i32 %add
  %2 = bitcast i32* %arrayidx2 to i8**
  %3 = load i8*, i8** %2, align 4, !tbaa !8
  br label %for.cond.i

for.cond.i:                                       ; preds = %cleanup.i, %land.lhs.true
  %buf2.addr.0.i = phi i8* [ %name, %land.lhs.true ], [ %incdec.ptr1.i, %cleanup.i ]
  %buf1.addr.0.i = phi i8* [ %3, %land.lhs.true ], [ %incdec.ptr.i, %cleanup.i ]
  %4 = load i8, i8* %buf1.addr.0.i, align 1, !tbaa !1
  %5 = load i8, i8* %buf2.addr.0.i, align 1, !tbaa !1
  %tobool.i = icmp eq i8 %4, %5
  br i1 %tobool.i, label %cleanup.i, label %for.inc.loopexit

cleanup.i:                                        ; preds = %for.cond.i
  %incdec.ptr1.i = getelementptr inbounds i8, i8* %buf2.addr.0.i, i32 1
  %incdec.ptr.i = getelementptr inbounds i8, i8* %buf1.addr.0.i, i32 1
  %tobool3.i = icmp eq i8 %4, 0
  br i1 %tobool3.i, label %cleanup.loopexit, label %for.cond.i

for.inc.loopexit:                                 ; preds = %for.cond.i
  br label %for.inc

for.inc:                                          ; preds = %for.inc.loopexit, %for.body
  %add6 = add nuw nsw i32 %i.025, 3
  %cmp = icmp slt i32 %add6, %mul
  br i1 %cmp, label %for.body, label %cleanup.loopexit32

cleanup.loopexit:                                 ; preds = %cleanup.i
  br label %cleanup

cleanup.loopexit32:                               ; preds = %for.inc
  br label %cleanup

cleanup:                                          ; preds = %cleanup.loopexit32, %cleanup.loopexit, %entry
  %6 = phi i32* [ null, %entry ], [ %arrayidx, %cleanup.loopexit ], [ null, %cleanup.loopexit32 ]
  ret i32* %6
}

; Function Attrs: norecurse nounwind optsize readonly
define hidden i32 @mrb_strcmp(i8* nocapture readonly %buf1, i8* nocapture readonly %buf2) local_unnamed_addr #3 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %cleanup, %entry
  %buf2.addr.0 = phi i8* [ %buf2, %entry ], [ %incdec.ptr1, %cleanup ]
  %buf1.addr.0 = phi i8* [ %buf1, %entry ], [ %incdec.ptr, %cleanup ]
  %0 = load i8, i8* %buf1.addr.0, align 1, !tbaa !1
  %conv = sext i8 %0 to i32
  %1 = load i8, i8* %buf2.addr.0, align 1, !tbaa !1
  %conv2 = sext i8 %1 to i32
  %sub = sub nsw i32 %conv, %conv2
  %tobool = icmp eq i32 %sub, 0
  br i1 %tobool, label %cleanup, label %return

cleanup:                                          ; preds = %for.cond
  %incdec.ptr1 = getelementptr inbounds i8, i8* %buf2.addr.0, i32 1
  %incdec.ptr = getelementptr inbounds i8, i8* %buf1.addr.0, i32 1
  %tobool3 = icmp eq i8 %0, 0
  br i1 %tobool3, label %return, label %for.cond

return:                                           ; preds = %cleanup, %for.cond
  %retval.111 = phi i32 [ 0, %cleanup ], [ %sub, %for.cond ]
  ret i32 %retval.111
}

; Function Attrs: norecurse nounwind optsize
define hidden i32 @mrb_memory_add(%struct.mrb_vm* %vm, i32 %obj, i8* %name, i32 %val) local_unnamed_addr #4 {
entry:
  %call = tail call i32* @mrb_memory_find(%struct.mrb_vm* %vm, i32 %obj, i8* %name) #6
  %tobool = icmp eq i32* %call, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %arrayidx = getelementptr inbounds i32, i32* %call, i32 2
  store i32 %val, i32* %arrayidx, align 4, !tbaa !8
  br label %cleanup

if.end:                                           ; preds = %entry
  %nmemory = getelementptr inbounds %struct.mrb_vm, %struct.mrb_vm* %vm, i32 0, i32 1
  %0 = load i32, i32* %nmemory, align 4, !tbaa !4
  %cmp = icmp eq i32 %0, 20
  br i1 %cmp, label %if.then1, label %if.end2

if.then1:                                         ; preds = %if.end
  %err = getelementptr inbounds %struct.mrb_vm, %struct.mrb_vm* %vm, i32 0, i32 0
  store i32 3, i32* %err, align 4, !tbaa !9
  br label %cleanup

if.end2:                                          ; preds = %if.end
  %mul = mul nsw i32 %0, 3
  %add.ptr = getelementptr inbounds %struct.mrb_vm, %struct.mrb_vm* %vm, i32 0, i32 2, i32 %mul
  %incdec.ptr = getelementptr inbounds i32, i32* %add.ptr, i32 1
  store i32 %obj, i32* %add.ptr, align 4, !tbaa !8
  %1 = ptrtoint i8* %name to i32
  %incdec.ptr4 = getelementptr inbounds i32, i32* %add.ptr, i32 2
  store i32 %1, i32* %incdec.ptr, align 4, !tbaa !8
  store i32 %val, i32* %incdec.ptr4, align 4, !tbaa !8
  %2 = load i32, i32* %nmemory, align 4, !tbaa !4
  %inc = add nsw i32 %2, 1
  store i32 %inc, i32* %nmemory, align 4, !tbaa !4
  br label %cleanup

cleanup:                                          ; preds = %if.end2, %if.then1, %if.then
  %retval.0 = phi i32 [ 1, %if.then ], [ 0, %if.then1 ], [ 1, %if.end2 ]
  ret i32 %retval.0
}

; Function Attrs: nounwind optsize
define hidden i32 @irep_exec(%struct.mrb_vm* %vm, i8* %irep, %struct.mrb_state* %parent, i32 %paramreg) local_unnamed_addr #5 {
entry:
  %reg.i = alloca [3 x i32], align 4
  %state.i = alloca %struct.mrb_state, align 4
  %state = alloca %struct.mrb_state, align 4
  %add.ptr1 = getelementptr inbounds i8, i8* %irep, i32 6
  %0 = load i8, i8* %add.ptr1, align 1, !tbaa !1
  %conv.i = zext i8 %0 to i32
  %shl.i = shl nuw nsw i32 %conv.i, 8
  %arrayidx1.i = getelementptr inbounds i8, i8* %irep, i32 7
  %1 = load i8, i8* %arrayidx1.i, align 1, !tbaa !1
  %conv2.i = zext i8 %1 to i32
  %or.i = or i32 %shl.i, %conv2.i
  %sub = add nsw i32 %or.i, -1
  %vla = alloca i32, i32 %sub, align 16
  %add.ptr8 = getelementptr inbounds i8, i8* %irep, i32 14
  %2 = ptrtoint i8* %add.ptr8 to i32
  %and = and i32 %2, 3
  %tobool = icmp eq i32 %and, 0
  %sub9 = sub nsw i32 4, %and
  %add.ptr10 = getelementptr inbounds i8, i8* %add.ptr8, i32 %sub9
  %p.0 = select i1 %tobool, i8* %add.ptr8, i8* %add.ptr10
  %3 = bitcast %struct.mrb_state* %state to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %3) #7
  %parent11 = getelementptr inbounds %struct.mrb_state, %struct.mrb_state* %state, i32 0, i32 0
  store %struct.mrb_state* %parent, %struct.mrb_state** %parent11, align 4, !tbaa !10
  %reg = getelementptr inbounds %struct.mrb_state, %struct.mrb_state* %state, i32 0, i32 1
  store i32* %vla, i32** %reg, align 4, !tbaa !12
  %tobool12 = icmp eq i32 %paramreg, 0
  %.pre = getelementptr inbounds %struct.mrb_state, %struct.mrb_state* %parent, i32 0, i32 1
  br i1 %tobool12, label %cond.end, label %cond.true

cond.true:                                        ; preds = %entry
  %4 = load i32*, i32** %.pre, align 4, !tbaa !12
  %arrayidx = getelementptr inbounds i32, i32* %4, i32 %paramreg
  %5 = load i32, i32* %arrayidx, align 4, !tbaa !8
  br label %cond.end

cond.end:                                         ; preds = %entry, %cond.true
  %cond = phi i32 [ %5, %cond.true ], [ 1, %entry ]
  store i32 %cond, i32* %vla, align 16, !tbaa !8
  %err = getelementptr inbounds %struct.mrb_vm, %struct.mrb_vm* %vm, i32 0, i32 0
  %6 = bitcast [3 x i32]* %reg.i to i8*
  %7 = bitcast %struct.mrb_state* %state.i to i8*
  %parent1.i = getelementptr inbounds %struct.mrb_state, %struct.mrb_state* %state.i, i32 0, i32 0
  %reg2.i = getelementptr inbounds %struct.mrb_state, %struct.mrb_state* %state.i, i32 0, i32 1
  %arraydecay.i = getelementptr inbounds [3 x i32], [3 x i32]* %reg.i, i32 0, i32 0
  %arrayidx3.i = getelementptr inbounds [3 x i32], [3 x i32]* %reg.i, i32 0, i32 1
  br label %for.cond

for.cond:                                         ; preds = %cond.end, %cleanup
  %opext.0 = phi i32 [ %opext.1.ph, %cleanup ], [ 0, %cond.end ]
  %p.1 = phi i8* [ %p.3.ph, %cleanup ], [ %p.0, %cond.end ]
  %incdec.ptr = getelementptr inbounds i8, i8* %p.1, i32 1
  %8 = load i8, i8* %p.1, align 1, !tbaa !1
  %conv = zext i8 %8 to i32
  switch i8 %8, label %sw.default [
    i8 0, label %cleanup
    i8 1, label %sw.bb23
    i8 2, label %sw.bb31
    i8 3, label %sw.bb40
    i8 4, label %sw.bb40
    i8 5, label %sw.bb57
    i8 6, label %sw.bb57
    i8 7, label %sw.bb57
    i8 8, label %sw.bb57
    i8 9, label %sw.bb57
    i8 10, label %sw.bb57
    i8 11, label %sw.bb57
    i8 12, label %sw.bb57
    i8 13, label %sw.bb57
    i8 14, label %sw.bb65
    i8 15, label %sw.bb74
    i8 16, label %sw.bb78
    i8 17, label %sw.bb84
    i8 18, label %sw.bb84
    i8 31, label %sw.bb95
    i8 32, label %sw.bb95
    i8 33, label %sw.bb119
    i8 34, label %sw.bb126
    i8 35, label %sw.bb126
    i8 46, label %sw.bb154
    i8 47, label %sw.bb178
    i8 51, label %sw.bb208
    i8 55, label %sw.bb250
    i8 56, label %sw.bb250
    i8 57, label %sw.bb250
    i8 59, label %sw.bb258
    i8 60, label %sw.bb266
    i8 61, label %sw.bb273
    i8 62, label %sw.bb281
    i8 63, label %sw.bb288
    i8 64, label %sw.bb295
    i8 65, label %sw.bb302
    i8 66, label %sw.bb312
    i8 67, label %sw.bb322
    i8 68, label %sw.bb332
    i8 69, label %sw.bb342
    i8 79, label %sw.bb352
    i8 80, label %sw.bb361
    i8 85, label %sw.bb365
    i8 86, label %sw.bb365
    i8 93, label %sw.bb376
    i8 97, label %sw.bb388
    i8 103, label %cleanup404.loopexit
    i8 100, label %sw.bb395
    i8 101, label %sw.bb395
    i8 102, label %sw.bb395
  ]

sw.bb23:                                          ; preds = %for.cond
  %incdec.ptr24 = getelementptr inbounds i8, i8* %p.1, i32 2
  %9 = load i8, i8* %incdec.ptr, align 1, !tbaa !1
  %conv25 = zext i8 %9 to i32
  %incdec.ptr26 = getelementptr inbounds i8, i8* %p.1, i32 3
  %10 = load i8, i8* %incdec.ptr24, align 1, !tbaa !1
  %conv27 = zext i8 %10 to i32
  %arrayidx28 = getelementptr inbounds i32, i32* %vla, i32 %conv27
  %11 = load i32, i32* %arrayidx28, align 4, !tbaa !8
  %arrayidx29 = getelementptr inbounds i32, i32* %vla, i32 %conv25
  store i32 %11, i32* %arrayidx29, align 4, !tbaa !8
  br label %cleanup

sw.bb31:                                          ; preds = %for.cond
  %incdec.ptr32 = getelementptr inbounds i8, i8* %p.1, i32 2
  %12 = load i8, i8* %incdec.ptr, align 1, !tbaa !1
  %conv33 = zext i8 %12 to i32
  %incdec.ptr34 = getelementptr inbounds i8, i8* %p.1, i32 3
  %13 = load i8, i8* %incdec.ptr32, align 1, !tbaa !1
  %conv35 = zext i8 %13 to i32
  %call36 = call i8* @irep_get(i8* %irep, i32 1, i32 %conv35) #6
  %add.ptr37 = getelementptr inbounds i8, i8* %call36, i32 3
  %call38 = call i32 @irep_atol(i8* %add.ptr37) #6
  %arrayidx39 = getelementptr inbounds i32, i32* %vla, i32 %conv33
  store i32 %call38, i32* %arrayidx39, align 4, !tbaa !8
  br label %cleanup

sw.bb40:                                          ; preds = %for.cond, %for.cond
  %incdec.ptr41 = getelementptr inbounds i8, i8* %p.1, i32 2
  %14 = load i8, i8* %incdec.ptr, align 1, !tbaa !1
  %conv42 = zext i8 %14 to i32
  %incdec.ptr43 = getelementptr inbounds i8, i8* %p.1, i32 3
  %15 = load i8, i8* %incdec.ptr41, align 1, !tbaa !1
  %conv44 = zext i8 %15 to i32
  %cmp = icmp eq i32 %opext.0, 2
  br i1 %cmp, label %if.then46, label %if.end49

if.then46:                                        ; preds = %sw.bb40
  %shl = shl nuw nsw i32 %conv44, 8
  %incdec.ptr47 = getelementptr inbounds i8, i8* %p.1, i32 4
  %16 = load i8, i8* %incdec.ptr43, align 1, !tbaa !1
  %conv48 = zext i8 %16 to i32
  %add = or i32 %shl, %conv48
  br label %if.end49

if.end49:                                         ; preds = %if.then46, %sw.bb40
  %b.1 = phi i32 [ %add, %if.then46 ], [ %conv44, %sw.bb40 ]
  %p.2 = phi i8* [ %incdec.ptr47, %if.then46 ], [ %incdec.ptr43, %sw.bb40 ]
  %cmp51 = icmp eq i8 %8, 4
  %sub54 = sub nsw i32 0, %b.1
  %sub54.b.1 = select i1 %cmp51, i32 %sub54, i32 %b.1
  %arrayidx56 = getelementptr inbounds i32, i32* %vla, i32 %conv42
  store i32 %sub54.b.1, i32* %arrayidx56, align 4, !tbaa !8
  br label %cleanup

sw.bb57:                                          ; preds = %for.cond, %for.cond, %for.cond, %for.cond, %for.cond, %for.cond, %for.cond, %for.cond, %for.cond
  %incdec.ptr58 = getelementptr inbounds i8, i8* %p.1, i32 2
  %17 = load i8, i8* %incdec.ptr, align 1, !tbaa !1
  %conv59 = zext i8 %17 to i32
  %sub61 = add nsw i32 %conv, -6
  %arrayidx62 = getelementptr inbounds i32, i32* %vla, i32 %conv59
  store i32 %sub61, i32* %arrayidx62, align 4, !tbaa !8
  br label %cleanup

sw.bb65:                                          ; preds = %for.cond
  %incdec.ptr66 = getelementptr inbounds i8, i8* %p.1, i32 2
  %18 = load i8, i8* %incdec.ptr, align 1, !tbaa !1
  %conv67 = zext i8 %18 to i32
  %incdec.ptr68 = getelementptr inbounds i8, i8* %p.1, i32 3
  %19 = load i8, i8* %incdec.ptr66, align 1, !tbaa !1
  %conv69 = zext i8 %19 to i32
  %call70 = call i8* @irep_get(i8* %irep, i32 2, i32 %conv69) #6
  %add.ptr71 = getelementptr inbounds i8, i8* %call70, i32 2
  %20 = ptrtoint i8* %add.ptr71 to i32
  %arrayidx72 = getelementptr inbounds i32, i32* %vla, i32 %conv67
  store i32 %20, i32* %arrayidx72, align 4, !tbaa !8
  br label %cleanup

sw.bb74:                                          ; preds = %for.cond
  %incdec.ptr75 = getelementptr inbounds i8, i8* %p.1, i32 2
  %21 = load i8, i8* %incdec.ptr, align 1, !tbaa !1
  %conv76 = zext i8 %21 to i32
  %arrayidx77 = getelementptr inbounds i32, i32* %vla, i32 %conv76
  store i32 -2147483648, i32* %arrayidx77, align 4, !tbaa !8
  br label %cleanup

sw.bb78:                                          ; preds = %for.cond
  %incdec.ptr79 = getelementptr inbounds i8, i8* %p.1, i32 2
  %22 = load i8, i8* %incdec.ptr, align 1, !tbaa !1
  %conv80 = zext i8 %22 to i32
  %23 = load i32, i32* %vla, align 16, !tbaa !8
  %arrayidx82 = getelementptr inbounds i32, i32* %vla, i32 %conv80
  store i32 %23, i32* %arrayidx82, align 4, !tbaa !8
  br label %cleanup

sw.bb84:                                          ; preds = %for.cond, %for.cond
  %incdec.ptr85 = getelementptr inbounds i8, i8* %p.1, i32 2
  %24 = load i8, i8* %incdec.ptr, align 1, !tbaa !1
  %conv86 = zext i8 %24 to i32
  %cmp88 = icmp eq i8 %8, 17
  %conv89 = zext i1 %cmp88 to i32
  %arrayidx90 = getelementptr inbounds i32, i32* %vla, i32 %conv86
  store i32 %conv89, i32* %arrayidx90, align 4, !tbaa !8
  br label %cleanup

sw.bb95:                                          ; preds = %for.cond, %for.cond
  %incdec.ptr96 = getelementptr inbounds i8, i8* %p.1, i32 2
  %25 = load i8, i8* %incdec.ptr, align 1, !tbaa !1
  %conv97 = zext i8 %25 to i32
  %incdec.ptr98 = getelementptr inbounds i8, i8* %p.1, i32 3
  %26 = load i8, i8* %incdec.ptr96, align 1, !tbaa !1
  %conv99 = zext i8 %26 to i32
  %incdec.ptr100 = getelementptr inbounds i8, i8* %p.1, i32 4
  %27 = load i8, i8* %incdec.ptr98, align 1, !tbaa !1
  %conv101 = zext i8 %27 to i32
  %28 = load %struct.mrb_state*, %struct.mrb_state** %parent11, align 4, !tbaa !10
  %cmp104729 = icmp eq i8 %27, 0
  br i1 %cmp104729, label %for.cond.cleanup, label %for.body.preheader

for.body.preheader:                               ; preds = %sw.bb95
  br label %for.body

for.cond.cleanup.loopexit:                        ; preds = %for.body
  br label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond.cleanup.loopexit, %sw.bb95
  %s.0.lcssa = phi %struct.mrb_state* [ %28, %sw.bb95 ], [ %31, %for.cond.cleanup.loopexit ]
  %cmp108 = icmp eq i8 %8, 31
  %29 = getelementptr inbounds %struct.mrb_state, %struct.mrb_state* %s.0.lcssa, i32 0, i32 1
  %30 = load i32*, i32** %29, align 4, !tbaa !12
  %arrayidx115 = getelementptr inbounds i32, i32* %vla, i32 %conv97
  %arrayidx117 = getelementptr inbounds i32, i32* %30, i32 %conv99
  %arrayidx117.sink = select i1 %cmp108, i32* %arrayidx115, i32* %arrayidx117
  %.sink.in = select i1 %cmp108, i32* %arrayidx117, i32* %arrayidx115
  %.sink = load i32, i32* %.sink.in, align 4, !tbaa !8
  store i32 %.sink, i32* %arrayidx117.sink, align 4, !tbaa !8
  br label %cleanup

for.body:                                         ; preds = %for.body.preheader, %for.body
  %iu.0731 = phi i32 [ %inc, %for.body ], [ 0, %for.body.preheader ]
  %s.0730 = phi %struct.mrb_state* [ %31, %for.body ], [ %28, %for.body.preheader ]
  %parent106 = getelementptr inbounds %struct.mrb_state, %struct.mrb_state* %s.0730, i32 0, i32 0
  %31 = load %struct.mrb_state*, %struct.mrb_state** %parent106, align 4, !tbaa !10
  %inc = add nuw nsw i32 %iu.0731, 1
  %exitcond737 = icmp eq i32 %inc, %conv101
  br i1 %exitcond737, label %for.cond.cleanup.loopexit, label %for.body

sw.bb119:                                         ; preds = %for.cond
  %incdec.ptr120 = getelementptr inbounds i8, i8* %p.1, i32 2
  %32 = load i8, i8* %incdec.ptr, align 1, !tbaa !1
  %conv121 = zext i8 %32 to i32
  %shl122 = shl nuw nsw i32 %conv121, 8
  %33 = load i8, i8* %incdec.ptr120, align 1, !tbaa !1
  %conv124 = zext i8 %33 to i32
  %or = or i32 %shl122, %conv124
  %add.ptr125 = getelementptr inbounds i8, i8* %p.0, i32 %or
  br label %cleanup

sw.bb126:                                         ; preds = %for.cond, %for.cond
  %incdec.ptr127 = getelementptr inbounds i8, i8* %p.1, i32 2
  %34 = load i8, i8* %incdec.ptr, align 1, !tbaa !1
  %conv128 = zext i8 %34 to i32
  %incdec.ptr129 = getelementptr inbounds i8, i8* %p.1, i32 3
  %35 = load i8, i8* %incdec.ptr127, align 1, !tbaa !1
  %conv130 = zext i8 %35 to i32
  %shl131 = shl nuw nsw i32 %conv130, 8
  %incdec.ptr132 = getelementptr inbounds i8, i8* %p.1, i32 4
  %36 = load i8, i8* %incdec.ptr129, align 1, !tbaa !1
  %conv133 = zext i8 %36 to i32
  %or134 = or i32 %shl131, %conv133
  %arrayidx139 = getelementptr inbounds i32, i32* %vla, i32 %conv128
  %cmp144 = icmp eq i8 %8, 34
  %37 = load i32, i32* %arrayidx139, align 4, !tbaa !8
  %cmp147 = icmp ne i32 %37, -2147483648
  %cmp149tmp = xor i1 %cmp144, %cmp147
  %add.ptr152 = getelementptr inbounds i8, i8* %p.0, i32 %or134
  %incdec.ptr132.add.ptr152 = select i1 %cmp149tmp, i8* %incdec.ptr132, i8* %add.ptr152
  br label %cleanup

sw.bb154:                                         ; preds = %for.cond
  %incdec.ptr155 = getelementptr inbounds i8, i8* %p.1, i32 2
  %38 = load i8, i8* %incdec.ptr, align 1, !tbaa !1
  %conv156 = zext i8 %38 to i32
  %39 = load i8, i8* %incdec.ptr155, align 1, !tbaa !1
  %conv158 = zext i8 %39 to i32
  %incdec.ptr159 = getelementptr inbounds i8, i8* %p.1, i32 4
  %call161 = call i8* @irep_get(i8* %irep, i32 2, i32 %conv158) #6
  %add.ptr162 = getelementptr inbounds i8, i8* %call161, i32 2
  %call171 = call i32* @mrb_memory_find(%struct.mrb_vm* %vm, i32 1, i8* %add.ptr162) #6
  %tobool172 = icmp eq i32* %call171, null
  br i1 %tobool172, label %for.cond.i.i.preheader, label %if.then173

for.cond.i.i.preheader:                           ; preds = %sw.bb154
  br label %for.cond.i.i

if.then173:                                       ; preds = %sw.bb154
  %arrayidx174 = getelementptr inbounds i32, i32* %call171, i32 2
  %40 = bitcast i32* %arrayidx174 to i8**
  %41 = load i8*, i8** %40, align 4, !tbaa !8
  %call175 = call i32 @irep_exec(%struct.mrb_vm* %vm, i8* %41, %struct.mrb_state* nonnull %state, i32 %conv156) #6
  %arrayidx176 = getelementptr inbounds i32, i32* %vla, i32 %conv156
  store i32 %call175, i32* %arrayidx176, align 4, !tbaa !8
  br label %cleanup

for.cond.i.i:                                     ; preds = %for.cond.i.i.preheader, %cleanup.i.i
  %buf2.addr.0.i.i = phi i8* [ %incdec.ptr1.i.i, %cleanup.i.i ], [ getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i32 0, i32 0), %for.cond.i.i.preheader ]
  %buf1.addr.0.i.i = phi i8* [ %incdec.ptr.i.i, %cleanup.i.i ], [ %add.ptr162, %for.cond.i.i.preheader ]
  %42 = load i8, i8* %buf1.addr.0.i.i, align 1, !tbaa !1
  %43 = load i8, i8* %buf2.addr.0.i.i, align 1, !tbaa !1
  %tobool.i.i = icmp eq i8 %42, %43
  br i1 %tobool.i.i, label %cleanup.i.i, label %if.else.i

cleanup.i.i:                                      ; preds = %for.cond.i.i
  %incdec.ptr1.i.i = getelementptr inbounds i8, i8* %buf2.addr.0.i.i, i32 1
  %incdec.ptr.i.i = getelementptr inbounds i8, i8* %buf1.addr.0.i.i, i32 1
  %tobool3.i.i = icmp eq i8 %42, 0
  br i1 %tobool3.i.i, label %if.then.i, label %for.cond.i.i

if.then.i:                                        ; preds = %cleanup.i.i
  %arrayidx.i = getelementptr inbounds i32, i32* %vla, i32 %conv156
  %44 = load i32, i32* %arrayidx.i, align 4, !tbaa !8
  %add.i = add nuw nsw i32 %conv156, 1
  %arrayidx1.i717 = getelementptr inbounds i32, i32* %vla, i32 %add.i
  %45 = load i32, i32* %arrayidx1.i717, align 4, !tbaa !8
  %cmp2.i = icmp ne i32 %44, %45
  %cond.i = select i1 %cmp2.i, i32 1, i32 -2147483648
  store i32 %cond.i, i32* %arrayidx.i, align 4, !tbaa !8
  br label %cleanup

if.else.i:                                        ; preds = %for.cond.i.i
  store i32 2, i32* %err, align 4, !tbaa !9
  br label %cleanup404

sw.bb178:                                         ; preds = %for.cond
  %incdec.ptr179 = getelementptr inbounds i8, i8* %p.1, i32 2
  %46 = load i8, i8* %incdec.ptr, align 1, !tbaa !1
  %conv180 = zext i8 %46 to i32
  %47 = load i8, i8* %incdec.ptr179, align 1, !tbaa !1
  %conv182 = zext i8 %47 to i32
  %incdec.ptr183 = getelementptr inbounds i8, i8* %p.1, i32 4
  %call194 = call i8* @irep_get(i8* %irep, i32 2, i32 %conv182) #6
  %add.ptr195 = getelementptr inbounds i8, i8* %call194, i32 2
  br label %for.cond.i

for.cond.i:                                       ; preds = %cleanup.i, %sw.bb178
  %buf2.addr.0.i = phi i8* [ getelementptr inbounds ([6 x i8], [6 x i8]* @.str.29, i32 0, i32 0), %sw.bb178 ], [ %incdec.ptr1.i, %cleanup.i ]
  %buf1.addr.0.i = phi i8* [ %add.ptr195, %sw.bb178 ], [ %incdec.ptr.i, %cleanup.i ]
  %48 = load i8, i8* %buf1.addr.0.i, align 1, !tbaa !1
  %49 = load i8, i8* %buf2.addr.0.i, align 1, !tbaa !1
  %tobool.i = icmp eq i8 %48, %49
  br i1 %tobool.i, label %cleanup.i, label %cleanup.loopexit

cleanup.i:                                        ; preds = %for.cond.i
  %incdec.ptr1.i = getelementptr inbounds i8, i8* %buf2.addr.0.i, i32 1
  %incdec.ptr.i = getelementptr inbounds i8, i8* %buf1.addr.0.i, i32 1
  %tobool3.i = icmp eq i8 %48, 0
  br i1 %tobool3.i, label %if.then201, label %for.cond.i

if.then201:                                       ; preds = %cleanup.i
  %add196 = add nuw nsw i32 %conv180, 1
  %arrayidx197 = getelementptr inbounds i32, i32* %vla, i32 %add196
  %arrayidx202 = getelementptr inbounds i32, i32* %vla, i32 %conv180
  %50 = load i32, i32* %arrayidx202, align 4, !tbaa !8
  %51 = bitcast i32* %arrayidx197 to i8**
  %52 = load i8*, i8** %51, align 4, !tbaa !8
  call void @llvm.lifetime.start.p0i8(i64 12, i8* nonnull %6) #7
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %7) #7
  store %struct.mrb_state* %state, %struct.mrb_state** %parent1.i, align 4, !tbaa !10
  store i32* %arraydecay.i, i32** %reg2.i, align 4, !tbaa !12
  store i32 -2147483648, i32* %arraydecay.i, align 4, !tbaa !8
  %cmp.i727 = icmp sgt i32 %50, 0
  br i1 %cmp.i727, label %for.body.i.preheader, label %num_times.exit

for.body.i.preheader:                             ; preds = %if.then201
  br label %for.body.i

for.body.i:                                       ; preds = %for.body.i.preheader, %for.body.i
  %i.0.i728 = phi i32 [ %inc.i, %for.body.i ], [ 0, %for.body.i.preheader ]
  store i32 %i.0.i728, i32* %arrayidx3.i, align 4, !tbaa !8
  %call.i = call i32 @irep_exec(%struct.mrb_vm* %vm, i8* %52, %struct.mrb_state* nonnull %state.i, i32 1) #8
  %inc.i = add nuw nsw i32 %i.0.i728, 1
  %exitcond736 = icmp eq i32 %inc.i, %50
  br i1 %exitcond736, label %num_times.exit.loopexit, label %for.body.i

num_times.exit.loopexit:                          ; preds = %for.body.i
  br label %num_times.exit

num_times.exit:                                   ; preds = %num_times.exit.loopexit, %if.then201
  %ret.0.i.lcssa = phi i32 [ 0, %if.then201 ], [ %call.i, %num_times.exit.loopexit ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %7) #7
  call void @llvm.lifetime.end.p0i8(i64 12, i8* nonnull %6) #7
  store i32 %ret.0.i.lcssa, i32* %arrayidx202, align 4, !tbaa !8
  br label %cleanup

sw.bb208:                                         ; preds = %for.cond
  %53 = load i8, i8* %incdec.ptr, align 1, !tbaa !1
  %conv210 = zext i8 %53 to i32
  %incdec.ptr216 = getelementptr inbounds i8, i8* %p.1, i32 4
  %shr716 = lshr i32 %conv210, 2
  %cmp220725 = icmp eq i32 %shr716, 0
  br i1 %cmp220725, label %cleanup, label %for.body223.lr.ph

for.body223.lr.ph:                                ; preds = %sw.bb208
  %54 = load i32*, i32** %.pre, align 4, !tbaa !12
  br label %for.body223

for.body223:                                      ; preds = %for.body223, %for.body223.lr.ph
  %i.0726 = phi i32 [ 0, %for.body223.lr.ph ], [ %add225, %for.body223 ]
  %add225 = add nuw nsw i32 %i.0726, 1
  %add226 = add nsw i32 %add225, %paramreg
  %arrayidx227 = getelementptr inbounds i32, i32* %54, i32 %add226
  %55 = load i32, i32* %arrayidx227, align 4, !tbaa !8
  %arrayidx229 = getelementptr inbounds i32, i32* %vla, i32 %add225
  store i32 %55, i32* %arrayidx229, align 4, !tbaa !8
  %exitcond = icmp eq i32 %add225, %shr716
  br i1 %exitcond, label %cleanup.loopexit749, label %for.body223

sw.bb250:                                         ; preds = %for.cond, %for.cond, %for.cond
  %56 = load i8, i8* %incdec.ptr, align 1, !tbaa !1
  %conv252 = zext i8 %56 to i32
  %arrayidx257 = getelementptr inbounds i32, i32* %vla, i32 %conv252
  %57 = load i32, i32* %arrayidx257, align 4, !tbaa !8
  br label %cleanup404

sw.bb258:                                         ; preds = %for.cond
  %incdec.ptr259 = getelementptr inbounds i8, i8* %p.1, i32 2
  %58 = load i8, i8* %incdec.ptr, align 1, !tbaa !1
  %conv260 = zext i8 %58 to i32
  %add261 = add nuw nsw i32 %conv260, 1
  %arrayidx262 = getelementptr inbounds i32, i32* %vla, i32 %add261
  %59 = load i32, i32* %arrayidx262, align 4, !tbaa !8
  %arrayidx263 = getelementptr inbounds i32, i32* %vla, i32 %conv260
  %60 = load i32, i32* %arrayidx263, align 4, !tbaa !8
  %add264 = add nsw i32 %60, %59
  store i32 %add264, i32* %arrayidx263, align 4, !tbaa !8
  br label %cleanup

sw.bb266:                                         ; preds = %for.cond
  %incdec.ptr267 = getelementptr inbounds i8, i8* %p.1, i32 2
  %61 = load i8, i8* %incdec.ptr, align 1, !tbaa !1
  %conv268 = zext i8 %61 to i32
  %incdec.ptr269 = getelementptr inbounds i8, i8* %p.1, i32 3
  %62 = load i8, i8* %incdec.ptr267, align 1, !tbaa !1
  %conv270 = zext i8 %62 to i32
  %arrayidx271 = getelementptr inbounds i32, i32* %vla, i32 %conv268
  %63 = load i32, i32* %arrayidx271, align 4, !tbaa !8
  %add272 = add nsw i32 %63, %conv270
  store i32 %add272, i32* %arrayidx271, align 4, !tbaa !8
  br label %cleanup

sw.bb273:                                         ; preds = %for.cond
  %incdec.ptr274 = getelementptr inbounds i8, i8* %p.1, i32 2
  %64 = load i8, i8* %incdec.ptr, align 1, !tbaa !1
  %conv275 = zext i8 %64 to i32
  %add276 = add nuw nsw i32 %conv275, 1
  %arrayidx277 = getelementptr inbounds i32, i32* %vla, i32 %add276
  %65 = load i32, i32* %arrayidx277, align 4, !tbaa !8
  %arrayidx278 = getelementptr inbounds i32, i32* %vla, i32 %conv275
  %66 = load i32, i32* %arrayidx278, align 4, !tbaa !8
  %sub279 = sub nsw i32 %66, %65
  store i32 %sub279, i32* %arrayidx278, align 4, !tbaa !8
  br label %cleanup

sw.bb281:                                         ; preds = %for.cond
  %incdec.ptr282 = getelementptr inbounds i8, i8* %p.1, i32 2
  %67 = load i8, i8* %incdec.ptr, align 1, !tbaa !1
  %conv283 = zext i8 %67 to i32
  %incdec.ptr284 = getelementptr inbounds i8, i8* %p.1, i32 3
  %68 = load i8, i8* %incdec.ptr282, align 1, !tbaa !1
  %conv285 = zext i8 %68 to i32
  %arrayidx286 = getelementptr inbounds i32, i32* %vla, i32 %conv283
  %69 = load i32, i32* %arrayidx286, align 4, !tbaa !8
  %sub287 = sub nsw i32 %69, %conv285
  store i32 %sub287, i32* %arrayidx286, align 4, !tbaa !8
  br label %cleanup

sw.bb288:                                         ; preds = %for.cond
  %incdec.ptr289 = getelementptr inbounds i8, i8* %p.1, i32 2
  %70 = load i8, i8* %incdec.ptr, align 1, !tbaa !1
  %conv290 = zext i8 %70 to i32
  %add291 = add nuw nsw i32 %conv290, 1
  %arrayidx292 = getelementptr inbounds i32, i32* %vla, i32 %add291
  %71 = load i32, i32* %arrayidx292, align 4, !tbaa !8
  %arrayidx293 = getelementptr inbounds i32, i32* %vla, i32 %conv290
  %72 = load i32, i32* %arrayidx293, align 4, !tbaa !8
  %mul = mul nsw i32 %72, %71
  store i32 %mul, i32* %arrayidx293, align 4, !tbaa !8
  br label %cleanup

sw.bb295:                                         ; preds = %for.cond
  %incdec.ptr296 = getelementptr inbounds i8, i8* %p.1, i32 2
  %73 = load i8, i8* %incdec.ptr, align 1, !tbaa !1
  %conv297 = zext i8 %73 to i32
  %add298 = add nuw nsw i32 %conv297, 1
  %arrayidx299 = getelementptr inbounds i32, i32* %vla, i32 %add298
  %74 = load i32, i32* %arrayidx299, align 4, !tbaa !8
  %arrayidx300 = getelementptr inbounds i32, i32* %vla, i32 %conv297
  %75 = load i32, i32* %arrayidx300, align 4, !tbaa !8
  %div = sdiv i32 %75, %74
  store i32 %div, i32* %arrayidx300, align 4, !tbaa !8
  br label %cleanup

sw.bb302:                                         ; preds = %for.cond
  %incdec.ptr303 = getelementptr inbounds i8, i8* %p.1, i32 2
  %76 = load i8, i8* %incdec.ptr, align 1, !tbaa !1
  %conv304 = zext i8 %76 to i32
  %arrayidx305 = getelementptr inbounds i32, i32* %vla, i32 %conv304
  %77 = load i32, i32* %arrayidx305, align 4, !tbaa !8
  %add306 = add nuw nsw i32 %conv304, 1
  %arrayidx307 = getelementptr inbounds i32, i32* %vla, i32 %add306
  %78 = load i32, i32* %arrayidx307, align 4, !tbaa !8
  %cmp308 = icmp eq i32 %77, %78
  %cond310 = select i1 %cmp308, i32 1, i32 -2147483648
  store i32 %cond310, i32* %arrayidx305, align 4, !tbaa !8
  br label %cleanup

sw.bb312:                                         ; preds = %for.cond
  %incdec.ptr313 = getelementptr inbounds i8, i8* %p.1, i32 2
  %79 = load i8, i8* %incdec.ptr, align 1, !tbaa !1
  %conv314 = zext i8 %79 to i32
  %arrayidx315 = getelementptr inbounds i32, i32* %vla, i32 %conv314
  %80 = load i32, i32* %arrayidx315, align 4, !tbaa !8
  %add316 = add nuw nsw i32 %conv314, 1
  %arrayidx317 = getelementptr inbounds i32, i32* %vla, i32 %add316
  %81 = load i32, i32* %arrayidx317, align 4, !tbaa !8
  %cmp318 = icmp slt i32 %80, %81
  %cond320 = select i1 %cmp318, i32 1, i32 -2147483648
  store i32 %cond320, i32* %arrayidx315, align 4, !tbaa !8
  br label %cleanup

sw.bb322:                                         ; preds = %for.cond
  %incdec.ptr323 = getelementptr inbounds i8, i8* %p.1, i32 2
  %82 = load i8, i8* %incdec.ptr, align 1, !tbaa !1
  %conv324 = zext i8 %82 to i32
  %arrayidx325 = getelementptr inbounds i32, i32* %vla, i32 %conv324
  %83 = load i32, i32* %arrayidx325, align 4, !tbaa !8
  %add326 = add nuw nsw i32 %conv324, 1
  %arrayidx327 = getelementptr inbounds i32, i32* %vla, i32 %add326
  %84 = load i32, i32* %arrayidx327, align 4, !tbaa !8
  %cmp328 = icmp sle i32 %83, %84
  %cond330 = select i1 %cmp328, i32 1, i32 -2147483648
  store i32 %cond330, i32* %arrayidx325, align 4, !tbaa !8
  br label %cleanup

sw.bb332:                                         ; preds = %for.cond
  %incdec.ptr333 = getelementptr inbounds i8, i8* %p.1, i32 2
  %85 = load i8, i8* %incdec.ptr, align 1, !tbaa !1
  %conv334 = zext i8 %85 to i32
  %arrayidx335 = getelementptr inbounds i32, i32* %vla, i32 %conv334
  %86 = load i32, i32* %arrayidx335, align 4, !tbaa !8
  %add336 = add nuw nsw i32 %conv334, 1
  %arrayidx337 = getelementptr inbounds i32, i32* %vla, i32 %add336
  %87 = load i32, i32* %arrayidx337, align 4, !tbaa !8
  %cmp338 = icmp sgt i32 %86, %87
  %cond340 = select i1 %cmp338, i32 1, i32 -2147483648
  store i32 %cond340, i32* %arrayidx335, align 4, !tbaa !8
  br label %cleanup

sw.bb342:                                         ; preds = %for.cond
  %incdec.ptr343 = getelementptr inbounds i8, i8* %p.1, i32 2
  %88 = load i8, i8* %incdec.ptr, align 1, !tbaa !1
  %conv344 = zext i8 %88 to i32
  %arrayidx345 = getelementptr inbounds i32, i32* %vla, i32 %conv344
  %89 = load i32, i32* %arrayidx345, align 4, !tbaa !8
  %add346 = add nuw nsw i32 %conv344, 1
  %arrayidx347 = getelementptr inbounds i32, i32* %vla, i32 %add346
  %90 = load i32, i32* %arrayidx347, align 4, !tbaa !8
  %cmp348 = icmp sge i32 %89, %90
  %cond350 = select i1 %cmp348, i32 1, i32 -2147483648
  store i32 %cond350, i32* %arrayidx345, align 4, !tbaa !8
  br label %cleanup

sw.bb352:                                         ; preds = %for.cond
  %incdec.ptr353 = getelementptr inbounds i8, i8* %p.1, i32 2
  %91 = load i8, i8* %incdec.ptr, align 1, !tbaa !1
  %conv354 = zext i8 %91 to i32
  %incdec.ptr355 = getelementptr inbounds i8, i8* %p.1, i32 3
  %92 = load i8, i8* %incdec.ptr353, align 1, !tbaa !1
  %conv356 = zext i8 %92 to i32
  %call357 = call i8* @irep_get(i8* %irep, i32 1, i32 %conv356) #6
  %93 = ptrtoint i8* %call357 to i32
  %add358 = add nsw i32 %93, 2
  %arrayidx359 = getelementptr inbounds i32, i32* %vla, i32 %conv354
  store i32 %add358, i32* %arrayidx359, align 4, !tbaa !8
  br label %cleanup

sw.bb361:                                         ; preds = %for.cond
  %incdec.ptr362 = getelementptr inbounds i8, i8* %p.1, i32 2
  br label %cleanup

sw.bb365:                                         ; preds = %for.cond, %for.cond
  %incdec.ptr366 = getelementptr inbounds i8, i8* %p.1, i32 2
  %94 = load i8, i8* %incdec.ptr, align 1, !tbaa !1
  %conv367 = zext i8 %94 to i32
  %incdec.ptr368 = getelementptr inbounds i8, i8* %p.1, i32 3
  %95 = load i8, i8* %incdec.ptr366, align 1, !tbaa !1
  %conv369 = zext i8 %95 to i32
  %call370 = call i8* @irep_get(i8* %irep, i32 3, i32 %conv369) #6
  %96 = ptrtoint i8* %call370 to i32
  %arrayidx371 = getelementptr inbounds i32, i32* %vla, i32 %conv367
  store i32 %96, i32* %arrayidx371, align 4, !tbaa !8
  br label %cleanup

sw.bb376:                                         ; preds = %for.cond
  %incdec.ptr377 = getelementptr inbounds i8, i8* %p.1, i32 2
  %97 = load i8, i8* %incdec.ptr, align 1, !tbaa !1
  %conv378 = zext i8 %97 to i32
  %incdec.ptr379 = getelementptr inbounds i8, i8* %p.1, i32 3
  %98 = load i8, i8* %incdec.ptr377, align 1, !tbaa !1
  %conv380 = zext i8 %98 to i32
  %call381 = call i8* @irep_get(i8* %irep, i32 2, i32 %conv380) #6
  %add.ptr382 = getelementptr inbounds i8, i8* %call381, i32 2
  %arrayidx384 = getelementptr inbounds i32, i32* %vla, i32 %conv378
  %99 = load i32, i32* %arrayidx384, align 4, !tbaa !8
  %add385 = add nuw nsw i32 %conv378, 1
  %arrayidx386 = getelementptr inbounds i32, i32* %vla, i32 %add385
  %100 = load i32, i32* %arrayidx386, align 4, !tbaa !8
  %call387 = call i32 @mrb_memory_add(%struct.mrb_vm* %vm, i32 %99, i8* %add.ptr382, i32 %100) #6
  br label %cleanup

sw.bb388:                                         ; preds = %for.cond
  %incdec.ptr389 = getelementptr inbounds i8, i8* %p.1, i32 2
  %101 = load i8, i8* %incdec.ptr, align 1, !tbaa !1
  %conv390 = zext i8 %101 to i32
  %102 = load i32, i32* %vla, align 16, !tbaa !8
  %arrayidx392 = getelementptr inbounds i32, i32* %vla, i32 %conv390
  store i32 %102, i32* %arrayidx392, align 4, !tbaa !8
  br label %cleanup

sw.bb395:                                         ; preds = %for.cond, %for.cond, %for.cond
  %add398 = add nsw i32 %conv, -99
  br label %cleanup

sw.default:                                       ; preds = %for.cond
  store i32 1, i32* %err, align 4, !tbaa !9
  br label %cleanup404

cleanup.loopexit:                                 ; preds = %for.cond.i
  br label %cleanup

cleanup.loopexit749:                              ; preds = %for.body223
  br label %cleanup

cleanup:                                          ; preds = %cleanup.loopexit749, %cleanup.loopexit, %sw.bb208, %sw.bb23, %sw.bb31, %if.end49, %sw.bb57, %sw.bb65, %sw.bb74, %sw.bb78, %sw.bb84, %for.cond.cleanup, %sw.bb119, %if.then173, %num_times.exit, %sw.bb258, %sw.bb266, %sw.bb273, %sw.bb281, %sw.bb288, %sw.bb295, %sw.bb302, %sw.bb312, %sw.bb322, %sw.bb332, %sw.bb342, %sw.bb352, %sw.bb361, %sw.bb365, %sw.bb376, %sw.bb388, %sw.bb395, %for.cond, %sw.bb126, %if.then.i
  %opext.1.ph = phi i32 [ %opext.0, %sw.bb208 ], [ %opext.0, %if.then.i ], [ %opext.0, %sw.bb126 ], [ %opext.0, %for.cond ], [ %opext.0, %sw.bb23 ], [ %opext.0, %sw.bb31 ], [ %opext.0, %if.end49 ], [ %opext.0, %sw.bb57 ], [ %opext.0, %sw.bb65 ], [ %opext.0, %sw.bb74 ], [ %opext.0, %sw.bb78 ], [ %opext.0, %sw.bb84 ], [ %opext.0, %for.cond.cleanup ], [ %opext.0, %sw.bb119 ], [ %opext.0, %if.then173 ], [ %opext.0, %num_times.exit ], [ %opext.0, %sw.bb258 ], [ %opext.0, %sw.bb266 ], [ %opext.0, %sw.bb273 ], [ %opext.0, %sw.bb281 ], [ %opext.0, %sw.bb288 ], [ %opext.0, %sw.bb295 ], [ %opext.0, %sw.bb302 ], [ %opext.0, %sw.bb312 ], [ %opext.0, %sw.bb322 ], [ %opext.0, %sw.bb332 ], [ %opext.0, %sw.bb342 ], [ %opext.0, %sw.bb352 ], [ %opext.0, %sw.bb361 ], [ %opext.0, %sw.bb365 ], [ %opext.0, %sw.bb376 ], [ %opext.0, %sw.bb388 ], [ %add398, %sw.bb395 ], [ %opext.0, %cleanup.loopexit ], [ %opext.0, %cleanup.loopexit749 ]
  %p.3.ph = phi i8* [ %incdec.ptr216, %sw.bb208 ], [ %incdec.ptr159, %if.then.i ], [ %incdec.ptr132.add.ptr152, %sw.bb126 ], [ %incdec.ptr, %for.cond ], [ %incdec.ptr26, %sw.bb23 ], [ %incdec.ptr34, %sw.bb31 ], [ %p.2, %if.end49 ], [ %incdec.ptr58, %sw.bb57 ], [ %incdec.ptr68, %sw.bb65 ], [ %incdec.ptr75, %sw.bb74 ], [ %incdec.ptr79, %sw.bb78 ], [ %incdec.ptr85, %sw.bb84 ], [ %incdec.ptr100, %for.cond.cleanup ], [ %add.ptr125, %sw.bb119 ], [ %incdec.ptr159, %if.then173 ], [ %incdec.ptr183, %num_times.exit ], [ %incdec.ptr259, %sw.bb258 ], [ %incdec.ptr269, %sw.bb266 ], [ %incdec.ptr274, %sw.bb273 ], [ %incdec.ptr284, %sw.bb281 ], [ %incdec.ptr289, %sw.bb288 ], [ %incdec.ptr296, %sw.bb295 ], [ %incdec.ptr303, %sw.bb302 ], [ %incdec.ptr313, %sw.bb312 ], [ %incdec.ptr323, %sw.bb322 ], [ %incdec.ptr333, %sw.bb332 ], [ %incdec.ptr343, %sw.bb342 ], [ %incdec.ptr355, %sw.bb352 ], [ %incdec.ptr362, %sw.bb361 ], [ %incdec.ptr368, %sw.bb365 ], [ %incdec.ptr379, %sw.bb376 ], [ %incdec.ptr389, %sw.bb388 ], [ %incdec.ptr, %sw.bb395 ], [ %incdec.ptr183, %cleanup.loopexit ], [ %incdec.ptr216, %cleanup.loopexit749 ]
  %.pr = load i32, i32* %err, align 4, !tbaa !9
  %tobool400 = icmp eq i32 %.pr, 0
  br i1 %tobool400, label %for.cond, label %cleanup404.loopexit

cleanup404.loopexit:                              ; preds = %cleanup, %for.cond
  %retval.1722.ph = phi i32 [ 0, %for.cond ], [ %.pr, %cleanup ]
  br label %cleanup404

cleanup404:                                       ; preds = %cleanup404.loopexit, %if.else.i, %sw.default, %sw.bb250
  %retval.1722 = phi i32 [ %57, %sw.bb250 ], [ 2, %if.else.i ], [ 1, %sw.default ], [ %retval.1722.ph, %cleanup404.loopexit ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %3) #7
  ret i32 %retval.1722
}

; Function Attrs: norecurse nounwind optsize readonly
define hidden i32 @irep_atol(i8* nocapture readonly %s) local_unnamed_addr #3 {
entry:
  %0 = load i8, i8* %s, align 1, !tbaa !1
  switch i8 %0, label %if.end7 [
    i8 45, label %if.then
    i8 43, label %if.then5
  ]

if.then:                                          ; preds = %entry
  %incdec.ptr = getelementptr inbounds i8, i8* %s, i32 1
  br label %if.end7

if.then5:                                         ; preds = %entry
  %incdec.ptr6 = getelementptr inbounds i8, i8* %s, i32 1
  br label %if.end7

if.end7:                                          ; preds = %entry, %if.then5, %if.then
  %flg.0 = phi i32 [ 1, %if.then ], [ 0, %if.then5 ], [ 0, %entry ]
  %s.addr.0 = phi i8* [ %incdec.ptr, %if.then ], [ %incdec.ptr6, %if.then5 ], [ %s, %entry ]
  %1 = load i8, i8* %s.addr.0, align 1, !tbaa !1
  %.off29 = add i8 %1, -48
  %2 = icmp ugt i8 %.off29, 9
  br i1 %2, label %for.end, label %cleanup.thread.preheader

cleanup.thread.preheader:                         ; preds = %if.end7
  br label %cleanup.thread

cleanup.thread:                                   ; preds = %cleanup.thread.preheader, %cleanup.thread
  %3 = phi i8 [ %4, %cleanup.thread ], [ %1, %cleanup.thread.preheader ]
  %s.addr.131 = phi i8* [ %incdec.ptr8, %cleanup.thread ], [ %s.addr.0, %cleanup.thread.preheader ]
  %n.030 = phi i32 [ %add, %cleanup.thread ], [ 0, %cleanup.thread.preheader ]
  %incdec.ptr8 = getelementptr inbounds i8, i8* %s.addr.131, i32 1
  %conv9 = sext i8 %3 to i32
  %mul = mul nsw i32 %n.030, 10
  %sub = add i32 %mul, -48
  %add = add i32 %sub, %conv9
  %4 = load i8, i8* %incdec.ptr8, align 1, !tbaa !1
  %.off = add i8 %4, -48
  %5 = icmp ugt i8 %.off, 9
  br i1 %5, label %for.end.loopexit, label %cleanup.thread

for.end.loopexit:                                 ; preds = %cleanup.thread
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %if.end7
  %n.0.lcssa = phi i32 [ 0, %if.end7 ], [ %add, %for.end.loopexit ]
  %tobool = icmp ne i32 %flg.0, 0
  %sub16 = sub nsw i32 0, %n.0.lcssa
  %cond = select i1 %tobool, i32 %sub16, i32 %n.0.lcssa
  ret i32 %cond
}

; Function Attrs: norecurse nounwind optsize
define hidden void @emb_method(%struct.mrb_vm* nocapture %vm, i8* nocapture readonly %func, i32* nocapture %reg, i32 %a, i32 %paramlen) local_unnamed_addr #4 {
entry:
  br label %for.cond.i

for.cond.i:                                       ; preds = %cleanup.i, %entry
  %buf2.addr.0.i = phi i8* [ getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i32 0, i32 0), %entry ], [ %incdec.ptr1.i, %cleanup.i ]
  %buf1.addr.0.i = phi i8* [ %func, %entry ], [ %incdec.ptr.i, %cleanup.i ]
  %0 = load i8, i8* %buf1.addr.0.i, align 1, !tbaa !1
  %1 = load i8, i8* %buf2.addr.0.i, align 1, !tbaa !1
  %tobool.i = icmp eq i8 %0, %1
  br i1 %tobool.i, label %cleanup.i, label %if.else

cleanup.i:                                        ; preds = %for.cond.i
  %incdec.ptr1.i = getelementptr inbounds i8, i8* %buf2.addr.0.i, i32 1
  %incdec.ptr.i = getelementptr inbounds i8, i8* %buf1.addr.0.i, i32 1
  %tobool3.i = icmp eq i8 %0, 0
  br i1 %tobool3.i, label %if.then, label %for.cond.i

if.then:                                          ; preds = %cleanup.i
  %arrayidx = getelementptr inbounds i32, i32* %reg, i32 %a
  %2 = load i32, i32* %arrayidx, align 4, !tbaa !8
  %add = add nsw i32 %a, 1
  %arrayidx1 = getelementptr inbounds i32, i32* %reg, i32 %add
  %3 = load i32, i32* %arrayidx1, align 4, !tbaa !8
  %cmp2 = icmp ne i32 %2, %3
  %cond = select i1 %cmp2, i32 1, i32 -2147483648
  store i32 %cond, i32* %arrayidx, align 4, !tbaa !8
  br label %if.end

if.else:                                          ; preds = %for.cond.i
  %err = getelementptr inbounds %struct.mrb_vm, %struct.mrb_vm* %vm, i32 0, i32 0
  store i32 2, i32* %err, align 4, !tbaa !9
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void
}

; Function Attrs: norecurse nounwind optsize readnone
define hidden i8* @getMemory() local_unnamed_addr #2 {
entry:
  ret i8* getelementptr inbounds ([16384 x i8], [16384 x i8]* @mem, i32 0, i32 0)
}

; Function Attrs: norecurse nounwind optsize readnone
define hidden i32 @getMemorySize() local_unnamed_addr #2 {
entry:
  ret i32 16384
}

; Function Attrs: nounwind optsize
define hidden i32 @exec() local_unnamed_addr #5 {
entry:
  %vm = alloca %struct.mrb_vm, align 4
  %0 = bitcast %struct.mrb_vm* %vm to i8*
  call void @llvm.lifetime.start.p0i8(i64 252, i8* nonnull %0) #7
  %err = getelementptr inbounds %struct.mrb_vm, %struct.mrb_vm* %vm, i32 0, i32 0
  store i32 0, i32* %err, align 4, !tbaa !9
  %nmemory = getelementptr inbounds %struct.mrb_vm, %struct.mrb_vm* %vm, i32 0, i32 1
  store i32 0, i32* %nmemory, align 4, !tbaa !4
  %call = call i32 @irep_exec(%struct.mrb_vm* nonnull %vm, i8* getelementptr inbounds ([16384 x i8], [16384 x i8]* @mem, i32 0, i32 34), %struct.mrb_state* null, i32 0) #6
  call void @llvm.lifetime.end.p0i8(i64 252, i8* nonnull %0) #7
  ret i32 %call
}

attributes #0 = { nounwind optsize readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { norecurse nounwind optsize readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { norecurse nounwind optsize readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { norecurse nounwind optsize "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind optsize "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { optsize }
attributes #7 = { nounwind }
attributes #8 = { nounwind optsize }

!llvm.ident = !{!0}

!0 = !{!"clang version 5.0.0 (http://llvm.org/git/clang.git 01734df77696b4d9ba1debc1823b29673cae6a6c) (http://llvm.org/git/llvm.git c67ef6aaf75865024462576a5b790e46ccc2e75e)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"omnipotent char", !3, i64 0}
!3 = !{!"Simple C/C++ TBAA"}
!4 = !{!5, !6, i64 4}
!5 = !{!"mrb_vm", !6, i64 0, !6, i64 4, !2, i64 8, !7, i64 248}
!6 = !{!"int", !2, i64 0}
!7 = !{!"any pointer", !2, i64 0}
!8 = !{!6, !6, i64 0}
!9 = !{!5, !6, i64 0}
!10 = !{!11, !7, i64 0}
!11 = !{!"mrb_state", !7, i64 0, !7, i64 4}
!12 = !{!11, !7, i64 4}
