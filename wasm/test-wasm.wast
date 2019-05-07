(module
 (table 0 anyfunc)
 (memory $0 2)
 (data (i32.const 4) "\d0\c6\01\00")
 (data (i32.const 16) "times\00")
 (data (i32.const 16416) "!=\00")
 (export "memory" (memory $0))
 (export "irep_get" (func $irep_get))
 (export "showRegs" (func $showRegs))
 (export "mrb_memory_find" (func $mrb_memory_find))
 (export "mrb_strcmp" (func $mrb_strcmp))
 (export "mrb_memory_add" (func $mrb_memory_add))
 (export "irep_exec" (func $irep_exec))
 (export "irep_atol" (func $irep_atol))
 (export "emb_method" (func $emb_method))
 (export "getMemory" (func $getMemory))
 (export "getMemorySize" (func $getMemorySize))
 (export "exec" (func $exec))
 (func $irep_get (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (set_local $6
   (i32.add
    (tee_local $3
     (i32.add
      (select
       (i32.add
        (tee_local $6
         (i32.add
          (get_local $0)
          (i32.const 14)
         )
        )
        (i32.sub
         (i32.const 4)
         (tee_local $3
          (i32.and
           (get_local $6)
           (i32.const 3)
          )
         )
        )
       )
       (get_local $6)
       (get_local $3)
      )
      (i32.or
       (i32.shl
        (i32.load8_u offset=12
         (get_local $0)
        )
        (i32.const 8)
       )
       (i32.load8_u offset=13
        (get_local $0)
       )
      )
     )
    )
    (i32.const 4)
   )
  )
  (set_local $4
   (i32.load8_u offset=8
    (get_local $0)
   )
  )
  (set_local $5
   (i32.load8_u offset=9
    (get_local $0)
   )
  )
  (block $label$0
   (br_if $label$0
    (i32.lt_s
     (tee_local $0
      (select
       (get_local $2)
       (i32.or
        (i32.shl
         (i32.load8_u offset=2
          (get_local $3)
         )
         (i32.const 8)
        )
        (i32.load8_u
         (i32.add
          (get_local $3)
          (i32.const 3)
         )
        )
       )
       (tee_local $3
        (i32.eq
         (get_local $1)
         (i32.const 1)
        )
       )
      )
     )
     (i32.const 1)
    )
   )
   (loop $label$1
    (set_local $6
     (i32.add
      (i32.add
       (get_local $6)
       (i32.or
        (i32.shl
         (i32.load8_u offset=1
          (get_local $6)
         )
         (i32.const 8)
        )
        (i32.load8_u offset=2
         (get_local $6)
        )
       )
      )
      (i32.const 3)
     )
    )
    (br_if $label$1
     (tee_local $0
      (i32.add
       (get_local $0)
       (i32.const -1)
      )
     )
    )
   )
  )
  (block $label$2
   (br_if $label$2
    (get_local $3)
   )
   (set_local $0
    (i32.load8_u offset=2
     (get_local $6)
    )
   )
   (set_local $3
    (i32.load8_u offset=3
     (get_local $6)
    )
   )
   (set_local $6
    (i32.add
     (get_local $6)
     (i32.const 4)
    )
   )
   (block $label$3
    (br_if $label$3
     (i32.lt_s
      (tee_local $0
       (select
        (get_local $2)
        (i32.or
         (get_local $3)
         (i32.shl
          (get_local $0)
          (i32.const 8)
         )
        )
        (tee_local $3
         (i32.eq
          (get_local $1)
          (i32.const 2)
         )
        )
       )
      )
      (i32.const 1)
     )
    )
    (loop $label$4
     (set_local $6
      (i32.add
       (i32.add
        (get_local $6)
        (i32.or
         (i32.shl
          (i32.load8_u
           (get_local $6)
          )
          (i32.const 8)
         )
         (i32.load8_u offset=1
          (get_local $6)
         )
        )
       )
       (i32.const 3)
      )
     )
     (br_if $label$4
      (tee_local $0
       (i32.add
        (get_local $0)
        (i32.const -1)
       )
      )
     )
    )
   )
   (br_if $label$2
    (get_local $3)
   )
   (br_if $label$2
    (i32.lt_s
     (tee_local $0
      (select
       (get_local $2)
       (i32.or
        (i32.shl
         (get_local $4)
         (i32.const 8)
        )
        (get_local $5)
       )
       (i32.eq
        (get_local $1)
        (i32.const 3)
       )
      )
     )
     (i32.const 1)
    )
   )
   (loop $label$5
    (set_local $6
     (call $irep_get
      (get_local $6)
      (i32.const 0)
      (i32.const 0)
     )
    )
    (br_if $label$5
     (tee_local $0
      (i32.add
       (get_local $0)
       (i32.const -1)
      )
     )
    )
   )
  )
  (get_local $6)
 )
 (func $showRegs (param $0 i32) (param $1 i32)
 )
 (func $mrb_memory_find (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (block $label$0
   (block $label$1
    (br_if $label$1
     (i32.lt_s
      (tee_local $7
       (i32.load offset=4
        (get_local $0)
       )
      )
      (i32.const 1)
     )
    )
    (set_local $3
     (i32.mul
      (get_local $7)
      (i32.const 3)
     )
    )
    (set_local $5
     (i32.const 0)
    )
    (loop $label$2
     (block $label$3
      (br_if $label$3
       (i32.ne
        (i32.load
         (tee_local $8
          (i32.add
           (tee_local $7
            (i32.add
             (get_local $0)
             (i32.shl
              (get_local $5)
              (i32.const 2)
             )
            )
           )
           (i32.const 8)
          )
         )
        )
        (get_local $1)
       )
      )
      (set_local $7
       (i32.load
        (i32.add
         (get_local $7)
         (i32.const 12)
        )
       )
      )
      (set_local $6
       (get_local $2)
      )
      (loop $label$4
       (br_if $label$3
        (i32.ne
         (tee_local $4
          (i32.load8_u
           (get_local $7)
          )
         )
         (i32.load8_u
          (get_local $6)
         )
        )
       )
       (set_local $7
        (i32.add
         (get_local $7)
         (i32.const 1)
        )
       )
       (set_local $6
        (i32.add
         (get_local $6)
         (i32.const 1)
        )
       )
       (br_if $label$4
        (get_local $4)
       )
       (br $label$0)
      )
     )
     (br_if $label$2
      (i32.lt_s
       (tee_local $5
        (i32.add
         (get_local $5)
         (i32.const 3)
        )
       )
       (get_local $3)
      )
     )
    )
   )
   (set_local $8
    (i32.const 0)
   )
  )
  (get_local $8)
 )
 (func $mrb_strcmp (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (block $label$0
   (loop $label$1
    (br_if $label$0
     (tee_local $3
      (i32.sub
       (tee_local $2
        (i32.load8_s
         (get_local $0)
        )
       )
       (i32.load8_s
        (get_local $1)
       )
      )
     )
    )
    (set_local $0
     (i32.add
      (get_local $0)
      (i32.const 1)
     )
    )
    (set_local $1
     (i32.add
      (get_local $1)
      (i32.const 1)
     )
    )
    (br_if $label$1
     (get_local $2)
    )
   )
   (set_local $3
    (i32.const 0)
   )
  )
  (get_local $3)
 )
 (func $mrb_memory_add (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (result i32)
  (local $4 i32)
  (block $label$0
   (br_if $label$0
    (i32.eqz
     (tee_local $4
      (call $mrb_memory_find
       (get_local $0)
       (get_local $1)
       (get_local $2)
      )
     )
    )
   )
   (i32.store offset=8
    (get_local $4)
    (get_local $3)
   )
   (return
    (i32.const 1)
   )
  )
  (block $label$1
   (br_if $label$1
    (i32.ne
     (tee_local $4
      (i32.load offset=4
       (get_local $0)
      )
     )
     (i32.const 20)
    )
   )
   (i32.store
    (get_local $0)
    (i32.const 3)
   )
   (return
    (i32.const 0)
   )
  )
  (i32.store
   (i32.add
    (tee_local $4
     (i32.add
      (get_local $0)
      (i32.mul
       (get_local $4)
       (i32.const 12)
      )
     )
    )
    (i32.const 16)
   )
   (get_local $3)
  )
  (i32.store
   (i32.add
    (get_local $4)
    (i32.const 12)
   )
   (get_local $2)
  )
  (i32.store
   (i32.add
    (get_local $4)
    (i32.const 8)
   )
   (get_local $1)
  )
  (i32.store
   (tee_local $0
    (i32.add
     (get_local $0)
     (i32.const 4)
    )
   )
   (i32.add
    (i32.load
     (get_local $0)
    )
    (i32.const 1)
   )
  )
  (i32.const 1)
 )
 (func $irep_exec (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (result i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $12
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 32)
    )
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (tee_local $4
    (i32.sub
     (get_local $12)
     (i32.and
      (i32.add
       (i32.shl
        (i32.or
         (i32.shl
          (i32.load8_u offset=6
           (get_local $1)
          )
          (i32.const 8)
         )
         (i32.load8_u offset=7
          (get_local $1)
         )
        )
        (i32.const 2)
       )
       (i32.const 11)
      )
      (i32.const 524272)
     )
    )
   )
  )
  (i32.store offset=4
   (tee_local $14
    (get_local $12)
   )
   (get_local $4)
  )
  (i32.store
   (get_local $14)
   (get_local $2)
  )
  (set_local $10
   (i32.add
    (tee_local $12
     (i32.add
      (get_local $1)
      (i32.const 14)
     )
    )
    (i32.sub
     (i32.const 4)
     (tee_local $13
      (i32.and
       (get_local $12)
       (i32.const 3)
      )
     )
    )
   )
  )
  (set_local $8
   (i32.const 1)
  )
  (block $label$0
   (br_if $label$0
    (i32.eqz
     (get_local $3)
    )
   )
   (set_local $8
    (i32.load
     (i32.add
      (i32.load
       (i32.add
        (get_local $2)
        (i32.const 4)
       )
      )
      (i32.shl
       (get_local $3)
       (i32.const 2)
      )
     )
    )
   )
  )
  (i32.store
   (get_local $4)
   (get_local $8)
  )
  (set_local $7
   (i32.add
    (get_local $3)
    (i32.const 1)
   )
  )
  (set_local $6
   (i32.add
    (get_local $4)
    (i32.const 4)
   )
  )
  (set_local $11
   (i32.const 0)
  )
  (set_local $12
   (tee_local $5
    (select
     (get_local $10)
     (get_local $12)
     (get_local $13)
    )
   )
  )
  (block $label$1
   (loop $label$2
    (block $label$3
     (block $label$4
      (block $label$5
       (block $label$6
        (block $label$7
         (br_if $label$7
          (i32.gt_u
           (tee_local $8
            (i32.load8_u
             (tee_local $3
              (get_local $12)
             )
            )
           )
           (i32.const 103)
          )
         )
         (set_local $12
          (i32.add
           (get_local $3)
           (i32.const 1)
          )
         )
         (set_local $13
          (i32.const 0)
         )
         (block $label$8
          (block $label$9
           (block $label$10
            (block $label$11
             (block $label$12
              (block $label$13
               (block $label$14
                (block $label$15
                 (block $label$16
                  (block $label$17
                   (block $label$18
                    (block $label$19
                     (block $label$20
                      (block $label$21
                       (block $label$22
                        (block $label$23
                         (block $label$24
                          (block $label$25
                           (block $label$26
                            (block $label$27
                             (block $label$28
                              (block $label$29
                               (block $label$30
                                (block $label$31
                                 (block $label$32
                                  (block $label$33
                                   (block $label$34
                                    (block $label$35
                                     (block $label$36
                                      (block $label$37
                                       (block $label$38
                                        (block $label$39
                                         (block $label$40
                                          (block $label$41
                                           (br_table $label$3 $label$34 $label$33 $label$39 $label$39 $label$41 $label$41 $label$41 $label$41 $label$41 $label$41 $label$41 $label$41 $label$41 $label$32 $label$31 $label$30 $label$38 $label$38 $label$7 $label$7 $label$7 $label$7 $label$7 $label$7 $label$7 $label$7 $label$7 $label$7 $label$7 $label$7 $label$37 $label$37 $label$29 $label$36 $label$36 $label$7 $label$7 $label$7 $label$7 $label$7 $label$7 $label$7 $label$7 $label$7 $label$7 $label$28 $label$27 $label$7 $label$7 $label$7 $label$26 $label$7 $label$7 $label$7 $label$8 $label$8 $label$8 $label$7 $label$25 $label$24 $label$23 $label$22 $label$21 $label$20 $label$19 $label$18 $label$17 $label$16 $label$15 $label$7 $label$7 $label$7 $label$7 $label$7 $label$7 $label$7 $label$7 $label$7 $label$14 $label$13 $label$7 $label$7 $label$7 $label$7 $label$35 $label$35 $label$7 $label$7 $label$7 $label$7 $label$7 $label$7 $label$12 $label$7 $label$7 $label$7 $label$11 $label$7 $label$7 $label$40 $label$40 $label$40 $label$1 $label$3
                                            (get_local $8)
                                           )
                                          )
                                          (i32.store
                                           (i32.add
                                            (get_local $4)
                                            (i32.shl
                                             (i32.load8_u
                                              (i32.add
                                               (get_local $3)
                                               (i32.const 1)
                                              )
                                             )
                                             (i32.const 2)
                                            )
                                           )
                                           (i32.add
                                            (get_local $8)
                                            (i32.const -6)
                                           )
                                          )
                                          (set_local $12
                                           (i32.add
                                            (get_local $3)
                                            (i32.const 2)
                                           )
                                          )
                                          (br $label$3)
                                         )
                                         (set_local $11
                                          (i32.add
                                           (get_local $8)
                                           (i32.const -99)
                                          )
                                         )
                                         (br $label$3)
                                        )
                                        (set_local $10
                                         (i32.load8_u
                                          (i32.add
                                           (get_local $3)
                                           (i32.const 1)
                                          )
                                         )
                                        )
                                        (set_local $13
                                         (i32.load8_u offset=2
                                          (get_local $3)
                                         )
                                        )
                                        (br_if $label$10
                                         (i32.ne
                                          (get_local $11)
                                          (i32.const 2)
                                         )
                                        )
                                        (set_local $13
                                         (i32.or
                                          (i32.shl
                                           (get_local $13)
                                           (i32.const 8)
                                          )
                                          (i32.load8_u
                                           (i32.add
                                            (get_local $3)
                                            (i32.const 3)
                                           )
                                          )
                                         )
                                        )
                                        (set_local $12
                                         (i32.add
                                          (get_local $3)
                                          (i32.const 4)
                                         )
                                        )
                                        (br $label$9)
                                       )
                                       (i32.store
                                        (i32.add
                                         (get_local $4)
                                         (i32.shl
                                          (i32.load8_u
                                           (i32.add
                                            (get_local $3)
                                            (i32.const 1)
                                           )
                                          )
                                          (i32.const 2)
                                         )
                                        )
                                        (i32.eq
                                         (get_local $8)
                                         (i32.const 17)
                                        )
                                       )
                                       (set_local $12
                                        (i32.add
                                         (get_local $3)
                                         (i32.const 2)
                                        )
                                       )
                                       (br $label$3)
                                      )
                                      (set_local $10
                                       (i32.load8_u
                                        (i32.add
                                         (get_local $3)
                                         (i32.const 1)
                                        )
                                       )
                                      )
                                      (set_local $9
                                       (i32.load8_u offset=2
                                        (get_local $3)
                                       )
                                      )
                                      (set_local $13
                                       (i32.load
                                        (get_local $14)
                                       )
                                      )
                                      (block $label$42
                                       (br_if $label$42
                                        (i32.eqz
                                         (tee_local $12
                                          (i32.load8_u offset=3
                                           (get_local $3)
                                          )
                                         )
                                        )
                                       )
                                       (loop $label$43
                                        (set_local $13
                                         (i32.load
                                          (get_local $13)
                                         )
                                        )
                                        (br_if $label$43
                                         (tee_local $12
                                          (i32.add
                                           (get_local $12)
                                           (i32.const -1)
                                          )
                                         )
                                        )
                                       )
                                      )
                                      (set_local $12
                                       (i32.add
                                        (get_local $3)
                                        (i32.const 4)
                                       )
                                      )
                                      (i32.store
                                       (select
                                        (tee_local $3
                                         (i32.add
                                          (get_local $4)
                                          (i32.shl
                                           (get_local $10)
                                           (i32.const 2)
                                          )
                                         )
                                        )
                                        (tee_local $13
                                         (i32.add
                                          (i32.load offset=4
                                           (get_local $13)
                                          )
                                          (i32.shl
                                           (get_local $9)
                                           (i32.const 2)
                                          )
                                         )
                                        )
                                        (tee_local $8
                                         (i32.eq
                                          (get_local $8)
                                          (i32.const 31)
                                         )
                                        )
                                       )
                                       (i32.load
                                        (select
                                         (get_local $13)
                                         (get_local $3)
                                         (get_local $8)
                                        )
                                       )
                                      )
                                      (br $label$3)
                                     )
                                     (set_local $12
                                      (select
                                       (i32.add
                                        (get_local $3)
                                        (i32.const 4)
                                       )
                                       (i32.add
                                        (get_local $5)
                                        (i32.or
                                         (i32.shl
                                          (i32.load8_u offset=2
                                           (get_local $3)
                                          )
                                          (i32.const 8)
                                         )
                                         (i32.load8_u offset=3
                                          (get_local $3)
                                         )
                                        )
                                       )
                                       (i32.xor
                                        (i32.eq
                                         (get_local $8)
                                         (i32.const 34)
                                        )
                                        (i32.ne
                                         (i32.load
                                          (i32.add
                                           (get_local $4)
                                           (i32.shl
                                            (i32.load8_u
                                             (i32.add
                                              (get_local $3)
                                              (i32.const 1)
                                             )
                                            )
                                            (i32.const 2)
                                           )
                                          )
                                         )
                                         (i32.const -2147483648)
                                        )
                                       )
                                      )
                                     )
                                     (br $label$3)
                                    )
                                    (i32.store
                                     (i32.add
                                      (get_local $4)
                                      (i32.shl
                                       (i32.load8_u
                                        (i32.add
                                         (get_local $3)
                                         (i32.const 1)
                                        )
                                       )
                                       (i32.const 2)
                                      )
                                     )
                                     (call $irep_get
                                      (get_local $1)
                                      (i32.const 3)
                                      (i32.load8_u offset=2
                                       (get_local $3)
                                      )
                                     )
                                    )
                                    (set_local $12
                                     (i32.add
                                      (get_local $3)
                                      (i32.const 3)
                                     )
                                    )
                                    (br $label$3)
                                   )
                                   (i32.store
                                    (i32.add
                                     (get_local $4)
                                     (i32.shl
                                      (i32.load8_u
                                       (i32.add
                                        (get_local $3)
                                        (i32.const 1)
                                       )
                                      )
                                      (i32.const 2)
                                     )
                                    )
                                    (i32.load
                                     (i32.add
                                      (get_local $4)
                                      (i32.shl
                                       (i32.load8_u offset=2
                                        (get_local $3)
                                       )
                                       (i32.const 2)
                                      )
                                     )
                                    )
                                   )
                                   (set_local $12
                                    (i32.add
                                     (get_local $3)
                                     (i32.const 3)
                                    )
                                   )
                                   (br $label$3)
                                  )
                                  (i32.store
                                   (i32.add
                                    (get_local $4)
                                    (i32.shl
                                     (i32.load8_u
                                      (i32.add
                                       (get_local $3)
                                       (i32.const 1)
                                      )
                                     )
                                     (i32.const 2)
                                    )
                                   )
                                   (call $irep_atol
                                    (i32.add
                                     (call $irep_get
                                      (get_local $1)
                                      (i32.const 1)
                                      (i32.load8_u offset=2
                                       (get_local $3)
                                      )
                                     )
                                     (i32.const 3)
                                    )
                                   )
                                  )
                                  (set_local $12
                                   (i32.add
                                    (get_local $3)
                                    (i32.const 3)
                                   )
                                  )
                                  (br $label$3)
                                 )
                                 (i32.store
                                  (i32.add
                                   (get_local $4)
                                   (i32.shl
                                    (i32.load8_u
                                     (i32.add
                                      (get_local $3)
                                      (i32.const 1)
                                     )
                                    )
                                    (i32.const 2)
                                   )
                                  )
                                  (i32.add
                                   (call $irep_get
                                    (get_local $1)
                                    (i32.const 2)
                                    (i32.load8_u offset=2
                                     (get_local $3)
                                    )
                                   )
                                   (i32.const 2)
                                  )
                                 )
                                 (set_local $12
                                  (i32.add
                                   (get_local $3)
                                   (i32.const 3)
                                  )
                                 )
                                 (br $label$3)
                                )
                                (i32.store
                                 (i32.add
                                  (get_local $4)
                                  (i32.shl
                                   (i32.load8_u
                                    (i32.add
                                     (get_local $3)
                                     (i32.const 1)
                                    )
                                   )
                                   (i32.const 2)
                                  )
                                 )
                                 (i32.const -2147483648)
                                )
                                (set_local $12
                                 (i32.add
                                  (get_local $3)
                                  (i32.const 2)
                                 )
                                )
                                (br $label$3)
                               )
                               (i32.store
                                (i32.add
                                 (get_local $4)
                                 (i32.shl
                                  (i32.load8_u
                                   (i32.add
                                    (get_local $3)
                                    (i32.const 1)
                                   )
                                  )
                                  (i32.const 2)
                                 )
                                )
                                (i32.load
                                 (get_local $4)
                                )
                               )
                               (set_local $12
                                (i32.add
                                 (get_local $3)
                                 (i32.const 2)
                                )
                               )
                               (br $label$3)
                              )
                              (set_local $12
                               (i32.add
                                (get_local $5)
                                (i32.or
                                 (i32.shl
                                  (i32.load8_u
                                   (i32.add
                                    (get_local $3)
                                    (i32.const 1)
                                   )
                                  )
                                  (i32.const 8)
                                 )
                                 (i32.load8_u offset=2
                                  (get_local $3)
                                 )
                                )
                               )
                              )
                              (br $label$3)
                             )
                             (set_local $10
                              (i32.load8_u
                               (i32.add
                                (get_local $3)
                                (i32.const 1)
                               )
                              )
                             )
                             (set_local $12
                              (i32.add
                               (get_local $3)
                               (i32.const 4)
                              )
                             )
                             (block $label$44
                              (br_if $label$44
                               (tee_local $3
                                (call $mrb_memory_find
                                 (get_local $0)
                                 (i32.const 1)
                                 (tee_local $13
                                  (i32.add
                                   (call $irep_get
                                    (get_local $1)
                                    (i32.const 2)
                                    (i32.load8_u offset=2
                                     (get_local $3)
                                    )
                                   )
                                   (i32.const 2)
                                  )
                                 )
                                )
                               )
                              )
                              (set_local $3
                               (i32.const 0)
                              )
                              (loop $label$45
                               (br_if $label$6
                                (i32.ne
                                 (tee_local $8
                                  (i32.load8_u
                                   (i32.add
                                    (get_local $13)
                                    (get_local $3)
                                   )
                                  )
                                 )
                                 (i32.load8_u
                                  (i32.add
                                   (get_local $3)
                                   (i32.const 16416)
                                  )
                                 )
                                )
                               )
                               (set_local $3
                                (i32.add
                                 (get_local $3)
                                 (i32.const 1)
                                )
                               )
                               (br_if $label$45
                                (get_local $8)
                               )
                              )
                              (i32.store
                               (tee_local $3
                                (i32.add
                                 (get_local $4)
                                 (i32.shl
                                  (get_local $10)
                                  (i32.const 2)
                                 )
                                )
                               )
                               (select
                                (i32.const 1)
                                (i32.const -2147483648)
                                (i32.ne
                                 (i32.load
                                  (get_local $3)
                                 )
                                 (i32.load
                                  (i32.add
                                   (get_local $3)
                                   (i32.const 4)
                                  )
                                 )
                                )
                               )
                              )
                              (br $label$3)
                             )
                             (i32.store
                              (i32.add
                               (get_local $4)
                               (i32.shl
                                (get_local $10)
                                (i32.const 2)
                               )
                              )
                              (call $irep_exec
                               (get_local $0)
                               (i32.load offset=8
                                (get_local $3)
                               )
                               (get_local $14)
                               (get_local $10)
                              )
                             )
                             (br $label$3)
                            )
                            (set_local $10
                             (i32.load8_u
                              (i32.add
                               (get_local $3)
                               (i32.const 1)
                              )
                             )
                            )
                            (set_local $13
                             (i32.add
                              (call $irep_get
                               (get_local $1)
                               (i32.const 2)
                               (i32.load8_u offset=2
                                (get_local $3)
                               )
                              )
                              (i32.const 2)
                             )
                            )
                            (set_local $12
                             (i32.add
                              (get_local $3)
                              (i32.const 4)
                             )
                            )
                            (set_local $3
                             (i32.const 0)
                            )
                            (loop $label$46
                             (br_if $label$3
                              (i32.ne
                               (tee_local $8
                                (i32.load8_u
                                 (i32.add
                                  (get_local $13)
                                  (get_local $3)
                                 )
                                )
                               )
                               (i32.load8_u
                                (i32.add
                                 (get_local $3)
                                 (i32.const 16)
                                )
                               )
                              )
                             )
                             (set_local $3
                              (i32.add
                               (get_local $3)
                               (i32.const 1)
                              )
                             )
                             (br_if $label$46
                              (get_local $8)
                             )
                            )
                            (set_local $10
                             (i32.load
                              (i32.add
                               (tee_local $9
                                (i32.add
                                 (get_local $4)
                                 (i32.shl
                                  (get_local $10)
                                  (i32.const 2)
                                 )
                                )
                               )
                               (i32.const 4)
                              )
                             )
                            )
                            (set_local $8
                             (i32.load
                              (get_local $9)
                             )
                            )
                            (i32.store offset=8
                             (get_local $14)
                             (get_local $14)
                            )
                            (i32.store offset=20
                             (get_local $14)
                             (i32.const -2147483648)
                            )
                            (i32.store offset=12
                             (get_local $14)
                             (i32.add
                              (get_local $14)
                              (i32.const 20)
                             )
                            )
                            (block $label$47
                             (br_if $label$47
                              (i32.ge_s
                               (get_local $8)
                               (i32.const 1)
                              )
                             )
                             (set_local $13
                              (i32.const 0)
                             )
                             (br $label$4)
                            )
                            (set_local $3
                             (i32.const 0)
                            )
                            (loop $label$48
                             (i32.store
                              (i32.add
                               (get_local $14)
                               (i32.const 24)
                              )
                              (get_local $3)
                             )
                             (set_local $13
                              (call $irep_exec
                               (get_local $0)
                               (get_local $10)
                               (i32.add
                                (get_local $14)
                                (i32.const 8)
                               )
                               (i32.const 1)
                              )
                             )
                             (br_if $label$48
                              (i32.ne
                               (get_local $8)
                               (tee_local $3
                                (i32.add
                                 (get_local $3)
                                 (i32.const 1)
                                )
                               )
                              )
                             )
                             (br $label$4)
                            )
                           )
                           (set_local $12
                            (i32.add
                             (get_local $3)
                             (i32.const 4)
                            )
                           )
                           (br_if $label$3
                            (i32.eqz
                             (tee_local $13
                              (i32.shr_u
                               (i32.load8_u
                                (i32.add
                                 (get_local $3)
                                 (i32.const 1)
                                )
                               )
                               (i32.const 2)
                              )
                             )
                            )
                           )
                           (set_local $3
                            (i32.add
                             (i32.load
                              (i32.add
                               (get_local $2)
                               (i32.const 4)
                              )
                             )
                             (i32.shl
                              (get_local $7)
                              (i32.const 2)
                             )
                            )
                           )
                           (set_local $8
                            (get_local $6)
                           )
                           (loop $label$49
                            (i32.store
                             (get_local $8)
                             (i32.load
                              (get_local $3)
                             )
                            )
                            (set_local $3
                             (i32.add
                              (get_local $3)
                              (i32.const 4)
                             )
                            )
                            (set_local $8
                             (i32.add
                              (get_local $8)
                              (i32.const 4)
                             )
                            )
                            (br_if $label$49
                             (tee_local $13
                              (i32.add
                               (get_local $13)
                               (i32.const -1)
                              )
                             )
                            )
                            (br $label$3)
                           )
                          )
                          (i32.store
                           (tee_local $12
                            (i32.add
                             (get_local $4)
                             (i32.shl
                              (i32.load8_u
                               (i32.add
                                (get_local $3)
                                (i32.const 1)
                               )
                              )
                              (i32.const 2)
                             )
                            )
                           )
                           (i32.add
                            (i32.load
                             (get_local $12)
                            )
                            (i32.load
                             (i32.add
                              (get_local $12)
                              (i32.const 4)
                             )
                            )
                           )
                          )
                          (set_local $12
                           (i32.add
                            (get_local $3)
                            (i32.const 2)
                           )
                          )
                          (br $label$3)
                         )
                         (i32.store
                          (tee_local $12
                           (i32.add
                            (get_local $4)
                            (i32.shl
                             (i32.load8_u
                              (i32.add
                               (get_local $3)
                               (i32.const 1)
                              )
                             )
                             (i32.const 2)
                            )
                           )
                          )
                          (i32.add
                           (i32.load
                            (get_local $12)
                           )
                           (i32.load8_u offset=2
                            (get_local $3)
                           )
                          )
                         )
                         (set_local $12
                          (i32.add
                           (get_local $3)
                           (i32.const 3)
                          )
                         )
                         (br $label$3)
                        )
                        (i32.store
                         (tee_local $12
                          (i32.add
                           (get_local $4)
                           (i32.shl
                            (i32.load8_u
                             (i32.add
                              (get_local $3)
                              (i32.const 1)
                             )
                            )
                            (i32.const 2)
                           )
                          )
                         )
                         (i32.sub
                          (i32.load
                           (get_local $12)
                          )
                          (i32.load
                           (i32.add
                            (get_local $12)
                            (i32.const 4)
                           )
                          )
                         )
                        )
                        (set_local $12
                         (i32.add
                          (get_local $3)
                          (i32.const 2)
                         )
                        )
                        (br $label$3)
                       )
                       (i32.store
                        (tee_local $12
                         (i32.add
                          (get_local $4)
                          (i32.shl
                           (i32.load8_u
                            (i32.add
                             (get_local $3)
                             (i32.const 1)
                            )
                           )
                           (i32.const 2)
                          )
                         )
                        )
                        (i32.sub
                         (i32.load
                          (get_local $12)
                         )
                         (i32.load8_u offset=2
                          (get_local $3)
                         )
                        )
                       )
                       (set_local $12
                        (i32.add
                         (get_local $3)
                         (i32.const 3)
                        )
                       )
                       (br $label$3)
                      )
                      (i32.store
                       (tee_local $12
                        (i32.add
                         (get_local $4)
                         (i32.shl
                          (i32.load8_u
                           (i32.add
                            (get_local $3)
                            (i32.const 1)
                           )
                          )
                          (i32.const 2)
                         )
                        )
                       )
                       (i32.mul
                        (i32.load
                         (get_local $12)
                        )
                        (i32.load
                         (i32.add
                          (get_local $12)
                          (i32.const 4)
                         )
                        )
                       )
                      )
                      (set_local $12
                       (i32.add
                        (get_local $3)
                        (i32.const 2)
                       )
                      )
                      (br $label$3)
                     )
                     (i32.store
                      (tee_local $12
                       (i32.add
                        (get_local $4)
                        (i32.shl
                         (i32.load8_u
                          (i32.add
                           (get_local $3)
                           (i32.const 1)
                          )
                         )
                         (i32.const 2)
                        )
                       )
                      )
                      (i32.div_s
                       (i32.load
                        (get_local $12)
                       )
                       (i32.load
                        (i32.add
                         (get_local $12)
                         (i32.const 4)
                        )
                       )
                      )
                     )
                     (set_local $12
                      (i32.add
                       (get_local $3)
                       (i32.const 2)
                      )
                     )
                     (br $label$3)
                    )
                    (i32.store
                     (tee_local $12
                      (i32.add
                       (get_local $4)
                       (i32.shl
                        (i32.load8_u
                         (i32.add
                          (get_local $3)
                          (i32.const 1)
                         )
                        )
                        (i32.const 2)
                       )
                      )
                     )
                     (select
                      (i32.const 1)
                      (i32.const -2147483648)
                      (i32.eq
                       (i32.load
                        (get_local $12)
                       )
                       (i32.load
                        (i32.add
                         (get_local $12)
                         (i32.const 4)
                        )
                       )
                      )
                     )
                    )
                    (set_local $12
                     (i32.add
                      (get_local $3)
                      (i32.const 2)
                     )
                    )
                    (br $label$3)
                   )
                   (i32.store
                    (tee_local $12
                     (i32.add
                      (get_local $4)
                      (i32.shl
                       (i32.load8_u
                        (i32.add
                         (get_local $3)
                         (i32.const 1)
                        )
                       )
                       (i32.const 2)
                      )
                     )
                    )
                    (select
                     (i32.const 1)
                     (i32.const -2147483648)
                     (i32.lt_s
                      (i32.load
                       (get_local $12)
                      )
                      (i32.load
                       (i32.add
                        (get_local $12)
                        (i32.const 4)
                       )
                      )
                     )
                    )
                   )
                   (set_local $12
                    (i32.add
                     (get_local $3)
                     (i32.const 2)
                    )
                   )
                   (br $label$3)
                  )
                  (i32.store
                   (tee_local $12
                    (i32.add
                     (get_local $4)
                     (i32.shl
                      (i32.load8_u
                       (i32.add
                        (get_local $3)
                        (i32.const 1)
                       )
                      )
                      (i32.const 2)
                     )
                    )
                   )
                   (select
                    (i32.const 1)
                    (i32.const -2147483648)
                    (i32.le_s
                     (i32.load
                      (get_local $12)
                     )
                     (i32.load
                      (i32.add
                       (get_local $12)
                       (i32.const 4)
                      )
                     )
                    )
                   )
                  )
                  (set_local $12
                   (i32.add
                    (get_local $3)
                    (i32.const 2)
                   )
                  )
                  (br $label$3)
                 )
                 (i32.store
                  (tee_local $12
                   (i32.add
                    (get_local $4)
                    (i32.shl
                     (i32.load8_u
                      (i32.add
                       (get_local $3)
                       (i32.const 1)
                      )
                     )
                     (i32.const 2)
                    )
                   )
                  )
                  (select
                   (i32.const 1)
                   (i32.const -2147483648)
                   (i32.gt_s
                    (i32.load
                     (get_local $12)
                    )
                    (i32.load
                     (i32.add
                      (get_local $12)
                      (i32.const 4)
                     )
                    )
                   )
                  )
                 )
                 (set_local $12
                  (i32.add
                   (get_local $3)
                   (i32.const 2)
                  )
                 )
                 (br $label$3)
                )
                (i32.store
                 (tee_local $12
                  (i32.add
                   (get_local $4)
                   (i32.shl
                    (i32.load8_u
                     (i32.add
                      (get_local $3)
                      (i32.const 1)
                     )
                    )
                    (i32.const 2)
                   )
                  )
                 )
                 (select
                  (i32.const 1)
                  (i32.const -2147483648)
                  (i32.ge_s
                   (i32.load
                    (get_local $12)
                   )
                   (i32.load
                    (i32.add
                     (get_local $12)
                     (i32.const 4)
                    )
                   )
                  )
                 )
                )
                (set_local $12
                 (i32.add
                  (get_local $3)
                  (i32.const 2)
                 )
                )
                (br $label$3)
               )
               (i32.store
                (i32.add
                 (get_local $4)
                 (i32.shl
                  (i32.load8_u
                   (i32.add
                    (get_local $3)
                    (i32.const 1)
                   )
                  )
                  (i32.const 2)
                 )
                )
                (i32.add
                 (call $irep_get
                  (get_local $1)
                  (i32.const 1)
                  (i32.load8_u offset=2
                   (get_local $3)
                  )
                 )
                 (i32.const 2)
                )
               )
               (set_local $12
                (i32.add
                 (get_local $3)
                 (i32.const 3)
                )
               )
               (br $label$3)
              )
              (set_local $12
               (i32.add
                (get_local $3)
                (i32.const 2)
               )
              )
              (br $label$3)
             )
             (drop
              (call $mrb_memory_add
               (get_local $0)
               (i32.load
                (tee_local $12
                 (i32.add
                  (get_local $4)
                  (i32.shl
                   (i32.load8_u
                    (i32.add
                     (get_local $3)
                     (i32.const 1)
                    )
                   )
                   (i32.const 2)
                  )
                 )
                )
               )
               (i32.add
                (call $irep_get
                 (get_local $1)
                 (i32.const 2)
                 (i32.load8_u offset=2
                  (get_local $3)
                 )
                )
                (i32.const 2)
               )
               (i32.load
                (i32.add
                 (get_local $12)
                 (i32.const 4)
                )
               )
              )
             )
             (set_local $12
              (i32.add
               (get_local $3)
               (i32.const 3)
              )
             )
             (br $label$3)
            )
            (i32.store
             (i32.add
              (get_local $4)
              (i32.shl
               (i32.load8_u
                (i32.add
                 (get_local $3)
                 (i32.const 1)
                )
               )
               (i32.const 2)
              )
             )
             (i32.load
              (get_local $4)
             )
            )
            (set_local $12
             (i32.add
              (get_local $3)
              (i32.const 2)
             )
            )
            (br $label$3)
           )
           (set_local $12
            (i32.add
             (get_local $3)
             (i32.const 3)
            )
           )
          )
          (i32.store
           (i32.add
            (get_local $4)
            (i32.shl
             (get_local $10)
             (i32.const 2)
            )
           )
           (select
            (i32.sub
             (i32.const 0)
             (get_local $13)
            )
            (get_local $13)
            (i32.eq
             (get_local $8)
             (i32.const 4)
            )
           )
          )
          (br $label$3)
         )
         (set_local $13
          (i32.load
           (i32.add
            (get_local $4)
            (i32.shl
             (i32.load8_u
              (get_local $12)
             )
             (i32.const 2)
            )
           )
          )
         )
         (br $label$1)
        )
        (set_local $13
         (i32.const 1)
        )
        (br $label$5)
       )
       (set_local $13
        (i32.const 2)
       )
      )
      (i32.store
       (get_local $0)
       (get_local $13)
      )
      (br $label$1)
     )
     (i32.store
      (get_local $9)
      (get_local $13)
     )
    )
    (br_if $label$2
     (i32.eqz
      (tee_local $13
       (i32.load
        (get_local $0)
       )
      )
     )
    )
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $14)
    (i32.const 32)
   )
  )
  (get_local $13)
 )
 (func $irep_atol (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (set_local $1
   (i32.const 0)
  )
  (block $label$0
   (block $label$1
    (br_if $label$1
     (i32.eq
      (tee_local $2
       (i32.load8_u
        (get_local $0)
       )
      )
      (i32.const 43)
     )
    )
    (br_if $label$0
     (i32.ne
      (get_local $2)
      (i32.const 45)
     )
    )
    (set_local $1
     (i32.const 1)
    )
    (set_local $0
     (i32.add
      (get_local $0)
      (i32.const 1)
     )
    )
    (br $label$0)
   )
   (set_local $0
    (i32.add
     (get_local $0)
     (i32.const 1)
    )
   )
  )
  (set_local $3
   (i32.const 0)
  )
  (block $label$2
   (br_if $label$2
    (i32.gt_u
     (i32.and
      (i32.add
       (tee_local $2
        (i32.load8_u
         (get_local $0)
        )
       )
       (i32.const -48)
      )
      (i32.const 255)
     )
     (i32.const 9)
    )
   )
   (set_local $0
    (i32.add
     (get_local $0)
     (i32.const 1)
    )
   )
   (set_local $3
    (i32.const 0)
   )
   (loop $label$3
    (set_local $3
     (i32.add
      (i32.add
       (i32.mul
        (get_local $3)
        (i32.const 10)
       )
       (i32.shr_s
        (i32.shl
         (get_local $2)
         (i32.const 24)
        )
        (i32.const 24)
       )
      )
      (i32.const -48)
     )
    )
    (set_local $2
     (i32.load8_u
      (get_local $0)
     )
    )
    (set_local $0
     (i32.add
      (get_local $0)
      (i32.const 1)
     )
    )
    (br_if $label$3
     (i32.lt_u
      (i32.and
       (i32.add
        (get_local $2)
        (i32.const -48)
       )
       (i32.const 255)
      )
      (i32.const 10)
     )
    )
   )
  )
  (select
   (i32.sub
    (i32.const 0)
    (get_local $3)
   )
   (get_local $3)
   (get_local $1)
  )
 )
 (func $emb_method (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32)
  (local $5 i32)
  (local $6 i32)
  (set_local $6
   (i32.const 0)
  )
  (block $label$0
   (loop $label$1
    (br_if $label$0
     (i32.ne
      (tee_local $5
       (i32.load8_u
        (i32.add
         (get_local $1)
         (get_local $6)
        )
       )
      )
      (i32.load8_u
       (i32.add
        (get_local $6)
        (i32.const 16416)
       )
      )
     )
    )
    (set_local $6
     (i32.add
      (get_local $6)
      (i32.const 1)
     )
    )
    (br_if $label$1
     (get_local $5)
    )
   )
   (i32.store
    (tee_local $6
     (i32.add
      (get_local $2)
      (i32.shl
       (get_local $3)
       (i32.const 2)
      )
     )
    )
    (select
     (i32.const 1)
     (i32.const -2147483648)
     (i32.ne
      (i32.load
       (get_local $6)
      )
      (i32.load
       (i32.add
        (get_local $6)
        (i32.const 4)
       )
      )
     )
    )
   )
   (return)
  )
  (i32.store
   (get_local $0)
   (i32.const 2)
  )
 )
 (func $getMemory (result i32)
  (i32.const 32)
 )
 (func $getMemorySize (result i32)
  (i32.const 16384)
 )
 (func $exec (result i32)
  (local $0 i32)
  (local $1 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $1
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 256)
    )
   )
  )
  (i64.store
   (get_local $1)
   (i64.const 0)
  )
  (set_local $0
   (call $irep_exec
    (get_local $1)
    (i32.const 66)
    (i32.const 0)
    (i32.const 0)
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $1)
    (i32.const 256)
   )
  )
  (get_local $0)
 )
)
