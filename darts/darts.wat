(module
  (func $score (param $x f32) (param $y f32) (result i32)
    
    (local $dist f32) ;; create a local variable dist

    local.get $x    ;; stack: x
    local.get $x    ;; stack: x | x 
    f32.mul         ;; stack: x*x
    local.get $y    ;; stack: y | x*x
    local.get $y    ;; stack: y | y | x*x 
    f32.mul         ;; stack: y*y | x * x
    f32.add         ;; stack: y*y + x*x
    f32.sqrt        ;; stack: sqr(y*y + x*x)

    local.set $dist  ;; var is set to sqr, stack: 

    ;; At this point we have the distance from the centre on the stack
    ;; check if it is in the inner circle
    local.get $dist
    f32.const 1
    f32.le
    (if
        (then
            (return (i32.const 10))
        )
    )

    local.get $dist
    f32.const 5
    f32.le
    (if
        (then
            (return (i32.const 5))
        )
    )

    local.get $dist
    f32.const 10
    f32.le
    (if
        (then
            (return (i32.const 1))
        )
    )

    (return (i32.const 0))
  )

  (export "score" (func $score))
)
