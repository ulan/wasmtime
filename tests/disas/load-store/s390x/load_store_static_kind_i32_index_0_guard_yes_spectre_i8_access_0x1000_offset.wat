;;! target = "s390x"
;;! test = "compile"
;;! flags = " -C cranelift-enable-heap-access-spectre-mitigation -O static-memory-forced -O static-memory-guard-size=0 -O dynamic-memory-guard-size=0"

;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;; !!! GENERATED BY 'make-load-store-tests.sh' DO NOT EDIT !!!
;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

(module
  (memory i32 1)

  (func (export "do_store") (param i32 i32)
    local.get 0
    local.get 1
    i32.store8 offset=0x1000)

  (func (export "do_load") (param i32) (result i32)
    local.get 0
    i32.load8_u offset=0x1000))

;; function u0:0:
;;   unwind DefineNewFrame { offset_upward_to_caller_sp: 160, offset_downward_to_clobbers: 0 }
;;   stmg %r6, %r15, 48(%r15)
;;   unwind SaveReg { clobber_offset: 48, reg: p6i }
;;   unwind SaveReg { clobber_offset: 56, reg: p7i }
;;   unwind SaveReg { clobber_offset: 64, reg: p8i }
;;   unwind SaveReg { clobber_offset: 72, reg: p9i }
;;   unwind SaveReg { clobber_offset: 80, reg: p10i }
;;   unwind SaveReg { clobber_offset: 88, reg: p11i }
;;   unwind SaveReg { clobber_offset: 96, reg: p12i }
;;   unwind SaveReg { clobber_offset: 104, reg: p13i }
;;   unwind SaveReg { clobber_offset: 112, reg: p14i }
;;   unwind SaveReg { clobber_offset: 120, reg: p15i }
;;   unwind StackAlloc { size: 0 }
;; block0:
;;   llgfr %r4, %r4
;;   lghi %r3, 0
;;   lgr %r6, %r4
;;   ag %r6, 80(%r2)
;;   aghik %r2, %r6, 4096
;;   clgfi %r4, 4294963199
;;   locgrh %r2, %r3
;;   stc %r5, 0(%r2)
;;   jg label1
;; block1:
;;   lmg %r6, %r15, 48(%r15)
;;   br %r14
;;
;; function u0:1:
;;   unwind DefineNewFrame { offset_upward_to_caller_sp: 160, offset_downward_to_clobbers: 0 }
;;   unwind StackAlloc { size: 0 }
;; block0:
;;   llgfr %r4, %r4
;;   lghi %r3, 0
;;   lgr %r5, %r4
;;   ag %r5, 80(%r2)
;;   aghik %r2, %r5, 4096
;;   clgfi %r4, 4294963199
;;   locgrh %r2, %r3
;;   llc %r2, 0(%r2)
;;   jg label1
;; block1:
;;   br %r14