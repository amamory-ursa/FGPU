; ModuleID = 'bitonic.cl'
target datalayout = "E-m:m-p:32:32-i8:8:32-i16:16:32-i64:64-n32-S64"
target triple = "mips-unknown-uknown"

; Function Attrs: nounwind
define void @bitonicSort(i32* nocapture %a, i32 signext %stage, i32 signext %passOfStage, i32 signext %direction) #0 {
entry:
  %0 = tail call i32 asm sideeffect "lid $0, $1", "=r,I,~{$1}"(i32 0) #2, !srcloc !10
  %1 = tail call i32 asm sideeffect "wgoff $0, $1", "=r,I,~{$1}"(i32 0) #2, !srcloc !11
  %add.i = add nsw i32 %1, %0
  %sub = sub i32 %stage, %passOfStage
  %shl.mask = and i32 %sub, 31
  %shl = shl i32 1, %shl.mask
  %mul = shl i32 %shl, 1
  %2 = add i32 %shl, -1
  %rem = and i32 %add.i, %2
  %div = lshr i32 %add.i, %shl.mask
  %mul1 = mul i32 %mul, %div
  %add = add i32 %mul1, %rem
  %add2 = add i32 %add, %shl
  %arrayidx = getelementptr inbounds i32, i32* %a, i32 %add
  %3 = load i32, i32* %arrayidx, align 4, !tbaa !12
  %arrayidx3 = getelementptr inbounds i32, i32* %a, i32 %add2
  %4 = load i32, i32* %arrayidx3, align 4, !tbaa !12
  %shl.mask4 = and i32 %stage, 31
  %5 = shl i32 1, %shl.mask4
  %rem762 = and i32 %add.i, %5
  %cmp = icmp eq i32 %rem762, 0
  %sub8 = sub i32 1, %direction
  %direction.sub8 = select i1 %cmp, i32 %direction, i32 %sub8
  %cmp9 = icmp sgt i32 %3, %4
  %cond = select i1 %cmp9, i32 %3, i32 %4
  %cond14 = select i1 %cmp9, i32 %4, i32 %3
  %tobool15 = icmp ne i32 %direction.sub8, 0
  %cond19 = select i1 %tobool15, i32 %cond14, i32 %cond
  %cond24 = select i1 %tobool15, i32 %cond, i32 %cond14
  store i32 %cond19, i32* %arrayidx, align 4, !tbaa !12
  store i32 %cond24, i32* %arrayidx3, align 4, !tbaa !12
  ret void
}

; Function Attrs: nounwind readnone
define i32 @__eqsf2(float %a, float %b) #1 {
entry:
  %0 = bitcast float %a to i32
  %1 = bitcast float %b to i32
  %cmp = icmp eq i32 %0, %1
  %cond = zext i1 %cmp to i32
  %and13 = or i32 %1, %0
  %or = and i32 %and13, 2147483647
  %cmp3 = icmp eq i32 %or, 0
  %cond4 = select i1 %cmp3, i32 1, i32 %cond
  ret i32 %cond4
}

; Function Attrs: nounwind readnone
define i32 @__nesf2(float %a, float %b) #1 {
entry:
  %0 = bitcast float %a to i32
  %1 = bitcast float %b to i32
  %not.cmp = icmp ne i32 %0, %1
  %cond = zext i1 %not.cmp to i32
  %and13 = or i32 %1, %0
  %or = and i32 %and13, 2147483647
  %cmp3 = icmp eq i32 %or, 0
  %cond4 = select i1 %cmp3, i32 0, i32 %cond
  ret i32 %cond4
}

; Function Attrs: nounwind readnone
define i32 @__lesf2(float %a, float %b) #1 {
entry:
  %0 = bitcast float %a to i32
  %1 = bitcast float %b to i32
  %cmp = icmp slt i32 %0, %1
  %cmp3 = icmp sgt i32 %0, %1
  %and5 = and i32 %1, %0
  %cmp6 = icmp sgt i32 %and5, -1
  %cond7.v = select i1 %cmp6, i1 %cmp, i1 %cmp3
  %cond7 = zext i1 %cond7.v to i32
  %cmp8 = icmp eq i32 %0, %1
  %and35 = or i32 %1, %0
  %or = and i32 %and35, 2147483647
  %cmp13 = icmp eq i32 %or, 0
  %2 = or i1 %cmp8, %cmp13
  %cond17 = select i1 %2, i32 1, i32 %cond7
  ret i32 %cond17
}

; Function Attrs: nounwind readnone
define i32 @__ltsf2(float %a, float %b) #1 {
entry:
  %0 = bitcast float %a to i32
  %1 = bitcast float %b to i32
  %cmp = icmp slt i32 %0, %1
  %cmp3 = icmp sgt i32 %0, %1
  %and5 = and i32 %1, %0
  %cmp6 = icmp sgt i32 %and5, -1
  %cond7.v = select i1 %cmp6, i1 %cmp, i1 %cmp3
  %cond7 = zext i1 %cond7.v to i32
  %cmp8 = icmp eq i32 %0, %1
  %and35 = or i32 %1, %0
  %or = and i32 %and35, 2147483647
  %cmp13 = icmp eq i32 %or, 0
  %2 = or i1 %cmp8, %cmp13
  %cond17 = select i1 %2, i32 0, i32 %cond7
  ret i32 %cond17
}

