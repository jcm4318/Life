{ -------------------------------------- Welcome to Life ---------------------------------------- }

{ ----------------------------------- Here are some constants ----------------------------------- }

500 constant num-cols \ array side length
num-cols num-cols * constant num-vals 

variable delay-time
variable survives
variable survives2
variable survives3
variable born
variable born2
variable born3

\ game of life rules:
3 born !
2 survives !
99 born2 !
99 born3 !
99 survives2 !
99 survives3 !
100 delay-time !

create life-array num-vals allot \ create the life array
cr cr ." Life-array created " TYPE

create seed num-vals allot \ create the seed array (for saving/loading random inits)

create numalive-array num-vals allot \ create the numalive array
\ numalive-array num-vals 0 fill .
cr cr ." Numalive-array created " TYPE cr cr

{ ---------------------------------- Here are the dependencies: ---------------------------------- }

REQUIRES C:\Users\james\Documents\Physics\Y3D3LabTesting\RND               { Load Random Number generation for testing               }
REQUIRES C:\Users\james\Documents\Physics\Y3D3LabTesting\Graphics_V6_Single_Scaled_BMP_Window 
REQUIRES C:\Users\james\Documents\Physics\Y3D3LabTesting\Test_File_IO_Tools 
REQUIRES C:\Users\james\Documents\Physics\Y3D3LabTesting\Text_Output_Window_V1
\ REQUIRES C:\Users\james\Documents\Physics\Y3D3LabTesting\Life-Shapes

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

{ --------------------------------------- File I/O Commands --------------------------------------- }

: write-file-data \ writes the number of alive/dead cells to a file
total-alive @ (.)         test-file-id @ write-file drop
s" ,"         test-file-id @ write-file drop
total-dead @ (.) test-file-id @ write-line drop ;

{ --------------------------------------- Graphics Commands --------------------------------------- }

: update-sim \ updates the current bitmap window to the position of the game
bmp-address @ Calc-bmp-White
bmp-address @ bmp-to-screen-stretch ;

: show-sim \ displays the current life-array as a bitmap
go-stretch-mine 
new-file 
write-file-data ;

{ ------------------------------ Array Accessing and Manipulating --------------------------------- }

: life-array@ \ access a value in the life-array using x,y coordinates
0 pick num-cols <
1 pick 0 >=
3 pick num-cols <
4 pick 0 >= 
and and and if
num-cols * + life-array + C@ 
else drop drop 0 
then ;

: life-array! \ change a value in the life-array using x,y coordinates: num x y life-array!
0 pick num-cols <
1 pick 0 >=
3 pick num-cols <
4 pick 0 >= 
and and and if
num-cols * + life-array swap + C! 
else drop drop drop
then ; 

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

: tr 1 rot rot life-array! update-sim ; \ sets a cell in life-array to be alive given x,y coordinates

: fa 0 rot rot life-array! update-sim ; \ set a cell in life-array to be dead given x,y coordinates

: dead-linear \ set a cell in life-array to be dead given the 'linear' cell number
0 life-array rot + C! ;

: alive-linear \ set a cell in life-array to be alive given the 'linear' cell number
1 life-array rot + C! ;

: count-cells
0 locals| alive |
num-vals 0 do 
I life-array + C@ 1 = 
if alive 1 + TO alive
then
loop 
alive total-alive ! 
num-vals alive - total-dead ! ;

: rst-array \ reset all values in the life-array to 0
life-array num-vals 0 fill 
count-cells
update-sim ;

{ ----------------------------------- Gameplay Inner workings ------------------------------------ }

: life-next \ counts the number of alive cells around each cell in life-array and sends to numalive-array
0 LOCALS| numalive |
num-cols 0 do \ for each row
num-cols 0 do \ for each column

0 TO numalive \ reset the number of alive cells

\ check if each surrounding cell is alive
I 1 - J 1 - life-array@  1 = \ bottom left
if numalive 1 + TO numalive then

I J 1 - life-array@  1 = \ bottom middle
if numalive 1 + TO numalive then

I 1 + J 1 - life-array@  1 = \ bottom middle
if numalive 1 + TO numalive then

I 1 - J life-array@  1 = \ middle left
if numalive 1 + TO numalive then
 
I 1 + J life-array@  1 = \ middle right
if numalive 1 + TO numalive then

I 1 - J 1 + life-array@  1 = \ top left
if numalive 1 + TO numalive then

I J 1 + life-array@  1 = \ top middle
if numalive 1 + TO numalive then

I 1 + J 1 + life-array@ 1 = \ top right
if numalive 1 + TO numalive then

numalive I J numalive-array!

loop 
loop ;

: numalive-next \ use the numalive-array to change the life-array to the next set of cells
num-vals 0 do
        I I numalive-array + C@
        case
                survives @ of I life-array + C@ 1 = 
                        if alive-linear
                        else dead-linear
                        then
                endof
                survives2 @ of I life-array + C@ 1 = 
                        if alive-linear
                        else dead-linear
                        then
                endof
                survives3 @ of I life-array + C@ 1 = 
                        if alive-linear
                        else dead-linear
                        then
                endof
                born @ of alive-linear endof
                born2 @ of alive-linear endof
                born3 @ of alive-linear endof
                dup of dead-linear endof
        endcase
loop ;

{ ------------------------------------------- Statistics ------------------------------------------- }

: save-seed \ saves the current state of life-array to seed
num-vals 0 do
i life-array + c@ i seed + c!
loop ;

: load-seed \ loads the seed into life-array 
num-vals 0 do
i seed + c@ i life-array + c!
loop 
count-cells
update-sim ;

{ -------------------------------------------- Gameplay -------------------------------------------- }

: nt life-next numalive-next count-cells write-file-data ; \ shorthand for 'next turn'; runs the whole iteration

: show-nt \ manually runs nt and update-sim
life-next
numalive-next
bmp-address @ Calc-bmp-White
bmp-address @ bmp-to-screen-stretch
count-cells 
write-file-data ;

: run-sim \ opens a new bitmap and runs the simulation
go-stretch-mine
count-cells
new-file
write-file-data
save-seed
1000 ms
begin
nt
write-file-data
bmp-address @ Calc-bmp-White        { Add random pixels to .bmp in memory             }
bmp-address @ bmp-to-screen-stretch { Stretch .bmp to display window                  }
1 ms
key?
until ;

: play-sim \ plays the currently opened sim
save-seed
begin
nt
write-file-data
bmp-address @ Calc-bmp-White        { Add random pixels to .bmp in memory             }
bmp-address @ bmp-to-screen-stretch { Stretch .bmp to display window                  }
delay-time @ ms
key?
until ;

{ ---------------------------------------------- Init ---------------------------------------------- }

show-sim \ open a sim on init
rst-array \ reset to empty space
