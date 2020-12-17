REQUIRES C:\Users\james\Documents\Physics\Y3D3LabTesting\Life


{ -------------------------------------------------------------------------------------------------- }
{ --------------------------------------------- Shapes --------------------------------------------- }
{ -------------------------------------------------------------------------------------------------- }

\ All of the shapes are called using:  x y shapename
\
: boat \ still life with bottom left corner at x,y
1 pick 1 + 1 pick tr
1 pick 1 pick 1 + tr
1 pick 1 pick 2 + tr
1 pick 2 + 1 pick 1 + tr
1 pick 1 + 1 pick 2 + tr
drop drop 
count-cells
update-sim ;

: blinker \ period 2 oscillator with centre at x,y
1 pick 1 pick tr
1 pick 1 + 1 pick tr
1 pick 1 - 1 pick tr 
drop drop 
count-cells
update-sim ;

: lwss \ lightweight spaceship, bottom left corner @ x,y
1 pick 1 pick tr
1 pick 3 + 1 pick tr
1 pick 1 pick 2 + tr
1 pick 1 + 1 pick 3 + tr
1 pick 2 + 1 pick 3 + tr
1 pick 3 + 1 pick 3 + tr
1 pick 4 + 1 pick 3 + tr
1 pick 4 + 1 pick 2 + tr
1 pick 4 + 1 pick 1 + tr
drop drop 
count-cells
update-sim ;

: pulsar \ centre at x,y
1 pick  2 + 1 pick 1 + tr
1 pick  3 + 1 pick 1 + tr
1 pick  4 + 1 pick 1 + tr

1 pick  2 - 1 pick 1 + tr
1 pick  3 - 1 pick 1 + tr
1 pick  4 - 1 pick 1 + tr

1 pick  2 + 1 pick 1 - tr
1 pick  3 + 1 pick 1 - tr
1 pick  4 + 1 pick 1 - tr

1 pick  2 - 1 pick 1 - tr
1 pick  3 - 1 pick 1 - tr
1 pick  4 - 1 pick 1 - tr


1 pick  1 + 1 pick 2 + tr
1 pick  1 + 1 pick 3 + tr
1 pick  1 + 1 pick 4 + tr

1 pick  1 + 1 pick 2 - tr
1 pick  1 + 1 pick 3 - tr
1 pick  1 + 1 pick 4 - tr

1 pick  1 - 1 pick 2 + tr
1 pick  1 - 1 pick 3 + tr
1 pick  1 - 1 pick 4 + tr

1 pick  1 - 1 pick 2 - tr
1 pick  1 - 1 pick 3 - tr
1 pick  1 - 1 pick 4 - tr


1 pick  2 + 1 pick 6 + tr
1 pick  3 + 1 pick 6 + tr
1 pick  4 + 1 pick 6 + tr

1 pick  2 + 1 pick 6 - tr
1 pick  3 + 1 pick 6 - tr
1 pick  4 + 1 pick 6 - tr

1 pick  2 - 1 pick 6 + tr
1 pick  3 - 1 pick 6 + tr
1 pick  4 - 1 pick 6 + tr

1 pick  2 - 1 pick 6 - tr
1 pick  3 - 1 pick 6 - tr
1 pick  4 - 1 pick 6 - tr


1 pick  6 + 1 pick 2 + tr
1 pick  6 + 1 pick 3 + tr
1 pick  6 + 1 pick 4 + tr

1 pick  6 + 1 pick 2 - tr
1 pick  6 + 1 pick 3 - tr
1 pick  6 + 1 pick 4 - tr

1 pick  6 - 1 pick 2 + tr
1 pick  6 - 1 pick 3 + tr
1 pick  6 - 1 pick 4 + tr

1 pick  6 - 1 pick 2 - tr
1 pick  6 - 1 pick 3 - tr
1 pick  6 - 1 pick 4 - tr
drop drop 
count-cells
update-sim ;

: acorn \ interesting exploding methuselah
1 pick 1 pick tr
1 pick 1 + 1 pick tr
1 pick 1 + 1 pick 2 + tr
1 pick 3 + 1 pick 1 + tr
1 pick 4 + 1 pick tr
1 pick 5 + 1 pick tr
1 pick 6 + 1 pick tr
drop drop
count-cells
update-sim ;

