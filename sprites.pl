
$the_croco = <<EOC;




                        ===============(:)>
                       //                         ((
                     _//_________________________-----_
                ____/                                o\\____
           ____/                                          -\\
      ____/          .--.            .--.       __        __/
 ____/              /   /            |  |      /   '------'
/__________________/   /-------------|  |_____/
                   |   |              \\  \\
                    |_\\                \\  \\_--->
                    |  \\                -____<
                    ^   ^                    --->
==
                                       ________
                                      < Shhhhh >
                                       --------
                                        /                  ______
                        ===============(:)>              < Miaou ! >
                       //                         ((       -------
                     _//_________________________-----_       /
                ____/                                ^\\____ /
           ____/                                          -\\
      ____/          .--.            .--.       __        __/
 ____/              /   /            |  |      /   '------'
/__________________/   /-------------|  |_____/
                   |   |              \\  \\
                    |_\\                \\  \\_--->
                    |  \\                -____<
                    ^   ^                    --->
==


                                         [
                        ===============(:)>
                       //                [        ((
                     _//_________________________-----_
                ____/                                0\\____
           ____/                                          -\\
      ____/          .--.            .--.       __ VVVVVVVVVV
 ____/              /   /            |  |      /   \\
/__________________/   /-------------|  |_____/    \\^^^^^^^^^/
                   |   |              \\  \\         '------'
                    |_\\                \\  \\_--->
                    |  \\                -____<
                    ^   ^                    --->
EOC

@croco = split "==\n", $the_croco;


$scratch = <<EOC;


           /          _/
           |         _/
           |        _/
          /       _/
         |      _/
        /     _/
       |    _/   SCRATCH !
      /   _/
     |  _/
    / _/
    |/
EOC

$geko = <<EOC;

    O       _C _C _C
   /     __/__/__/_
  C====< __________=:>-
   \\      \\_C \\_C
    O
    "
EOC

$fat_geko = <<EOC;

            _C _C _C
    O    __/__/__/_
   /    /          \\_
  C====< < < < < <  _:>
   \\    \\__________/
   O      \\_C \\_C

EOC

$str_geko = <<EOC;
           vv vv vv
    O      /  /  /
   /     _()_()_()_
  C====< __________=:>-
   \\      () ()
    O       \\  \\--C
    "       ^^ ^^
EOC


$monster_geko = <<EOC;
           vv vv vv
           /  /  /
    O    _()_()_()_
   /    /          \\_
  C====< < < < < <  _:>
   \\    \\__________/
   O        ()  ()
             \\   \\--C
             ^^  ^^
EOC

$lab_map = <<EOC;
   ____    ____    ____    ____                ____   ____
  |Lab0|  |Lab1|  |Lab2|  |Lab3|              |Lab4| |Lab5|
  |_ __|  |_ __|  |_ __|  |_ __|  _           |_ __| |_ __|
 ___||______||______||______||___[E]____________||_____||__
|____ _______ _______ ______ ______ _@____ ______ ______ __|
   _| |_   _| |_   _| |_  _| |_  _| |_  _| |_  _| |_  _| |_
  |Lab6 | |Lab7 | |Lab8 ||Lab9 ||LabA ||LabB ||LabC ||LabD |
  |_____| |_____| |_____||_____||_____||_____||_____||_____|

@: you are here
EOC

$lab_true_map = <<EOC;
   ____    ____    ____    ____                ____   ____
  |Lab0|  |Lab1|  |Lab2|  |Lab3|         _    |Lab4| |Lab5|
  |_ __|  |_ __|  |_ __|  |_ __|  _     [E]   |_ __| |_ __|
 ___||______||______||______||___[E]____| |______||_____||__
|____ _______ _______ ______ ______ ______ ______ ______ __|
   _| |_   _| |_   _| |_  _| |_  _| |_  _| |_  _| |_  _| |_
  |Lab6 | |Lab7 | |Lab8 ||Lab9 ||LabA ||LabB ||LabC ||LabD |
  |_____| |_____| |_____||_____||_____||_____||_____||_____|
EOC

$door = <<EOC;
 /-------------------------------------------------------------\\
 |                             |                               |
 |                             |                               |
 |                             |                               |
 |                             |                               |
 |                             |                               |
 |                             |                               |
 |                            / \\                              |
 |                            | |                              |
 |                            \\ /                              |
 |                             |                               |
 |                             |                               |
 |        ___                  |                               |
 |       [>~!]                 |                               |
 |       |---|                 |                               |
 |       |   |                 |                               |
 |       |   |                 |                               |
 \\-------------------------------------------------------------/
EOC

$console_help = <<EOC;
           ________________________
          /                        \\
          |  HELP:                 |
          |  open                  |
          |  draw                  |
          |  help                  |
          |  Joe >                 |
          \\________________________/
           |                      |
           |                      |
           |                      |
           |                      |
           |                      |

EOC

$console_draw = <<EOC;
           ________________________
          /    ___    ___          \\
          |   (   )  (   )         |
          |    | |    | |          |
          |    | |    | |          |
          |     V      V           |
          |  Joe >                 |
          \\________________________/
           |                      |
           |                      |
           |                      |
           |                      |
           |                      |

EOC

$console_unknow = <<EOC;
           ________________________
          /                        \\
          |  UNKNOW CMD, try help  |
          |  Joe >                 |
          |                        |
          |                        |
          |                        |
          \\________________________/
           |                      |
           |                      |
           |                      |
           |                      |
           |                      |

EOC

$console = <<EOC;
           ________________________
          /                        \\
          | Joe >                  |
          |                        |
          |                        |
          |                        |
          |                        |
          \\________________________/
           |                      |
           |                      |
           |                      |
           |                      |
           |                      |

EOC

$door_open_anim = <<EOC;
 /-------------------------------------------------------------\\
 |                             |                               |
 |                             |                               |
 |                             |                               |
 |                             |                               |
 |                             |                               |
 |                             |                               |
 |                            / \\                              |
 |                            | |                              |
 |                            \\ /                              |
 |                             |                               |
 |                             |                               |
 |        ___                  |                               |
 |       [>~!]                 |                               |
 |       |---|                 |                               |
 |       |   |                 |                               |
 |       |   |                 |                               |
\\-------------------------------------------------------------/
==
 /-------------------------------------------------------------\\
 |                          |     |                            |
 |                          |  ^  |                            |
 |                          |     |                            |
 |                          |     |                            |
 |                          |_____|                            |
 |                          |     |                            |
 |                         /       \\                           |
 |                         |       |                           |
 |                         \\  ___  /                           |
 |                          || | ||                            |
 |                          ||_|_||                            |
 |        ___               |     |                            |
 |       [>~!]              |     |                            |
 |       |---|              |     |                            |
 |       |   |              |     |                            |
 |       |   |              |     |                            |
\\-------------------------------------------------------------/
==
 /-------------------------------------------------------------\\
 |                        |         |                          |
 |                        |    ^    |                          |
 |                        |   /|\\   |                          |
 |                        |         |                          |
 |                        |_________|                          |
 |                        |         |                          |
 |                       /           \\                         |
 |                       |           |                         |
 |                       \\    ___    /                         |
 |                        |  | | |  |                          |
 |                        |__|_|_|__|                          |
 |        ___             |         |                          |
 |       [>~!]            |         |                          |
 |       |---|            |         |                          |
 |       |   |            |         |                          |
 |       |   |            |         |                          |
\\-------------------------------------------------------------/
==
 /-------------------------------------------------------------\\
 |                    |                 |                      |
 |                    |        ^        |                      |
 |                    |                 |                      |
 |                    |                 |                      |
 |                    | \\_____________/ |                      |
 |                    | |             | |                      |
 |                   /  |             |  \\                     |
 |                   |  |             |  |                     |
 |                   \\  |     ___     |  /                     |
 |                    | |    | | |    | |                      |
 |                    | |____|_|_|____| |                      |
 |        ___         |/               \\|                      |
 |       [>~!]        |                 |                      |
 |       |---|        |                 |                      |
 |       |   |        |                 |                      |
 |       |   |        |                 |                      |
\\-------------------------------------------------------------/
==
 /-------------------------------------------------------------\\
 |               |                            |                |
 |               |\\            ^            / |                |
 |               |  \\         /|\\         /   |                |
 |               |    \\                 /     |                |
 |               |      \\_____________/       |                |
 |               |      |             |       |                |
 |              /       |             |        \\               |
 |              |       |             |        |               |
 |              \\       |     ___     |        /               |
 |               |      |    | | |    |  -    |                |
 |               |      |____|_|_|____| |||   |                |
 |        ___    |     /               \\|||   |                |
 |       [>~!]   |   /                   \\|   |                |
 |       |---|   | /                       \\  |                |
 |       |   |   |                           \\|                |
 |       |   |   |                            |                |
\\-------------------------------------------------------------/
==
 /-------------------------------------------------------------\\
 |        |     \\                             /    |           |
 |        |       \\            ^            /      |           |
 |        |         \\                     /        |           |
 |        |           \\                 /          |           |
 |        |             \\_____________/            |           |
 |        |             |             |            |           |
 |       /              |             |             \\          |
 |       |              |             |             |          |
 |       \\              |     ___     |             /          |
 |        |             |    | | |    |  -         |           |
 |        |       #     |____|_|_|____| |||        |           |
 |        |  ___       /               \\|||        |           |
 |        | [>~!]    /                   \\|        |           |
 |        | |---|  /                       \\       |           |
 |        | |   |/                           \\     |           |
 |        | |   |                              \\   |           |
\\-------------------------------------------------------------/
==
          -------------------------------------------
          |     \\                             /    |
          |       \\            ^            /      |
          |         \\         /|\\         /        |
          |           \\                 /          |
          |             \\_____________/            |
          |             |             |            |
          |             |             |            |
          |             |             |            |
          |             |     ___     |            |
          |             |    | | |    |  -         |
          |       #     |____|_|_|____| |||        |
          |            /               \\|||        |
          |          /                   \\|        |
          |        /                       \\       |
          |      /                           \\     |
          |    /                               \\   |
          -------------------------------------------

==
          -------------------------------------------
          |     \\                             /    |
          |       \\            ^            /      |
          |         \\                     /        |
          |           \\                 /          |
          |             \\_____________/            |
          |             |             |            |
          |             |             |            |
          |             |             |            |
          |             |     ___     |            |
          |             |    | | |    |  -         |
          |       #     |____|_|_|____| |||        |
          |            /               \\|||        |
          |          /     ???           \\|        |
          |        /        o    o         \\       |
          |      /         <^>  <O>          \\     |
          |    /           / \\  / \\            \\   |
          -------------------------------------------
==
          -------------------------------------------
          |     \\                             /    |
          |       \\            ^            /      |
          |         \\         /|\\         /        |
          |           \\                 /          |
          |             \\_____________/            |
          |             |             |            |
          |             |             |            |
          |             |             |            |
          |             |     ___     |            |
          |             |    | | |    |  -         |
          |       #     |____|_|_|____| |||        |
          |            /               \\|||        |
          |          /     ???           \\|        |
          |        /        o    o         \\       |
          |      /         /^\\  <O>          \\     |
          |    /           / \\  / \\            \\   |
          -------------------------------------------
==
          -------------------------------------------
          |     \\                             /    |
          |       \\            ^            /      |
          |         \\                     /        |
          |           \\                 /          |
          |             \\_____________/            |
          |             |             |            |
          |             |             |            |
          |             |             |            |
          |             |     ___     |            |
          |             |    | | |    |  -         |
          |       #     |____|_|_|____| |||        |
          |            /               \\|||        |
          |          /     ???           \\|        |
          |        /       <o    o         \\       |
          |      /          ^\\  <O>          \\     |
          |    /           / \\  / \\            \\   |
          -------------------------------------------
==
          -------------------------------------------
          |     \\                             /    |
          |       \\            ^            /      |
          |         \\         /|\\         /        |
          |           \\                 /          |
          |             \\_____________/            |
          |             |             |            |
          |             |             |            |
          |             |             |            |
          |             |     ___     |            |
          |             |    | | |    |  -         |
          |       #     |____|_|_|____| |||        |
          |            /               \\|||        |
          |          /     ???           \\|        |
          |        /       <o    o         \\       |
          |      /          ^\\  /O\\          \\     |
          |    /           / \\  / \\            \\   |
          -------------------------------------------
==
          -------------------------------------------
          |     \\                             /    |
          |       \\            ^            /      |
          |         \\                     /        |
          |           \\                 /          |
          |             \\_____________/            |
          |             |             |            |
          |             |             |            |
          |             |             |            |
          |             |     ___     |            |
          |             |    | | |    |  -         |
          |       #     |____|_|_|____| |||        |
          |            /               \\|||        |
          |          /                   \\|        |
          |        /       <o   \\o         \\       |
          |      /          ^\\   O\\          \\     |
          |    /           / \\  / \\            \\   |
          -------------------------------------------
==
          -------------------------------------------
          |     \\                             /    |
          |       \\            ^            /      |
          |         \\         /|\\         /        |
          |           \\                 /          |
          |             \\_____________/            |
          |             |             |            |
          |             |             |            |
          |             |             |            |
          |             |     ___     |            |
          |             |    | | |    |  -         |
          |       #     |____|_|_|____| |||        |
          |            /               \\|||        |
          |          /            !!     \\|        |
          |        /        o   \\o         \\       |
          |      /         /^\\   O\\          \\     |
          |    /           / \\  / \\            \\   |
          -------------------------------------------
==
          -------------------------------------------
          |     \\                             /    |
          |       \\            ^            /      |
          |         \\                     /        |
          |           \\                 /          |
          |             \\_____________/            |
          |             |             |            |
          |             |             |            |
          |             |             |            |
          |             |     ___     |            |
          |             |    | | |    |  -         |
          |       #     |____|_|_|____| |||        |
          |            /               \\|||        |
          |          /                   \\|        |
          |        /        o   \\o         \\       |
          |      /         <^\\   O\\          \\     |
          |    /           / \\  / \\            \\   |
          -------------------------------------------
==
          -------
          |     \\
          |       \\
          |         \\
          |           \\
          |             \\
          |             |
          |             |
          |             |
          |             |
          |             |
          |       #     |
          |            /
          |          /
          |        /
          |      /
          |    /
          ----
==
          -------
          |       \\
          |          \\
          |             \\
          |                \\
          |                  \\
          |                     |
          |                     |
          |          __         |
          |        -`/ |        |
          |       | H .         |
          |       |.-           |
          |                   /`
          |                / `
          |             / `
          |          / `
          |      / `
          ----
==
          --------------------------------------------
          | __________               ____________    |
          | |         |     E       |            |   |
          | |         |     |       |   [R&D]    |   |
          | | [Market]|     |       |            |   |
          | |         | ----------  |            |   |
          | |         |=|[Rest]   |=|            |   |
          | |------ --| |         | |            |   |
          | |         | ----------  |            |   |
          | |         |    _|_   __ |            |   |
          | |         | |-|   | |  ||            |   |
          | |_________| | =    =|__||____________|   |
          |             |-|@  |                      |
          --------------------------------------------

@: you are here

EOC

#my $colored_door_anim = $door_open_anim =~ s/\/\|\\/$color_yellow\/|\\$color_none/gr;


@door_open = split "==\n", $door_open_anim;

$color_yellow="\033[33m";
$color_none="\033[0m";

foreach (@door_open) {
    print $_, "\n";
    $_ = $_ =~ s/\/\|\\/$color_yellow\/|\\$color_none/r;
}


@look_entrance = split "==\n" , <<EOC;



__________________________________________________
/    __     ^           |                         |
    <Go>                |                         |
     /                  |                         |
 o##o      ---          -                ---      |
 O  ^     | | |        | |        ___  || | |    (|
_L__L_____|_|_|________|_|________|_|_N_|_|_|_____|
==



__________________________________________________
/           ^           |                         |
           """          |                         |
                        |                         |
    ##     ---    o  o  -                ---      |
          | | |   O  ^ | |        ___  || | |    (|
__________|_|_|___L__L_|_|________|_|_N_|_|_|_____|
==



__________________________________________________
/           ^           |                         |
                        |                         |
                        |                         |
    ##     ---          -    o        o  ---      |
          | | |        | |   ^    ___/O|| | |    (|
__________|_|_|________|_|___L____|_|/N_|_|_|_____|
==



__________________________________________________
/           ^           |                         |
           """          |                         |
                        |                         |
    ##     ---          -    o        o  ---      |
          | | |        | |   ^    ___/O|| | |    (|
__________|_|_|________|_|___L____|_|/N_|_|_|_____|
==



__________________________________________________
/           ^           |                         |
                        |                         |
                        |                         |
    ##     ---          -    o        o  ---      |
          | | |        | |   ^    ___/O|| | |    (|
__________|_|_|________|_|___L____|_|/N_|_|_|_____|
EOC

foreach (@look_entrance) {
    print $_, "\n";
    $_ = $_ =~ s/"""/$color_yellow"""$color_none/r;
}

@to_elevator = split "==\n" , <<EOC;



__________________________________________________
/           ^           |                         |
                        |                         |
                        |                         |
     ##    ---          -                -o-  o   |
          | | |        | |        ___  || O | ^\\ (|
__________|_|_|________|_|________|_| N_|_L_|_L___|
==



____________________________________________________________
/           ^           |                         |--------||
           """          |                         |        ||
                        |                         |        ||
      ##   ---          -                -o-  o   |        ||
          | | |        | |        ___  || O | ^\\  (|       ||
__________|_|_|________|_|________|_| N_|_L_|_L___|________||
==



_________________________________
                       |--------||
                       |        ||
                       |        ||
              ---      |   o  o ||
       ___  || | |    (|   O  ^ ||
_______|_| N_|_|_|_____|___L__L_||
==

_________________________________
                       |--------||
                       |        ||
                       |        ||
              ---      |   o  o ||
       ___  || | |    (|   O  ^ ||
_______|_| N_|_|_|_____|___L__L_||
                      |          |
                      |          |
                      |          |
                      |          |
                      |          |
                      |          |
==
_________________________________
                       |   \\0/   |
                       |   | |   |
                       |   | |   |
              ---      |   | |   |
       ___  || | |    (|--------||
_______|_| N_|_|_|_____|        ||
                      ||        ||
                      ||   o  o ||
                      ||   O  ^ ||
                      ||___L__L_||
                      |          |
                      |          |
                      |          |
                      |          |
==
                       |   ||    |
                       |   ||    |
              ---      |   ||    |
       ___  || | |    (|   ||    |
_______|_| N_|_|_|_____|   ||    |
                      |    ||    |
                      ||--------||
                      ||        ||
                      ||        ||
                      ||   o  o ||
                      ||   O  ^ ||
                      ||___L__L_||
                      |          |
==
       ___  || | |    (|   ||    |
_______|_| N_|_|_|_____|   ||    |
                      |    ||    |
                      |    ||    |
                      |    ||    |
                      |    ||    |
                      |    ||    |
                      ||--------||
                      ||        ||
                      ||        ||
                      ||   o  o ||
                      ||   O  ^ ||
                      ||___L__L_||
                      |          |
======================|          |
==
                      |    ||    |
                      ||--------||
                      ||        ||
======================||        ||
\\                    /||   o  o ||
 \\_________________ / ||   O  ^ ||
  |                |  ||___L__L_||
  |                |  |          |
  |                |  |          |
  |                |  |          |
__|________________|__|__________|
==
                      |    ||    |
                      |    ||    |
                      |    ||    |
======================|    ||    |
\\                    /|    ||    |
 \\________________  / ||--------||
  |                |  ||        ||
  |                |  ||        ||
  |                |  ||   o  o ||
  |                |  ||   O  ^ ||
__|________________|__||___L__L_||
==
                      |    ||    |
                      |    ||    |
                      |    ||    |
======================|    ||    |
\\                    /|    ||    |
 \\_________________ / ||--------||
   |               |  ||        ||
   |               |  ||        ||
   |    o  o       |  ||        ||
   |    O  ^       |  ||        ||
___|___/|__|_______|__||________||
EOC

foreach (@to_elevator) {
    print $_, "\n";
    $_ = $_ =~ s/"""/$color_yellow"""$color_none/r;
}

@last_elevator = split "==\n" , <<EOC;
   ____    ____    ____    ____                ____   ____
  |Lab0|  |Lab1|  |Lab2|  |Lab3|         _    |Lab4| |Lab5|
  |_ __|  |_ __|  |_ __|  |_ __|  _     [E]   |_ __| |_ __|
 ___||______||______||______||___[E]____| |______||_____||__
|____ _______ _______ ______ ______@______ ______ ______ __|
   _| |_   _| |_   _| |_  _| |_  _| |_  _| |_  _| |_  _| |_
  |Lab6 | |Lab7 | |Lab8 ||Lab9 ||LabA ||LabB ||LabC ||LabD |
  |_____| |_____| |_____||_____||_____||_____||_____||_____|
==
   ____    ____    ____    ____                ____   ____
  |Lab0|  |Lab1|  |Lab2|  |Lab3|         _    |Lab4| |Lab5|
  |_ __|  |_ __|  |_ __|  |_ __|  _     [E]   |_ __| |_ __|
 ___||______||______||______||___[E]____| |______||_____||__
|____ _______ _______ ______ ______ _____@ ______ ______ __|
   _| |_   _| |_   _| |_  _| |_  _| |_  _| |_  _| |_  _| |_
  |Lab6 | |Lab7 | |Lab8 ||Lab9 ||LabA ||LabB ||LabC ||LabD |
  |_____| |_____| |_____||_____||_____||_____||_____||_____|
==
   ____    ____    ____    ____                ____   ____
  |Lab0|  |Lab1|  |Lab2|  |Lab3|         _    |Lab4| |Lab5|
  |_ __|  |_ __|  |_ __|  |_ __|  _     [E]   |_ __| |_ __|
 ___||______||______||______||___[E]____|@|______||_____||__
|____ _______ _______ ______ ______ ______ ______ ______ __|
   _| |_   _| |_   _| |_  _| |_  _| |_  _| |_  _| |_  _| |_
  |Lab6 | |Lab7 | |Lab8 ||Lab9 ||LabA ||LabB ||LabC ||LabD |
  |_____| |_____| |_____||_____||_____||_____||_____||_____|
==
--------
@   |  |
----|  |
    |  |
    |  |
    |  |
    |  |
    |  |
----|  |
    |  |
--------
==
--------
    |@ |
----|  |
    |  |
    |  |
    |  |
    |  |
    |  |
----|  |
    |  |
--------
==
--------
    |  |
----| @|
    |  |
    |  |
    |  |
    |  |
    |  |
----|  |
    |  |
--------
==
--------
    |  |
----|  |
    |  |
    | @|
    |  |
    |  |
    |  |
----|  |
    |  |
--------
==
--------
    |  |
----|  |
    |  |
    |  |
    |  |
    | @|
    |  |
----|  |
    |  |
--------
==
--------
    |  |
----|  |
    |  |
    |  |
    |  |
    |  |
    |  |
----|  |
    | @|
--------
==
--------
    |  |
----|  |
    |  |
    |  |
    |  |
    |  |
    |  |
----|  |
@   |  |
--------
EOC
