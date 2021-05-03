



        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        ;;  ╔═╗ ┬   ┌─┐ ┬ ┬  ╦   ┌─┐ ┌┐┌ ┌┬┐ ┌─┐  ;;
        ;;  ╚═╗ │   │ │ │││  ║   ├─┤ │││  ││ └─┐  ;;
        ;;  ╚═╝ ┴─┘ └─┘ └┴┘  ╩═╝ ┴ ┴ ┘└┘ ─┴┘ └─┘  ;;
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

        
        
        

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;      
;;  FUNCTIONS DECLARATION :

(begin
  ; kill all automations
  (define (killReg)
   (define i 0)
   (define (rec)
    (if (< i 100)
        (begin 
         (setReg i)
         (setReg* i)
         (set! i (+ 1 i))
         (rec))))
   (rec))
  ; random function in range
  (define (rndInRange range) (scale (/ (random 1000) 1000) 0 1 (range 0) (range 1)))
  ; a classic scale function
  (define (scale value min1 max1 min2 max2)
    (+ min2 (* (- value min1) (/ (- max2 min2) (- max1 min1)))))
  ; pick a random element from a list
  (define (pick l)
   (l (random (length l))))
  ; define the register for monoEvents and logic
  (define reg '())
  (define reg* '())
  (define* (fillReg (i 0))
         (cond
          ((< i 100)(begin
                     (set! reg (cons 0 reg))
                     (fillReg (+ 1 i)))))) 
  (define* (fillReg* (i 0))
         (cond
          ((< i 100)(begin
                     (set! reg* (cons 0 reg*))
                     (fillReg* (+ 1 i)))))) 
  (fillReg)
  (fillReg*) 
  (post reg)
  (post reg*)
  
  (define (setReg i)
    (set! (reg i) (+ 1 (reg i))))
  (define (setReg* i)
    (set! (reg* i) (+ 1 (reg* i))))
  ; mix between x and y
  (define (mix x y fade)
    (+ (* y fade) (* x (- 1 fade))))
  ; create htable named p
  (define p (hash-table))
  ; record a param from max inside p
  (define (rec key name val) (begin
                              (set! (p key) (hash-table))
                              (set! (p key :name) name)
                              (set! (p key :val) val)))
  ; scan function
  (define (scan) (out 0 'anal)) 
  (scan)  
  ; set a param and update p
  (define (set name val) (begin)
                       (send (p name :name) val)
                       (set! (p name :val) val)) 
  ; add, sub, multiply, divide a param
  (define (op name operator value)
   (set name (operator (p name :val) value)))
  ; interpolation function
  (define (interp name dest time ch)
    (define key (setReg ch))
    (define startValue (p name :val))
    (define delta (/ 1000 60))
    (define startFade 0)
    (define (ramp)
     (cond
      ((= key (reg ch))
       (if (<= startFade 1)
          (begin
            (set name (mix startValue dest startFade))
            (set! startFade (+ startFade (/ (/ 1 60) time)))
            (delay delta (lambda () (ramp))))))))    
    (ramp))
  ; MULTI POINTS interpolation function ex : (interp* :myNum '((0 0.0001) (10 0.05) (8 0.75) (8 1) (0 2)) 0)
  (define (interp* name arr ch)
    (define key (setReg ch))
    (define startValue (p name :val))
    (define delta (/ 1000 60))
    (define startFade 0)
    (define i 0)
    (define (ramp dest time)
     (if
      (and (< i (length arr)) (= key (reg ch)))
      (if (<= startFade 1)
         (begin
           (set name (mix startValue dest startFade))
           (set! startFade (+ startFade (/ (/ 1 60) time)))
           (delay delta (lambda () (ramp (car (arr i))
                                         (car(cdr (arr i)))))))
         (begin
          (set! startFade 0)
          (set! startValue (p name :val))
          (set! i (+ i 1))
          (ramp (car (arr i))
                (car(cdr (arr i))))))))    
   (ramp (car (arr i))
         (car(cdr (arr i)))))
 ; random lfo
 (define (rand name range rate ch)
  (define key2 (setReg* ch))
  (define (rec)
   (cond
    ((= key2 (reg* ch)) 
     (begin
      (interp name (rndInRange range) rate ch)
      (delay (* 1000 rate) (lambda () (rec)))))))   
  (rec))
 ; basic trigger 
 (define (trig name val ch)
  (setReg ch)
  (if (zero? (remainder (reg ch) 2))
      (op name - val)
      (op name + val)))
 ; sine lfo
 (define (sinus name rate amp ch)
    (define (sinFun x amp) (* amp (sin (* x (* 2 pi)))))
    (define key (setReg ch))
    (define startValue (p name :val))
    (define delta (/ 1000 60))
    (define* (osc (i 0))
     (cond
      ((= key (reg ch))
       (begin
        (define result (sinFun i amp))
        (send (p name :name) (+ startValue result))
        (delay delta (lambda () (osc (+ i (/ (/ 1 rate) 60)))))))))
    (osc)))