: rnd10 \ A 10 x 10 square of randomly initialised pixels
1 pick 5 + 2 pick 5 - do
0 pick 5 + 1 pick 5 - do
2 rnd i j life-array!
loop
loop
drop drop
count-cells
update-sim ;

{ -------------------------------------- Gliders and Stoppers -------------------------------------- }

: drglider \ Glider travelling downwards/right 
1 pick 1 pick tr
1 pick 1 - 1 pick tr
1 pick 2 - 1 pick 1 + tr
1 pick 1 pick 1 + tr
1 pick 1 pick 2 + tr
drop drop
count-cells
update-sim ;

: dlglider \ Glider travelling downwards/left 
1 pick 1 pick tr
1 pick 1 + 1 pick tr
1 pick 2 + 1 pick 1 + tr
1 pick 1 pick 1 + tr
1 pick 1 pick 2 + tr
drop drop
count-cells
update-sim ;

: drgliderstopper \ Stops gliders travelling down/right upon correct collision
1 pick 1 pick tr
1 pick 1 + 1 pick tr
1 pick 1 pick 1 - tr
1 pick 2 + 1 pick 1 - tr
1 pick 2 + 1 pick 2 - tr
1 pick 2 + 1 pick 3 - tr
1 pick 3 + 1 pick 3 - tr
drop drop
count-cells
update-sim ;

: dlgliderstopper \ Stops gliders travelling down/left upon correct collision
1 pick 1 pick tr
1 pick 1 - 1 pick tr
1 pick 1 pick 1 - tr
1 pick 2 - 1 pick 1 - tr
1 pick 2 - 1 pick 2 - tr
1 pick 2 - 1 pick 3 - tr
1 pick 3 - 1 pick 3 - tr
drop drop
count-cells
update-sim ;
{ -------------------------------------------- Snarks ---------------------------------------------- }
\ Snarks reflext gliders upon correct collision

: drsnarkdl \ down/right glider to down/left glider
1 pick 3 + 1 pick 1 + tr \ square in middle
1 pick 3 + 1 pick 2 + tr
1 pick 4 + 1 pick 1 + tr
1 pick 4 + 1 pick 2 + tr

1 pick 5 - 1 pick 1 - tr \ squiggle to left
1 pick 5 - 1 pick 2 - tr
1 pick 6 - 1 pick 1 - tr
1 pick 7 - 1 pick 2 - tr
1 pick 7 - 1 pick 3 - tr
1 pick 7 - 1 pick 4 - tr
1 pick 8 - 1 pick 4 - tr

1 pick 2 + 1 pick 8 + tr \ squiggle above
1 pick 3 + 1 pick 8 + tr
1 pick 2 + 1 pick 9 + tr
1 pick 3 + 1 pick 10 + tr
1 pick 4 + 1 pick 10 + tr
1 pick 5 + 1 pick 10 + tr
1 pick 5 + 1 pick 11 + tr

1 pick 8 + 1 pick 1 + tr \ squiggle to right
1 pick 8 + 1 pick tr
1 pick 9 + 1 pick tr
1 pick 10 + 1 pick tr
1 pick 11 + 1 pick tr
1 pick 11 + 1 pick 1 - tr
1 pick 9 + 1 pick 2 + tr
1 pick 10 + 1 pick 2 + tr
1 pick 11 + 1 pick 2 + tr
1 pick 11 + 1 pick 3 + tr
1 pick 11 + 1 pick 4 + tr
1 pick 11 + 1 pick 5 + tr
1 pick 10 + 1 pick 5 + tr
1 pick 12 + 1 pick 1 + tr
1 pick 13 + 1 pick 1 + tr
1 pick 14 + 1 pick 2 + tr
1 pick 14 + 1 pick 3 + tr
1 pick 13 + 1 pick 3 + tr
1 pick 8 + 1 pick 2 - tr
1 pick 9 + 1 pick 2 - tr
1 pick 10 + 1 pick 2 - tr
1 pick 7 + 1 pick 3 - tr
1 pick 8 + 1 pick 4 - tr
1 pick 9 + 1 pick 4 - tr
1 pick 10 + 1 pick 4 - tr
1 pick 11 + 1 pick 4 - tr
1 pick 12 + 1 pick 4 - tr
1 pick 10 + 1 pick 5 - tr
1 pick 13 + 1 pick 5 - tr
1 pick 13 + 1 pick 6 - tr
1 pick 12 + 1 pick 6 - tr
drop drop
count-cells
update-sim ;

