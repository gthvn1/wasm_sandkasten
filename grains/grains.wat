(module
  (global $nbOfSquares i32 (i32.const 64))

  ;; squareNum is signed
  ;; Result is unsigned
  ;; it takes the index of the square and returns the number of the grains
  ;; it is 2^n...
  (func $square (export "square") (param $squareNum i32) (result i64)
    (local $i i32)      ;; index = 0
    (local $total i64)

    ;; square 0 or negative is not valid
    (if (i32.le_s (i32.const 0 (local.get $squareNum)))
      (then (return (i64.const 0))))

    ;; square above 64 is not valid
    (if (i32.gt_s (global.get $nbOfSquares (local.get $squareNum)))
      (then (return (i64.const 0))))

    ;; square 1 has one grain
    (if (i32.eq (i32.const 1 (local.get $squareNum)))
      (then (return (i64.const 1))))

    (local.set $i (i32.const 1))
    (local.set $total (i64.const 1))

    ;; loop starts on the second square
    (loop $start_loop

      ;; total is double
      (local.set $total (i64.mul (i64.const 2 (local.get $total))))

      ;; update the index
      (local.set $i (i32.add (i32.const 1 (local.get $i))))

      ;; we loop until squareNum
      (br_if $start_loop
        (i32.ne (local.get $i) (local.get $squareNum)))
    )

    local.get $total
  )

  ;; Result is unsigned
  (func (export "total") (result i64)
    (local $i i32)
    (local $total i64)  ;; total number of grains

    ;; init with value on square one
    (local.set $i (i32.const 1))
    (local.set $total (i64.const 1))

    (loop $start_loop

      ;; update the index
      (local.set $i (i32.add (i32.const 1 (local.get $i))))

      ;; update the total
      (local.set $total
        (i64.add
          (local.get $total
          (call $square (local.get $i)))))


      ;; we loop until $i == 64
      (br_if $start_loop (i32.ne (local.get $i (global.get $nbOfSquares))))
    )

    local.get $total
  )
)
