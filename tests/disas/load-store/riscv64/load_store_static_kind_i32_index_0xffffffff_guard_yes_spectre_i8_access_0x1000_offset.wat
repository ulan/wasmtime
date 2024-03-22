;;! target = "riscv64"
;;! test = "compile"
;;! flags = " -C cranelift-enable-heap-access-spectre-mitigation -O static-memory-forced -O static-memory-guard-size=4294967295 -O dynamic-memory-guard-size=4294967295"

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
;; block0:
;;   ld a4,80(a0)
;;   slli a1,a2,32
;;   srli a5,a1,32
;;   add a2,a4,a5
;;   sb a3,4096(a2)
;;   j label1
;; block1:
;;   ret
;;
;; function u0:1:
;; block0:
;;   ld a3,80(a0)
;;   slli a1,a2,32
;;   srli a4,a1,32
;;   add a2,a3,a4
;;   lbu a0,4096(a2)
;;   j label1
;; block1:
;;   ret