: dlsnarkdr \ down/left glider to down/right
1 pick 3 - 1 pick 1 + tr \ square in middle
1 pick 3 - 1 pick 2 + tr
1 pick 4 - 1 pick 1 + tr
1 pick 4 - 1 pick 2 + tr

1 pick 5 + 1 pick 1 - tr \ squiggle to left
1 pick 5 + 1 pick 2 - tr
1 pick 6 + 1 pick 1 - tr
1 pick 7 + 1 pick 2 - tr
1 pick 7 + 1 pick 3 - tr
1 pick 7 + 1 pick 4 - tr
1 pick 8 + 1 pick 4 - tr

1 pick 2 - 1 pick 8 + tr \ squiggle above
1 pick 3 - 1 pick 8 + tr
1 pick 2 - 1 pick 9 + tr
1 pick 3 - 1 pick 10 + tr
1 pick 4 - 1 pick 10 + tr
1 pick 5 - 1 pick 10 + tr
1 pick 5 - 1 pick 11 + tr

1 pick 8 - 1 pick 1 + tr \ squiggle to right
1 pick 8 - 1 pick tr
1 pick 9 - 1 pick tr
1 pick 10 - 1 pick tr
1 pick 11 - 1 pick tr
1 pick 11 - 1 pick 1 - tr
1 pick 9 - 1 pick 2 + tr
1 pick 10 - 1 pick 2 + tr
1 pick 11 - 1 pick 2 + tr
1 pick 11 - 1 pick 3 + tr
1 pick 11 - 1 pick 4 + tr
1 pick 11 - 1 pick 5 + tr
1 pick 10 - 1 pick 5 + tr
1 pick 12 - 1 pick 1 + tr
1 pick 13 - 1 pick 1 + tr
1 pick 14 - 1 pick 2 + tr
1 pick 14 - 1 pick 3 + tr
1 pick 13 - 1 pick 3 + tr
1 pick 8 - 1 pick 2 - tr
1 pick 9 - 1 pick 2 - tr
1 pick 10 - 1 pick 2 - tr
1 pick 7 - 1 pick 3 - tr
1 pick 8 - 1 pick 4 - tr
1 pick 9 - 1 pick 4 - tr
1 pick 10 - 1 pick 4 - tr
1 pick 11 - 1 pick 4 - tr
1 pick 12 - 1 pick 4 - tr
1 pick 10 - 1 pick 5 - tr
1 pick 13 - 1 pick 5 - tr
1 pick 13 - 1 pick 6 - tr
1 pick 12 - 1 pick 6 - tr
drop drop
count-cells
update-sim ;

{ ------------------------------------------ Glider Guns ------------------------------------------- }

: drglidergun \ Gosper glider gun firing gliders down/right
1 pick 1 pick tr
1 pick 1 - 1 pick tr
1 pick 1 - 1 pick 1 - tr
1 pick 1 - 1 pick 1 + tr
1 pick 2 - 1 pick 2 + tr
1 pick 2 - 1 pick 2 - tr
1 pick 3 - 1 pick tr
1 pick 4 - 1 pick 3 - tr
1 pick 4 - 1 pick 3 + tr
1 pick 5 - 1 pick 3 - tr
1 pick 5 - 1 pick 3 + tr
1 pick 6 - 1 pick 2 + tr
1 pick 6 - 1 pick 2 - tr
1 pick 7 - 1 pick tr
1 pick 7 - 1 pick 1 + tr
1 pick 7 - 1 pick 1 - tr

1 pick 16 - 1 pick tr
1 pick 16 - 1 pick 1 + tr
1 pick 17 - 1 pick tr
1 pick 17 - 1 pick 1 + tr

