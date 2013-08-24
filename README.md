#Farkle Game for Two Players
##Written in Ruby

by Jan Milosh

###Set up to play

This game is played in the terminal and was written in Ruby version 1.9.3. Please be sure to have Ruby installed on your computer (v.1.9.3 or later) before playing this game.

You may download this game from GitHub as a zip folder. Click the Download ZIP button at the bottom of the right sidebar of this page. After downloading, unzip the file and give it a readable name that you can remember. Move the file to a location that you can easily access with your terminal.

From your terminal, navigate to the game folder and open it. To launch the game, at the terminal prompt type 'ruby game.rb' (without the quotes). You'll be prompted to enter a name for each player. Once the names are entered, the play begins.

###Play the game

For background on the play and scoring of Farkle, please go to [the Wikipedia article](http://en.wikipedia.org/wiki/Farkle "Farkle play and rules"). This version follows the standard rules for scoring.

When playing this computer version, you must enter a 'b' (without the quotes) if you want to bank your score. If you want to set aside scoring dice and roll again, simply enter the numbers of the dice that you wish to set aside. For example, if you wish to set aside three one's and a five, you would type '1115' (in any order and without the quotes).

Play alternates with each player completing a round before passing to the other player. Your round ends when you either 'bank' your score, or 'Farkle' (when you Farkle you lose your points for that round and your round terminates). If you score with all six dice, you may start with another six dice and your round continues. This is known as having 'Hot Dice'.

As the game progresses, you will be prompted for input. There is an option to type 'q' at the end of each round in case you wish to quit the game prematurely.

The game continues until one player reaches a score of 10,000. At that point, the other player gets to roll one last round. Then the game ends and the highest scoring player wins. If the scores are equal, a tie is declared.

