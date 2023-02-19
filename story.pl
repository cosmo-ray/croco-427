print "sprites: \n";
do "./sprites.pl";

print "done\n";
$door_dialogue = Yirl::yeCreateArray();
Yirl::yeCreateString("rgba: 255 255 255 255", $door_dialogue, "background");
Yirl::yeCreateString("dialogue", $door_dialogue, "<type>");
Yirl::yeCreateInt(20, $door_dialogue, "txt-size");
Yirl::yeCreateInt(1, $door_dialogue, "is_looner_dialogue");
$door_dialogue_2 = Yirl::yeCreateArray($door_dialogue, "dialogue");
Yirl::yeCreateString("what to do", $door_dialogue_2, "text");
$answers = Yirl::yeCreateArray($door_dialogue_2, "answers");

$answer = Yirl::yeCreateArray($answers);
Yirl::yeCreateString("Go to the console", $answer, "text");
$new_txt = Yirl::yeCreateArray($answer, "action");
Yirl::yeCreateString("croco-427.do_console", $new_txt);
Yirl::yeCreateInt(10, $new_txt);

$answer = Yirl::yeCreateArray($answers);
Yirl::yeCreateString("Look at the door", $answer, "text");
$new_txt = Yirl::yeCreateArray($answer, "action");
Yirl::yeCreateString("Dialogue.change-text", $new_txt);
Yirl::yeCreateString("The door look doorestque", $new_txt);

$map_dialogue = Yirl::yeCreateArray();
Yirl::yeCreateString("rgba: 255 255 255 255", $map_dialogue, "background");
Yirl::yeCreateString("dialogue", $map_dialogue, "<type>");
Yirl::yeCreateInt(20, $map_dialogue, "txt-size");
Yirl::yeCreateInt(1, $map_dialogue, "is_looner_dialogue");
$map_dialogue_2 = Yirl::yeCreateArray($map_dialogue, "dialogue");
Yirl::yeCreateString("Akira: where should we go ?", $map_dialogue_2, "text");
$answers = Yirl::yeCreateArray($map_dialogue_2, "answers");

$answer = Yirl::yeCreateArray($answers);
Yirl::yeCreateString("let's look at the Small room on the right", $answer, "text");
$new_txt = Yirl::yeCreateArray($answer, "action");
Yirl::yeCreateString("Dialogue.change-text", $new_txt);
Yirl::yeCreateString("The door seems broken", $new_txt);

$answer = Yirl::yeCreateArray($answers);
Yirl::yeCreateString("Go to the elevator", $answer, "text");
$new_txt = Yirl::yeCreateArray($answer, "action");
Yirl::yeCreateString("Dialogue.change-text", $new_txt);
Yirl::yeCreateString("TODO", $new_txt);