1 pick 3 + 1 pick 1 + tr
1 pick 3 + 1 pick 2 + tr
1 pick 3 + 1 pick 3 + tr
1 pick 4 + 1 pick 1 + tr
1 pick 4 + 1 pick 2 + tr
1 pick 4 + 1 pick 3 + tr
1 pick 5 + 1 pick tr
1 pick 5 + 1 pick 4 + tr
1 pick 7 + 1 pick tr
1 pick 7 + 1 pick 1 - tr
1 pick 7 + 1 pick 4 + tr
1 pick 7 + 1 pick 5 + tr

1 pick 17 + 1 pick 2 + tr
1 pick 17 + 1 pick 3 + tr
1 pick 18 + 1 pick 2 + tr
1 pick 18 + 1 pick 3 + tr
drop drop
count-cells
update-sim ;

: dlglidergun \ Gosper glider gun firing gliders down/right
1 pick 1 pick tr
1 pick 1 + 1 pick tr
1 pick 1 + 1 pick 1 - tr
1 pick 1 + 1 pick 1 + tr
1 pick 2 + 1 pick 2 + tr
1 pick 2 + 1 pick 2 - tr
1 pick 3 + 1 pick tr
1 pick 4 + 1 pick 3 - tr
1 pick 4 + 1 pick 3 + tr
1 pick 5 + 1 pick 3 - tr
1 pick 5 + 1 pick 3 + tr
1 pick 6 + 1 pick 2 + tr
1 pick 6 + 1 pick 2 - tr
1 pick 7 + 1 pick tr
1 pick 7 + 1 pick 1 + tr
1 pick 7 + 1 pick 1 - tr

1 pick 16 + 1 pick tr
1 pick 16 + 1 pick 1 + tr
1 pick 17 + 1 pick tr
1 pick 17 + 1 pick 1 + tr

1 pick 3 - 1 pick 1 + tr
1 pick 3 - 1 pick 2 + tr
1 pick 3 - 1 pick 3 + tr
1 pick 4 - 1 pick 1 + tr
1 pick 4 - 1 pick 2 + tr
1 pick 4 - 1 pick 3 + tr
1 pick 5 - 1 pick tr
1 pick 5 - 1 pick 4 + tr
1 pick 7 - 1 pick tr
1 pick 7 - 1 pick 1 - tr
1 pick 7 - 1 pick 4 + tr
1 pick 7 - 1 pick 5 + tr

1 pick 17 - 1 pick 2 + tr
1 pick 17 - 1 pick 3 + tr
1 pick 18 - 1 pick 2 + tr
1 pick 18 - 1 pick 3 + tr
drop drop
count-cells
update-sim ;

: drglidergun2 \ Period 46 glider gun firing down/right

1 pick 1 pick tr \ top left square
1 pick 1 + 1 pick tr
1 pick 1 pick 1 + tr
1 pick 1 + 1 pick 1 + tr

1 pick 1 pick 6 - tr \ bottom left square
1 pick 1 + 1 pick 6 - tr
1 pick 1 pick 7 - tr
1 pick 1 + 1 pick 7 - tr

1 pick 13 + 1 pick 1 - tr \ top left squigglq
1 pick 14 + 1 pick 1 - tr
1 pick 17 + 1 pick 1 - tr
1 pick 18 + 1 pick 1 - tr
1 pick 18 + 1 pick tr
1 pick 19 + 1 pick tr
1 pick 17 + 1 pick 1 + tr
1 pick 18 + 1 pick 1 + tr
1 pick 17 + 1 pick 2 + tr

1 pick 13 + 1 pick 5 - tr \ bottom left squiggle
1 pick 14 + 1 pick 5 - tr
1 pick 17 + 1 pick 5 - tr
1 pick 18 + 1 pick 5 - tr
1 pick 18 + 1 pick 6 - tr
1 pick 19 + 1 pick 6 - tr
1 pick 17 + 1 pick 7 - tr
1 pick 18 + 1 pick 7 - tr
1 pick 17 + 1 pick 8 - tr

