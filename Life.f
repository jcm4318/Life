{ ---------------------------- Welcome to Life.f, Comic Sans edition ---------------------------- }







{ ------------------------------------ Here are the exercises: ------------------------------------ }

4 constant num-cols                                                            { the side length of the array }
num-cols num-cols * constant num-vals 

create life-array num-vals allocate drop 
life-array num-vals 0 fill .
cr cr ." Life-array created "

create numalive-array num-vals allocate drop 
numalive-array num-vals 0 fill .
cr cr ." Numalive-array created " cr cr

{ ---------------------------------- Here are the dependencies: ---------------------------------- }

REQUIRES C:\Users\james\Documents\Physics\Y3D3LabTesting\RND               { Load Random Number generation for testing               }
REQUIRES C:\Users\james\Documents\Physics\Y3D3LabTesting\Graphics_V6_Single_Scaled_BMP_Window 
REQUIRES C:\Users\james\Documents\Physics\Y3D3LabTesting\Test_File_IO_Tools 
REQUIRES C:\Users\james\Documents\Physics\Y3D3LabTesting\Text_Output_Window_V1

{ ---------------------------------------- No longer useful ----------------------------------------- }

: localtest \ used for testing how local variables work (no longer used)
0 LOCALS| localvar |
localvar .
5 TO localvar
localvar . ;

{ ----------------------------------------- Useful Words ------------------------------------------ }

: print-stack \ print the contents of the stack without disturbing it
depth 0 do
I pick .
loop
." <top " ;

: empty-stack \ print the contents of the stack and reset it
0 begin . depth 0 <= until ;

{ ------------------------------ Array Accessing and Manipulating ------------------------------- }

: life-array@ \ access a value in the life-array using x,y coordinates
0 pick num-cols <
1 pick 0 >=
3 pick num-cols <
4 pick 0 >= 
and and and if
num-cols * + life-array + C@ 
else . . 0 
then ;

: life-array! num-cols * + life-array swap + C! ; \ change a value in the life-array using x,y coordinates

: numalive-array@ num-cols * + numalive-array + C@ ; \ access a value in the numalive-array using x,y, coordinates

: numalive-array! num-cols * + numalive-array swap + C! ; \ change a value in the numalive-array using x,y coordinates

: show-array \ print all elements of (display) the life-array
cr cr 0 num-cols 1 - do 
num-cols 0 do
I J life-array@ 4 .R
loop cr cr
-1 +loop ;

: show-numalive-array cr cr \ print all elements of (display) the numalive-array
0 num-cols 1 - do 
num-cols 0 do
I J numalive-array@ 4 .R
loop cr cr
-1 +loop  ;

: tr 1 rot rot life-array! ; \ sets a cell in life-array to be alive given x,y coordinates

: fa 0 rot rot life-array! ; \ set a cell in life-array to be dead given x,y coordinates

: dead-linear \ set a cell in life-array to be dead given the 'linear' cell number
0 life-array rot + C! ;

: alive-linear \ set a cell in life-array to be alive given the 'linear' cell number
1 life-array rot + C! ;

{ ----------------------------------- Gameplay Inner workings ------------------------------------ }

: numalive-next \ use the numalive-array to change the life-array to the next set of cells
num-vals 0 do
        I I numalive-array + C@
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

: life-next \ counts the number of alive cells around each cell in life-array and sends to numalive-array
0 LOCALS| numalive |
show-array
num-cols 0 do \ for each row
num-cols 0 do \ for each column
show-array
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

{ ------------------------------------------- Statistics ------------------------------------------- }

: count-cells
0 locals| alive |
num-vals 0 do 
I life-array + C@ 1 = 
if alive 1 + TO alive
then
loop 
cr cr
." Number alive: " alive . cr
." Number dead: " num-vals alive - . cr cr 
alive total-alive ! 
num-vals alive - total-dead ! ;

{ ------------------------------------ Array Initial Conditions ------------------------------------ }

: rst-array \ reset all values in the life-array to 0
life-array num-vals 0 fill 
count-cells
show-array ;

: linear-array \ set values to in life-array to a linear sequence
num-vals 0 do 
I life-array I + C! loop 
count-cells
show-array ;

: 8rnd-array \ set each value in life-array to a random number between 0 and 8 inclusive
num-vals 0 
do 9 RND life-array I  + C! 
loop 
show-array ;

: iden-array \ set life-array to the identity matrix (Not working properly since show-array changed)
life-array num-vals 0 fill 
cr cr
num-cols 0 do
1 I I life-array! 
loop
count-cells
show-array ;

: ones-array
life-array num-vals 1 fill 
count-cells
show-array ;

: glider-array \ initialise life-array with a glider in the top left corner
life-array num-vals 0 fill 
2 num-cols 1 - tr
2 num-cols 2 - tr
2 num-cols 3 - tr
1 num-cols 3 - tr
0 num-cols 2 - tr
count-cells
show-array ;

: pipent-array \ initialises life-array with a pi-pentomino methuselah
\ assumes the array has even side length
life-array num-vals 0 fill 
num-cols 1 - 2 / num-cols 1 - 2 / 1 + tr
num-cols 1 - 2 / 1 - num-cols 1 - 2 / 1 + tr
num-cols 1 - 2 / 1 + num-cols 1 - 2 / 1 + tr
num-cols 1 - 2 / 1 - num-cols 1 - 2 / tr
num-cols 1 - 2 / 1 - num-cols 1 - 2 / 1 - tr
num-cols 1 - 2 / 1 + num-cols 1 - 2 / tr
num-cols 1 - 2 / 1 + num-cols 1 - 2 / 1 - tr
count-cells
show-array ;

{ -------------------------------------------- Gameplay -------------------------------------------- }

: nt life-next numalive-next count-cells show-array ; \ shorthand for 'next turn', runs the whole iteration

: update-sim \ updates the current bitmap window to the position of the game
bmp-address @ Calc-bmp-White
bmp-address @ bmp-to-screen-stretch ;

: show-sim \ displays the current life-array as a bitmap
go-stretch-mine ;

: show-nt \ manually runs nt and update-sim
life-next
numalive-next
show-array
bmp-address @ Calc-bmp-White
bmp-address @ bmp-to-screen-stretch
count-cells ;

: run-sim \ runs the simulation as a bitmap
go-stretch-mine
count-cells
2000 ms
begin
nt
bmp-address @ Calc-bmp-White        { Add random pixels to .bmp in memory             }
bmp-address @ bmp-to-screen-stretch { Stretch .bmp to display window                  }
key?
count-cells
\ 1 * total-alive !
1000 ms
until ;
