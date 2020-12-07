{ ---------------------------- Welcome to Life.f, Comic Sans edition ---------------------------- }

 REQUIRES C:\Users\james\Documents\Physics\Y3D3LabTesting\RND               { Load Random Number generation for testing               }

{ ------------------------------------ Here are the exercises: ------------------------------------ }

: print-stack 
depth 0 do
I pick .
loop
." <top " ;

: empty-stack 
0 begin . depth 0 <= until ;


{ a }
: printsquares 101 0 do
        I I * dup .
        loop ;

{ b }

6 constant num-cols                                                            { the side length of the array }
num-cols num-cols * constant num-vals 
cr cr 
." Life-array is a " TYPE num-cols . ." by " TYPE num-cols . ." array containing " TYPE num-vals . ." values.  " TYPE 
create life-array num-vals allocate drop 
life-array num-vals 0 fill .

create numalive-array num-vals allocate drop 
numalive-array num-vals 0 fill .


: life-array@
0 pick num-cols <
1 pick 0 >=
3 pick num-cols <
4 pick 0 >= 
and and and if
num-cols * + life-array + C@ 
else . . 0 
then ; \ ." array@ " dup . ;

: life-array! num-cols * + life-array swap + C! ;

: numalive-array@ num-cols * + numalive-array + C@ ;

: numalive-array! num-cols * + numalive-array swap + C! ;

: show-array cr cr
0 num-cols 1 - do 
num-cols 0 do
I J life-array@ 4 .R
loop cr cr
-1 +loop ;

: show-numalive-array cr cr
0 num-cols 1 - do 
num-cols 0 do
I J numalive-array@ 4 .R
loop cr cr
-1 +loop  ;

: rst-array 
life-array num-vals 0 fill 
show-array ;

: linear-array num-vals 0 do 
I life-array I + C! loop 
show-array ;

: 8rnd-array num-vals 0
do 9 RND life-array I  + C! 
loop 
show-array ;

: iden-array 
rst-array
cr cr
num-cols 0 do
1 I I life-array! 
loop
show-array ;


: dead-linear
0 life-array rot + C! ;

: alive-linear
1 life-array rot + C! ;

: 8rnd-next num-vals 0
do I I life-array + C@
case
0 of dead-linear endof
1 of dead-linear endof
2 of alive-linear endof
3 of alive-linear endof
4 of dead-linear endof
5 of dead-linear endof
6 of dead-linear endof
7 of dead-linear endof
8 of dead-linear endof
endcase
loop 
show-array ;

: dead 0 rot rot life-array! ;

: alive 1 rot rot life-array! ;

: numalive-next num-vals 0
do I I numalive-array + C@
case
0 of dead-linear endof
1 of dead-linear endof
2 of I life-array + C@ 1 = 
if alive-linear
else dead-linear
then
endof
3 of alive-linear endof
4 of dead-linear endof
5 of dead-linear endof
6 of dead-linear endof
7 of dead-linear endof
8 of dead-linear endof
endcase
loop 
show-array ;

: localtest
0 LOCALS| localvar | 1 
localvar localvar localvar . 1

5 TO localvar 1 localvar localvar localvar . 1
;

: life-next
0 LOCALS| numalive |
num-cols 0 do \ for each row
num-cols 0 do \ for each column

cr cr
." I,J: " I . J .
cr

0 TO numalive \ reset the number of alive cells

cr
." Bottom left " 
I 1 - J 1 - life-array@ dup . 1 = \ bottom left
if numalive 1 + TO numalive then
\ numalive .

cr
." Bottom middle " 
I J 1 - life-array@ dup . 1 = \ bottom middle
if numalive 1 + TO numalive then
\ numalive .

cr
." Bottom right " 
I 1 + J 1 - life-array@ dup . 1 = \ bottom middle
if numalive 1 + TO numalive then
\ numalive .

cr
." Middle left " 
I 1 - J life-array@ dup . 1 = \ middle left
if numalive 1 + TO numalive then
\ numalive . 

cr
." Middle right " 
I 1 + J life-array@ dup . 1 = \ middle right
if numalive 1 + TO numalive then
\ numalive .

cr
." Top left " 
I 1 - J 1 + life-array@ dup . 1 = \ top left
if numalive 1 + TO numalive then
\ numalive .

cr
." Top middle " 
I J 1 + life-array@ dup . 1 = \ top middle
if numalive 1 + TO numalive then
\ numalive .

cr
." Top right " 
I 1 + J 1 + life-array@ dup . 1 = \ top right
if numalive 1 + TO numalive then
\ numalive .

cr ." Numalive: "
numalive .

numalive I J numalive-array!

loop 
loop ;

: tr 1 rot rot life-array! ;

: fa 0 rot rot life-array! ;

: glider-array 
rst-array
2 num-cols 1 - tr
2 num-cols 2 - tr
2 num-cols 3 - tr
1 num-cols 3 - tr
0 num-cols 2 - tr
show-array ;

: nt life-next numalive-next show-array ;

REQUIRES C:\Users\james\Documents\Physics\Y3D3LabTesting\Graphics_V6_Single_Scaled_BMP_Window 

: runsim
go-stretch-mine
1000 ms
begin
nt
bmp-address @ Calc-bmp-White        { Add random pixels to .bmp in memory             }
bmp-address @ bmp-to-screen-stretch { Stretch .bmp to display window                  }
key?
500 ms
until ;