1 pick 29 + 1 pick 2 + tr \ top right squiggle
1 pick 30 + 1 pick 2 + tr
1 pick 31 + 1 pick 2 + tr
1 pick 29 + 1 pick 3 + tr
1 pick 29 + 1 pick 4 + tr
1 pick 30 + 1 pick 5 + tr
1 pick 31 + 1 pick 5 + tr
1 pick 31 + 1 pick 4 + tr

1 pick 29 + 1 pick 2 - tr \ bottom right squiggle
1 pick 30 + 1 pick 2 - tr
1 pick 31 + 1 pick 2 - tr
1 pick 29 + 1 pick 3 - tr
1 pick 29 + 1 pick 4 - tr
1 pick 30 + 1 pick 5 - tr
1 pick 31 + 1 pick 5 - tr
1 pick 31 + 1 pick 4 - tr

1 pick 47 + 1 pick 3 + tr
1 pick 47 + 1 pick 4 + tr
1 pick 48 + 1 pick 3 + tr
1 pick 48 + 1 pick 4 + tr

1 pick 47 + 1 pick 3 - tr
1 pick 47 + 1 pick 4 - tr
1 pick 48 + 1 pick 3 - tr
1 pick 48 + 1 pick 4 - tr
drop drop
count-cells
update-sim ;

: dlglidergun2 \ Period 46 glider gun firing down/left

1 pick 1 pick tr \ top left square
1 pick 1 - 1 pick tr
1 pick 1 pick 1 + tr
1 pick 1 - 1 pick 1 + tr

1 pick 1 pick 6 - tr \ bottom left square
1 pick 1 - 1 pick 6 - tr
1 pick 1 pick 7 - tr
1 pick 1 - 1 pick 7 - tr

1 pick 13 - 1 pick 1 - tr \ top left squigglq
1 pick 14 - 1 pick 1 - tr
1 pick 17 - 1 pick 1 - tr
1 pick 18 - 1 pick 1 - tr
1 pick 18 - 1 pick tr
1 pick 19 - 1 pick tr
1 pick 17 - 1 pick 1 + tr
1 pick 18 - 1 pick 1 + tr
1 pick 17 - 1 pick 2 + tr

1 pick 13 - 1 pick 5 - tr \ bottom left squiggle
1 pick 14 - 1 pick 5 - tr
1 pick 17 - 1 pick 5 - tr
1 pick 18 - 1 pick 5 - tr
1 pick 18 - 1 pick 6 - tr
1 pick 19 - 1 pick 6 - tr
1 pick 17 - 1 pick 7 - tr
1 pick 18 - 1 pick 7 - tr
1 pick 17 - 1 pick 8 - tr

1 pick 29 - 1 pick 2 + tr \ top right squiggle
1 pick 30 - 1 pick 2 + tr
1 pick 31 - 1 pick 2 + tr
1 pick 29 - 1 pick 3 + tr
1 pick 29 - 1 pick 4 + tr
1 pick 30 - 1 pick 5 + tr
1 pick 31 - 1 pick 5 + tr
1 pick 31 - 1 pick 4 + tr

1 pick 29 - 1 pick 2 - tr \ bottom right squiggle
1 pick 30 - 1 pick 2 - tr
1 pick 31 - 1 pick 2 - tr
1 pick 29 - 1 pick 3 - tr
1 pick 29 - 1 pick 4 - tr
1 pick 30 - 1 pick 5 - tr
1 pick 31 - 1 pick 5 - tr
1 pick 31 - 1 pick 4 - tr

1 pick 47 - 1 pick 3 + tr
1 pick 47 - 1 pick 4 + tr
1 pick 48 - 1 pick 3 + tr
1 pick 48 - 1 pick 4 + tr

1 pick 47 - 1 pick 3 - tr
1 pick 47 - 1 pick 4 - tr
1 pick 48 - 1 pick 3 - tr
1 pick 48 - 1 pick 4 - tr
drop drop
count-cells
update-sim ;
{ -------------------------------------------------------------------------------------------------- }
{ ------------------------------------ Array Initial Conditions ------------------------------------ }
{ -------------------------------------------------------------------------------------------------- }
\ These are just called using the name

: linear-array \ set values to in life-array to a linear sequence
num-vals 0 do 
I life-array I + C! loop 
show-array ;