; Function Attrs: nounwind readnone
define i32 @__gesf2(float %a, float %b) #1 {
entry:
  %0 = bitcast float %a to i32
  %1 = bitcast float %b to i32
  %not.cmp = icmp sge i32 %0, %1
  %not.cmp3 = icmp sle i32 %0, %1
  %and5 = and i32 %1, %0
  %cmp6 = icmp sgt i32 %and5, -1
  %cond7.v = select i1 %cmp6, i1 %not.cmp, i1 %not.cmp3
  %cond7 = zext i1 %cond7.v to i32
  %cmp8 = icmp eq i32 %0, %1
  %and35 = or i32 %1, %0
  %or = and i32 %and35, 2147483647
  %cmp13 = icmp eq i32 %or, 0
  %2 = or i1 %cmp8, %cmp13
  %cond17 = select i1 %2, i32 1, i32 %cond7
  ret i32 %cond17
}

; Function Attrs: nounwind readnone
define i32 @__gtsf2(float %a, float %b) #1 {
entry:
  %0 = bitcast float %a to i32
  %1 = bitcast float %b to i32
  %not.cmp = icmp sge i32 %0, %1
  %not.cmp3 = icmp sle i32 %0, %1
  %and5 = and i32 %1, %0
  %cmp6 = icmp sgt i32 %and5, -1
  %cond7.v = select i1 %cmp6, i1 %not.cmp, i1 %not.cmp3
  %cond7 = zext i1 %cond7.v to i32
  %cmp8 = icmp eq i32 %0, %1
  %and35 = or i32 %1, %0
  %or = and i32 %and35, 2147483647
  %cmp13 = icmp eq i32 %or, 0
  %2 = or i1 %cmp8, %cmp13
  %cond17 = select i1 %2, i32 0, i32 %cond7
  ret i32 %cond17
}

; Function Attrs: nounwind
define void @bitonicSort_float(float* nocapture %a, i32 signext %stage, i32 signext %passOfStage, i32 signext %direction) #0 {
entry:
  %0 = tail call i32 asm sideeffect "lid $0, $1", "=r,I,~{$1}"(i32 0) #2, !srcloc !10
  %1 = tail call i32 asm sideeffect "wgoff $0, $1", "=r,I,~{$1}"(i32 0) #2, !srcloc !11
  %add.i = add nsw i32 %1, %0
  %sub = sub i32 %stage, %passOfStage
  %shl.mask = and i32 %sub, 31
  %shl = shl i32 1, %shl.mask
  %mul = shl i32 %shl, 1
  %2 = add i32 %shl, -1
  %rem = and i32 %add.i, %2
  %div = lshr i32 %add.i, %shl.mask
  %mul1 = mul i32 %mul, %div
  %add = add i32 %mul1, %rem
  %add2 = add i32 %add, %shl
  %arrayidx = getelementptr inbounds float, float* %a, i32 %add
  %3 = load float, float* %arrayidx, align 4, !tbaa !16
  %arrayidx3 = getelementptr inbounds float, float* %a, i32 %add2
  %4 = load float, float* %arrayidx3, align 4, !tbaa !16
  %shl.mask4 = and i32 %stage, 31
  %5 = shl i32 1, %shl.mask4
  %rem764 = and i32 %add.i, %5
  %cmp = icmp eq i32 %rem764, 0
  %sub8 = sub i32 1, %direction
  %direction.sub8 = select i1 %cmp, i32 %direction, i32 %sub8
  %cmp9 = fcmp ogt float %3, %4
  %cond = select i1 %cmp9, float %3, float %4
  %cond17 = select i1 %cmp9, float %4, float %3
  %tobool = icmp ne i32 %direction.sub8, 0
  %cond21 = select i1 %tobool, float %cond17, float %cond
  %cond26 = select i1 %tobool, float %cond, float %cond17
  store float %cond21, float* %arrayidx, align 4, !tbaa !16
  store float %cond26, float* %arrayidx3, align 4, !tbaa !16
  ret void
}

attributes #0 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="mips32r2" "target-features"="+mips32r2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="mips32r2" "target-features"="+mips32r2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!opencl.kernels = !{!0, !6}
!llvm.ident = !{!9}

!0 = !{void (i32*, i32, i32, i32)* @bitonicSort, !1, !2, !3, !4, !5}
!1 = !{!"kernel_arg_addr_space", i32 0, i32 0, i32 0, i32 0}
!2 = !{!"kernel_arg_access_qual", !"none", !"none", !"none", !"none"}
!3 = !{!"kernel_arg_type", !"int*", !"uint", !"uint", !"uint"}
!4 = !{!"kernel_arg_base_type", !"int*", !"uint", !"uint", !"uint"}
!5 = !{!"kernel_arg_type_qual", !"", !"", !"", !""}
!6 = !{void (float*, i32, i32, i32)* @bitonicSort_float, !1, !2, !7, !8, !5}
!7 = !{!"kernel_arg_type", !"float*", !"uint", !"uint", !"uint"}
!8 = !{!"kernel_arg_base_type", !"float*", !"uint", !"uint", !"uint"}
!9 = !{!"clang version 3.7.0 (tags/RELEASE_371/final)"}
!10 = !{i32 13803}
!11 = !{i32 13943}
!12 = !{!13, !13, i64 0}
!13 = !{!"int", !14, i64 0}
!14 = !{!"omnipotent char", !15, i64 0}
!15 = !{!"Simple C/C++ TBAA"}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !14, i64 0}