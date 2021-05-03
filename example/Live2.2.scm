; SANDSTORM DEF
(define* (explosion (fx ()))
  (begin
    (killReg)
    (set :width 0.0005)
    (set :s_up 7)
    (set :s_down 15)
;    (set :mix 0.942)
;    (set :sBlur 0)
    (set :basis 6)
    (set :time 7.5406)
    (set :zoom 0.19)
    (set :bfg2Trails .5)
    (set :nbOfP 350)
    (set :texSize 1000)
    (set :mass2Angle 0)
    (set :dist 0.055)
    (set :contrast 1.0112)
;    (set :speed 0.2)
    (set :alpha 0)
    (set :boundMode 0)
    (set :size 0)
    (set :nbOfSensors 16)
    (set :initMode 0)
    (set :spread 1)
;    (set :colorAmt 0)
    (set :angleRangeMin 0)
    (set :angleRangeMax 1)
    (set :alphaFb 0)
    (set :polarAdd 0)
    (set :distanceAdd 0)
    (set :model 0)
    (set :rainSpeed 0)
    (set :rainAngle 0)
    (set :offsetX 0.0182)
    (set :offsetY 0)
    fx))

(define* (explosion' (fx ()))
 (begin
  (killReg)
  (set :width 0.0005)
  (set :s_up 9.8)
  (set :s_down 15)
;  (set :mix 0.9699)
;  (set :sBlur 0.00073)
  (set :basis 7)
  (set :time 180.48)
  (set :zoom 0.985)
  (set :bfg2Trails -2.574)
  (set :nbOfP 350)
;  (set :texSize 1000)
  (set :mass2Angle 0)
  (set :dist 0.0001)
  (set :contrast 1.0112)
;  (set :speed 0.01)
  (set :alpha 1)
  (set :boundMode 1)
  (set :size 0.176)
  (set :nbOfSensors 3)
  (set :initMode 0)
  (set :spread 1)
;  (set :colorAmt 1)
  (set :angleRangeMin 0)
  (set :angleRangeMax 1)
  (set :alphaFb 1)
  (set :polarAdd 0)
  (set :distanceAdd 0.0001)
  (set :model 0)
  (set :rainSpeed 0.00002)
  (set :rainAngle 1.31666)
  (set :offsetX 0.0182)
  (set :offsetY 0)))

;texDef
(set :texSize 1000)

; transition def
(define (trans)
  (begin
   (interp* :width '((0.00 5)) 10)
   (interp* :colorAmt '((0.25 10)) 0)
   (interp* :speed '((0.01 15)) 1) 
   (interp* :mix '((1.0005 5)) 2)
   (interp* :sBlur '((0.0000 10)) 3)))


(killReg)
(set :colorAmt 0)

;0
(explosion :fx (delay 10 (lambda () (begin
                                     (killReg)
                                     (interp* :colorAmt  '((0 0.5) (1.0 2)) 0)
                                     (interp* :speed     '((0 0.125) (0.06125 10)) 1)
                                     (interp* :mix       '((0.97 40)) 2)
                                     (interp* :sBlur     '((0.0 15)) 3)
                                     (rand :rainSpeed '(0.0001 -0.0001) .1 4)
                                     (rand :rainAngle '(0 3.1415) 1 5)))))
 
 
(rand :rainSpeed '(0.0002 -0.0002) .1 4)
(rand :rainAngle '(0 3.1415) 0.15 5)
(interp :alpha 0.04 10 6) 
(set :speed 0.3)
;add speed man

(trans)       


(explosion' :fx (delay 10 (lambda () (begin
                                      (killReg)
                                      (set :speed 1.5)
                                      (interp* :colorAmt  '((0 0.5) (1.0 2)) 0)
                                      (interp* :speed     '((0 0.125) (0.05 8)) 1)
                                      (interp* :mix       '((0.97 40)) 2)
                                      (interp* :sBlur     '((0.0001 15)) 3)
                                      (rand :rainSpeed '(0.0001 -0.0001) .1 4)
                                      (rand :rainAngle '(0 3.1415) 1 5)
                                      (set :basis 8)))))

(interp :speed 1 35 6)
(interp :time 181.5 20 7) ;185

(trans) ;synth high

(explosion' :fx (delay 10 (lambda () (begin
                                      (killReg)
                                      (interp* :colorAmt  '((0 1) (1.0 2)) 0)
                                      (interp* :speed     '((0 0.125) (5 35)) 1)
                                      (interp* :mix       '((0.97 40)) 2)
                                      (interp* :sBlur     '((0.0001 15)) 3)
                                      (rand :rainSpeed '(0.0001 -0.0001) .1 4)
                                      (rand :rainAngle '(0 3.1415) 1 5)
                                      (set :basis 5)
                                      (set :time 180.85)))))

(interp :time 185.1 20 7) ;synth high
(interp :zoom 2.5 15 8) ; guitar high

(trans)

(explosion' :fx (delay 10 (lambda () (begin
                                      (killReg)
                                      (interp* :colorAmt  '((0 0.5) (1.0 2)) 0)
                                      (interp* :speed     '((0 0.125) (3 60)) 1)
                                      (interp* :mix       '((0.97 40)) 2)
                                      (interp* :alphaFb '((0.012 0.1) (1 25)) 6)
                                      (rand :rainSpeed '(0.0001 -0.0001) .1 4)
                                      (rand :rainAngle '(0 3.1415) 1 5)
                                      (rand :sBlur '(-.0001 0.0001) 2 7)
                                      (set :basis 8)
                                      (set :zoom 8.1)
                                      (set :time 3)))))

(interp :time 9 10 8) ; major 2

(trans)

(explosion' :fx (delay 0 (lambda () (begin  
                                     (killReg)
                                     (interp* :colorAmt  '((0 0.5) (1.0 2)) 0)
                                     (interp* :speed     '((0 0.125) (3 60)) 1)
                                     (interp* :mix       '((0.97 40)) 2)
                                     (interp* :alphaFb '((0.012 0.1) (1 25)) 6)
                                     (rand :rainSpeed '(0.0001 -0.0001) .1 4)
                                     (rand :rainAngle '(0 3.1415) 1 5)
                                     (rand :sBlur '(-.001 0.0005) 2 7)
                                     (set :basis 8)
                                     (set :zoom 2.4)
                                     (set :offsetX 1.79)
                                     (interp* :time '((.1 .1) (.0 10)) 8)))))
;1(noise...)
(interp :distanceAdd 0.0 15 10)
;2
(interp :zoom 1 25 9)

(interp :dist .0028 15 12)
(interp :time 1.0 20 11)


(killReg)
; TRACK 02 (grate 3)
(begin
 (killReg)
 (set :nbOfSensors 8)
 (set :rainSpeed 0.0)
 (set :s_up 12.5)
 (interp :mass2Angle 1 20 16)
 (interp* :width '((0.001 15)) 10)
 (interp* :s_down '((15 10)) 11)
 (interp* :colorAmt '((1 35)) 13)
 (rand :bfg2Trails '(-1 0.001) 2 0)
 (interp* :alpha '((0.4 15)) 14)
 (interp :zoom 1 15 15)
 (set :sBlur 0)
 (sinus :sBlur 10 0.001 21)
 (set :model 0)
 (interp :speed 5 60 3)
 (interp :alphaFb 1 60 4)
 (set :zoom 0.1)
 (set:alpha 0.4)
 (set :basis 8))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(grate harmony)
(begin 
 (interp :size 0.5 20 10)
 (interp :alpha 0.5 20 1)
 (interp :dist 0.001 20 2)
 (interp :distanceAdd 0.0001 45 5))

(interp* :distanceAdd '((0.0005 5)(0.0001 5) ) 5)
(interp :time (rndInRange '(0 1)) 10 31)

(interp :dist 0.005 25 35)
(interp* :zoom '((0.051 30)) 32) ; -> 0.05
(interp* :mass2Angle '((2 0.1)(0.0000 5) ) 33)
(rand :bfg2Trails '(-.01 2) 5 0) ; -0.1 2
(interp* :polarAdd '((0.001 5) (0.001 10)(0 5) ) 55) ;(synth)
(interp :alpha 0.2 20 1) ; create connexions
(interp :speed 8 30 10)

(set :time (random 400))

; end
(begin 
 (set :speed 2)
 (set :boundMode 0)
 (interp :distanceAdd 0.0003 35 40)) ; until 0.001

 ;transition
(begin 
 (interp* :width '((0.012 15)) 10)
 (interp* :s_down '((34 15)) 11)
 (interp* :sBlur '((0.01 20))12)
 (delay 7000  (lambda () (interp* :colorAmt '((0 15)) 13))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;track 3
(define* (breath (env ()))
 (begin
   (set :width 0.0782)
   (set :s_up 10)
   (set :s_down 0)
   (set :mix 0.913)
   (set :sBlur -0.001)
   (set :basis 9)
   (set :time 4.006)
   (set :zoom 4.97)
   (set :bfg2Trails 16.83)
   (set :nbOfP 1000)
   (set :texSize 1000)
   (set :mass2Angle 0)
   (set :dist 0.0055)
   (set :contrast 1.024)
   (set :speed 0)
   (interp :speed 1.828 50 0)
   (set :alpha 0.0)
   (interp :alpha 0.768 120 4)
   (set :boundMode 1)
   (set :size 0)
   (set :nbOfSensors 2)
   (set :initMode 0)
   (set :spread 1)
   (set :colorAmt 0.0)
   (set :angleRangeMin 0)
   (set :angleRangeMax 1)
   (set :alphaFb 3)
   (set :polarAdd 0)
   (set :distanceAdd 0)
   (interp :distanceAdd 0.0005 120 1)
   (delay 1000 (lambda () env))))

(killReg)


(set :colorAmt 0.0) 
; intro dragon !!!KILLREG
(breath 
 :env (begin
       (interp :colorAmt 1.0 60 2)))

;dev1 (guitar 2 2)
(begin
  (set :width 0.0093)
  (set :s_up 10)
  (set :s_down 2)
  (set :mix 0.913)
  (set :sBlur 0)
  (set :basis 9)
  (interp :time 2.0096 40 16)
  (interp :zoom 0.82 40 15)
  (interp :bfg2Trails -0.199 40 14)
  (interp  :mass2Angle 4 40 13)
  (interp :dist -0.0064 40 12)
  (set :contrast 1.024)
  (interp :speed 30.52 40 11)
  (interp :alpha 10 40 10)
  (set :boundMode 1)
  (set :size 0)
  (set :nbOfSensors 2)
  (set :initMode 0)
  (set :spread 1)
  (set :colorAmt 1)
  (set :angleRangeMin 0)
  (set :angleRangeMax 1)
  (set :alphaFb 3)
  (set :polarAdd 0)
  (set :distanceAdd 0.0005)
  (set :model 0))

(interp :time (rndInRange '(2 4)) 20 16)

(begin 
 (interp* :speed '((0.1 10)) 30))

;dev2
(begin
  (set :width 0.0093)
  (set :s_up 10)
  (set :s_down 0)
  (set :mix 0.913)
  (set :sBlur 0)
  (set :basis 9)
  (interp :time 4.0 10 20)
  (set :zoom 1.14)
  (interp :bfg2Trails -1.336 10 32)
  (set :mass2Angle 4)
  (interp :dist -0.0064 10 31)
  (set :contrast 1.024)
  (delay 1000 (lambda () (interp* :speed '((30 20)) 30)))
  (set :alpha 10)
  (set :boundMode 1)
  (set :size 0)
  (set :nbOfSensors 2)
  (set :initMode 0)
  (set :spread 1)
  (set :colorAmt 1)
  (set :angleRangeMin 0)
  (set :angleRangeMax 1)
  (set :alphaFb 3)
  (set :polarAdd 0)
  (set :distanceAdd 0.0005)
  (set :model 0))

(interp :bfg2Trails (rndInRange '(-1.5 0)) 2.5 17)
(interp :time (rndInRange '(2 4)) 10 16)

;dev3
(begin
  (set :width 0.0193)
  (set :s_up 10)
  (set :s_down 0)
  (set :mix 0.913)
  (set :sBlur 0)
  (set :basis 1)
  (set :time 4.343)
  (set :zoom 1.76)
  (set :bfg2Trails 0.17)
  (set :mass2Angle 4)
  (set :dist -0.004)
  (set :contrast 1.024)
  (set :speed 4.2)
  (set :alpha 0.23)
  (set :boundMode 1)
  (set :size 0)
  (set :nbOfSensors 2)
  (set :initMode 0)
  (set :spread 1)
  (set :colorAmt 1)
  (set :angleRangeMin 0)
  (set :angleRangeMax 1)
  (set :alphaFb 1)
  (set :polarAdd 0)
  (set :distanceAdd 0.00005)
  (set :model 0))

(interp :time (rndInRange '(2 15)) 30 16)
(interp* :distanceAdd '((0.001 5)(0.0001 5) ) 5)
;bmode
(set :boundMode 0)

(begin 
 (interp* :width '((0.52 15) (0.012 10)) 10)
 (interp* :s_down '((5 15)(0 10)) 11)
 (interp* :sBlur '((0.1 20) (-0.01 5) (0 10))12)
 (interp* :s_up '((3 20) (10 5))14)
 (interp* :mix '((.99 10) (.91 15)) 13)
 (delay 7000  (lambda () (interp* :colorAmt '((0 15)) 14))))

(killReg)
(set :colorAmt 0)
;;;;;;;;;;;;;;;;;;;;;;;;;;
;ANCESTORS
; laisser la guitare s'installer !!! KILLREG!!! laisser le noize partir
(begin
  (set :width 0.0001)
  (set :s_up 10)
  (set :s_down 15)
  (set :mix 0.942)
  (set :sBlur 0)
  (set :basis 6)
  (set :time 8.946)
  (set :zoom 1.428)
  (set :bfg2Trails 0.0)
  (set :nbOfP 350)
  (set :texSize 1000)
  (set :mass2Angle 2.44)
  (set :dist 0.0002)
  (set :contrast 1.0112)
  (set :speed 13.79)
  (set :alpha 1.366)
  (set :boundMode 1)
  (set :size 0)
  (set :nbOfSensors 16)
  (set :initMode 0)
  (set :spread 1)
  (set :colorAmt 0)
  (interp :colorAmt 1 45 40)
  (set :angleRangeMin 0)
  (set :angleRangeMax 1)
  (set :alphaFb 0)
  (set :polarAdd 0.0001)
  (set :distanceAdd 0)
  (set :model 0)
  (set :rainSpeed 0)
  (set :rainAngle 0)
  (set :offsetX 0.0182)
  (set :offsetY 0)
  (delay 15000 (lambda () (interp :zoom 0.2 180 22)))
  (sinus :sBlur 10 0.00051 21)) 

;synth
(interp :bfg2Trails -1.5 30 50) 
;synth2 bass
(interp :time (rndInRange '(8.945 10.0)) 10 51)
;opt (synth high)
(interp :bfg2Trails -.05 30 50)

; synth high
(begin
  (killReg)
  (set :width 0.0006)
  (set :s_up 10)
  (set :s_down 15)
  (set :mix 0.942)
  (set :sBlur 0)
  (set :basis 7)
  (set :time 17.99)
  (interp :zoom 3.18 30 66)
  (interp :bfg2Trails -0.82 45 50)
  (interp :bfg2Trails -6 45 61)
;  (set :nbOfP 350)
; (set :texSize 1000)
  (interp :mass2Angle -4.08 25 64)
  (set :dist 0.0001)
  (set :contrast 1.0112)
  (interp :speed 16 60 60)
  (set :alpha 1.366)
  (set :boundMode 1)
  (set :size 0)
  (set :nbOfSensors 16)
  (set :initMode 5)
  (set :spread 0)
  (set :colorAmt 1)
  (set :angleRangeMin 0)
  (set :angleRangeMax 0)
  (sinus :alphaFb 20 .2 65)
  (set :polarAdd 0)
  (set :distanceAdd 0) 
  (set :model 0)
  (set :rainSpeed 0)
  (set :rainAngle 0)
  (set :offsetX 1.197)
  (set :offsetY 0)) 

(rand :time '(10.945 20.0) 40 51) 
(interp :dist 0.001 25 70)
;major
(interp :zoom 0.5 60 71)
(interp :bfg2Trails .03 35 72)

;(bmode & dist2pol)
(set :boundMode 0)
(interp* :distanceAdd '((0.0015 5)(0.000 5) ) 5)

(trans)
(interp :colorAmt 0.0 5 1)
;GHOST BALLET
(begin
  (killReg)
  (set :width 0.0001)
  (set :s_up 4.81)
  (set :s_down 15)
  (set :mix 0.942)
  (set :sBlur 0)
  (set :basis 1)
  (set :time 53.982)
  (set :zoom 3.899)
  (set :bfg2Trails 0)
  (interp :bfg2Trails -1.06 35 15)
  (set :nbOfP 350)
  (set :texSize 1000)
  (set :mass2Angle -20.24)
  (set :dist 0.0001)
  (set :contrast 1.0112)
  (set :speed 1)
  (interp :speed 5.0 180 90)
  (set :alpha 2.92)
  (set :boundMode 2)
  (set :size 0)
  (set :nbOfSensors 8)
  (set :initMode 2)
  (set :spread 5.24)
  (set :colorAmt 0)
  (interp :colorAmt 1 45 10)
  (set :angleRangeMin 0)
  (set :angleRangeMax 1)
  (set :alphaFb 0)
  (set :polarAdd 0)
  (set :distanceAdd 0)
  (set :model 0)
  (set :rainSpeed 0)
  (set :rainAngle 0)
  (set :offsetX -1.578)
  (set :offsetY 0)) 

(interp :time 76  .1 91) ; ++
;end 
(interp :zoom 1.5 35 92)


(begin
 (interp :width .006 25 94)
 (set :boundMode 2)
 (interp :distanceAdd -.0001 25 93)
 (interp :alpha .3 25 10)
 (interp :alphaFb 1 25 11))

(interp :time 97 5 91)


(interp :bfg2Trails -.3 10 55)
(rand :bfg2Trails '(-.3 -.005) 5 55)
(interp :dist 0.04 10 56)
; climax
(begin
 (interp* :speed '((.1 5.0) (5.0 5.0)) 32)
 (delay 5000 (lambda () (begin
                         (interp* :polarAdd '((0.001 3) (0.000 6)) 18)
                         (set :boundMode 0)
                         (set :basis 4)))))

(interp :time 97.5 30 91) ++


(interp :distanceAdd .0003 15 93) ; loop grat

(interp :colorAmt 0.0 15 40)

(killReg)
;AMBIENT FAT
(begin
  (set :width -0.023)
  (set :s_up 10)
  (set :s_down 10)
  (set :mix 0.942)
  (set :sBlur -0.0004)
  (set :basis 4)
  (set :time 8.599)
  (set :zoom 1.13)
  (set :bfg2Trails -1.5)
  (set :nbOfP 350)
  (set :texSize 1000)
  (set :mass2Angle 10)
  (set :dist 0.0038)
  (set :contrast 1.0112)
  (set :speed 10.3)
  (set :alpha 0.869)
  (set :boundMode 1)
  (set :size 0)
  (set :nbOfSensors 16)
  (set :initMode 5)
  (set :spread 0)
  (set :colorAmt 0)
  (interp :colorAmt 1.0 45 41)
  (set :angleRangeMin 0)
  (set :angleRangeMax 0)
  (set :alphaFb 0.5)
  (set :polarAdd 0.0001)
  (set :distanceAdd 0.0001)
  (set :model 0)
  (set :rainSpeed 0.000)
  (set :rainAngle 2.4844)
  (set :offsetX 2.528)
  (set :offsetY -0.3013)
  (delay 150 (lambda () (set :zoom 1.13)))) 

(sinus :sBlur 10 0.001 31)

; synth saturation
(begin
 (interp :dist -.0038 10 20)
 (interp* :speed '((0 5) (2 5)) 21))

(begin
 (interp :bfg2Trails -0.02 60 23)
 (interp :zoom 0.2 45 24)
 (interp :polarAdd .001 40 25))

(interp :time 8.3887 20 26)
; trig *5
(begin
 (interp :speed 0.5 15 15)
 (set :boundMode 0)
 (interp* :distanceAdd '((-.0003 3.5) (0. 2.5)) 20))