: 8rnd-array \ set each value in life-array to a random number between 0 and 8 inclusive
num-vals 0 
do 9 RND life-array I + C! 
loop 
show-array ;

: rnd-Array \ initialise the array with random ones and zeros
num-vals 0 do
2 rnd life-array I + C!
loop
count-cells
update-sim ;

: iden-array \ set life-array to a backwards identity matrix (Not working properly since show-array changed)
life-array num-vals 0 fill 
cr cr
num-cols 0 do
1 I I life-array! 
loop
count-cells
update-sim ;

: ones-array \ fill the array with ones
life-array num-vals 1 fill 
count-cells
update-sim ;

: glider-array \ initialise life-array with only a glider in the top left corner
life-array num-vals 0 fill 
2 num-cols 1 - tr
2 num-cols 2 - tr
2 num-cols 3 - tr
1 num-cols 3 - tr
0 num-cols 2 - tr
count-cells
update-sim ;

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
update-sim ;

{ ------------------------------------------ Logic Gates ------------------------------------------- }

: notop-array \ Glider gun NOT operator initialised with A = 0
rst-array
20 num-cols 10 - drglidergun \ operator
60 num-cols 11 - dlglidergun \ glidergun A
54 num-cols 15 - dlgliderstopper \ turn A off
106 num-cols 94 - drgliderstopper \ output

count-cells
update-sim ;

: notop-aon \ Turn on input A for the NOT operator 
54 num-cols 15 - fa
count-cells
update-sim ;

: notop-aoff \ Turn off input A for the NOT operator 
54 num-cols 15 - drgliderstopper 
count-cells
update-sim ;

: andop-array \ glider gun AND operator initialised with A,B = 0
rst-array
20 num-cols 10 - drglidergun \ glidergun A
26 num-cols 14 - drgliderstopper \ turn A off
106 num-cols 94 - drgliderstopper \ output
60 num-cols 10 - drglidergun \ glidergun B
66 num-cols 14 - drgliderstopper \ turn B off
100 num-cols 11 - dlglidergun \ operator
count-cells
update-sim ;

: andop-aon \ Turn on input A for the AND operator 
26 num-cols 15 - fa
count-cells
update-sim ;

: andop-bon \ Turn on input B for the AND operator 
66 num-cols 15 - fa
count-cells
update-sim ;

: andop-aoff \ Turn off input A for the AND operator 
26 num-cols 14 - drgliderstopper
count-cells
update-sim ;

: andop-boff \ Turn off input B for the AND operator 
66 num-cols 14 - drgliderstopper
count-cells
update-sim ;

: orop-array \ glider gun OR operator initialised with A,B = 0
rst-array
20 num-cols 10 - drglidergun \ operater stage 1
106 num-cols 94 - drgliderstopper \ output
60 num-cols 10 - drglidergun \ glidergun A
66 num-cols 14 - drgliderstopper \ turn A off
106 num-cols 54 - drgliderstopper \ A backstop
100 num-cols 10 - drglidergun \ glidergun B
106 num-cols 14 - drgliderstopper \ turn B off
146 num-cols 54 - drgliderstopper \ B backstop
140 num-cols 11 - dlglidergun \ operator stage 2
count-cells
update-sim ;

: orop-aon \ Turn on input A for the OR operator 
66 num-cols 15 - fa
count-cells
update-sim ;

: orop-bon \ Turn on input B for the OR operator 
106 num-cols 15 - fa
count-cells
update-sim ;

: orop-aoff \ Turn off input A for the OR operator 
66 num-cols 14 - drgliderstopper
count-cells
update-sim ;

: orop-boff \ Turn off input B for the OR operator 
106 num-cols 14 - drgliderstopper
count-cells
update-sim ;

{ ------------------------------------------ SRlatch ------------------------------------------- }

\ Not yet finished

: srlatch-array \ designed on 500 x 500 grid
150 400 drglidergun2 \ S
250 399 dlglidergun2 \ AND1
\ 98 400 drglidergun2 \ pseudogun NOT NEEDED
\ 302 399 dlglidergun2 \ NOT1
150 269 dlsnarkdr
\ 230 235 drglidergun2
329 238 dlglidergun2
count-cells
update-sim ;