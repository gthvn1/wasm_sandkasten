(module
  (func (export "steps") (param $number i32) (result i32)
    (local $steps i32)
    (local $current i32)

    (local.set $current (local.get $number))

    (i32.le_s (local.get $current) (i32.const 0))
    (if (then
          i32.const -1
          return))

    (i32.eq (local.get $current) (i32.const 1))
    (if (then
          i32.const 0
          return))

    ;; Take any positive integer n.
    ;; If n is even
    ;;    then divide n by 2 to get n / 2
    ;;    else multiply n by 3 and add 1
    ;; Repeat the process indefinitely.
    (loop $loop_begin
      (i32.and (local.get $current) (i32.const 1)) ;; check last digit, 1 => odd
      (if (then
            local.get $current
            i32.const 3
            i32.mul
            i32.const 1
            i32.add
            local.set $current)
          (else
            local.get $current
            i32.const 2
            i32.div_s
            local.set $current))

      ;; inc number of steps $steps
      (local.set $steps
        (i32.add (i32.const 1) (local.get $steps)))

      ;; if current == 1 we are done
      (i32.ne (i32.const 1) (local.get $current))

      br_if $loop_begin
    )

    local.get $steps
  )
)
