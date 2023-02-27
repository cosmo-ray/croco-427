#!/usr/bin/perl

# perl stuff:
#	uppercase: uc
#	lowercase: lc
#	lowercase first char: lcfirst (exist with uc too)
#	chomp: rm trailling whitespace

my $cur_txt_img;
my $cur_cnt;

my $original_time;
my $time_acc;

my $pc;
my $enemy;

my $fight_menu;

my $cur_geko;

my $le_mod;

sub make_pj_info
{
    my $ret = "HP: " . Yirl::yeGetInt(Yirl::yeGet($pc, "life")) . "\n";

    return $ret;
}

sub show_cur_geko
{
    $life = $_[0];

    my $color_yellow="\033[33m";
    my $color_red="\033[31m";
    my $color_none="\033[0m";

    if (Yirl::yeIntInfTo($life, 4)) {
	Yirl::yeReCreateString($color_red.$cur_geko, $cur_txt_img, "text");
    } elsif (Yirl::yeIntInfTo($life, 7)) {
	Yirl::yeReCreateString($color_yellow.$cur_geko, $cur_txt_img, "text");
    } else {
	Yirl::yeReCreateString($cur_geko, $cur_txt_img, "text");
    }
}

sub attack
{
    my $atk = Yirl::yeGetIntAt(Yirl::yeGet($pc, "stats"), "strength");
    my $life = Yirl::yeGet($enemy, "life");

    Yirl::yeAddInt($life, -$atk);

    if (Yirl::yeIntInfTo($life, 0)) {
	my $xp = Yirl::yeGet($pc, "xp");
	my $tot_xp = Yirl::yeGet($cur_cnt, "totxp");

	Yirl::yeAddInt($tot_xp, 3);
	Yirl::yeAddInt($xp, 3);
	goto_basement();
    } else {
	show_cur_geko($life);
	Yirl::ywSetTurnLengthOverwrite(200000);
	Yirl::yeCreateFunction("fight_action", $cur_cnt, "action");
	Yirl::yeSetInt($pc_timer, 0);
    }
}

sub lab
{
    my $whichlab = $_[2];

    print "--lab--\n";
    Yirl::yePrint($whichlab);

    $fight_menu = Yirl::yaeString(
	make_pj_info(),
	Yirl::yaeString(
	    "rgba: 155 255 155 255",
	    Yirl::yaeString("menu", Yirl::yeCreateArray(), "<type>"),
	    "background"),
	"pre-text");

    Yirl::ywMenuPushEntry($fight_menu, "attack", Yirl::ygGet("croco-427.attack"));
    Yirl::ywMenuPushEntry($fight_menu, "use item");
    Yirl::yePushBack($cur_cnt, $fight_menu,  "__fightmenu");
    $enemy_timer = Yirl::yeReCreateInt(0, $cur_cnt, "enemytime");
    $pc_timer = Yirl::yeReCreateInt(0, $cur_cnt, "pctimer");
    $enemy = Yirl::yeReCreateArray($cur_cnt, "enemy");
    my $ehp = 9 + rand(10);
    Yirl::yeCreateInt($ehp, $enemy, "life");
    my $estr = 1 + rand(5);
    Yirl::yaeInt(1 + rand(2),
		 Yirl::yaeInt($estr, Yirl::yeCreateArray($enemy, "stats"), "strength"),
		 "agility");

    if ($ehp > 14 && $estr > 3) {
	$cur_geko = $monster_geko;
    } elsif ($ehp > 14) {
	$cur_geko = $fat_geko;
    } elsif ($estr > 3) {
	$cur_geko = $str_geko;
    } else {
	$cur_geko = $geko;
    }
    Yirl::yeReCreateString($cur_geko, $cur_txt_img, "text");

    Yirl::ywSetTurnLengthOverwrite(200000);
    Yirl::yeCreateFunction("fight_action", $cur_cnt, "action");
    print "--lab--\n";
    Yirl::yePrint($enemy);
}

sub enemy_atk
{
    Yirl::yeAddInt($enemy_timer, 1);
    print "enemy_atk\n";
    if (Yirl::yeIntSupTo($enemy_timer, 108)) {
	Yirl::yeCreateFunction("fight_action", $cur_cnt, "action");
	Yirl::yeRemoveChildByStr($cur_cnt, "action");
	show_cur_geko Yirl::yeGet($enemy, "life");
	Yirl::yeSetInt($enemy_timer, 0);
	my $life = Yirl::yeGet($pc, "life");
	if (Yirl::yeIntInfTo($life, 1)) {
	    print("YOU LOSE !!!!!!\n");
	    if (Yirl::yeGet($cur_cnt, "die")) {
                Yirl::yesCall(Yirl::yeGet($cur_cnt, "die"), $cur_cnt);
            } else {
                Yirl::yesCall(Yirl::ygGet('FinishGame'));
	    }
	}
    }
}

sub fight_action
{
    print("we are fighting dreamer\n");
    Yirl::yeAddInt($pc_timer, 4);
    Yirl::yeAddInt($enemy_timer, 2);
    Yirl::yePrint($pc_timer);
    Yirl::yePrint($enemy_timer);
    my $enemyt = Yirl::yeGetInt($enemy_timer);
    my $pct = Yirl::yeGetInt($pc_timer);
    if ($pct < 100) {
	my $str = make_pj_info() . "Getting ready to attack\n";

	for (my $i = 0; $i <= 100; $i += 5) {
	    if ($i < $pct) {
		$str = $str . '#';
	    } else {
		$str = $str . '-';
	    }
	}
	Yirl::ywReplaceEntry2(
	    $cur_cnt,
	    Yirl::yaeString("rgba: 255 155 155 255",
			    Yirl::ywTextScreenNew($str),
			    "background"),
	    1);
    } else {
	Yirl::ywReplaceEntry2($cur_cnt, $fight_menu, 1);
	Yirl::ywSetTurnLengthOverwrite(0);
	Yirl::yeRemoveChildByStr($cur_cnt, "action");
	return 0;
    }
    if ($enemyt > 99) {
	my $color_red="\033[31m";
	Yirl::yeReCreateString($color_red.$scratch, $cur_txt_img, "text");
	Yirl::yeRemoveChildByStr($cur_cnt, "action");
	Yirl::yeCreateFunction("enemy_atk", $cur_cnt, "action");
	my $atk = Yirl::yeGetIntAt(Yirl::yeGet($enemy, "stats"), "strength");
	my $life = Yirl::yeGet($pc, "life");

	Yirl::yeAddInt($life, -$atk);
	Yirl::ywReplaceEntry2(
	    $cur_cnt,
	    Yirl::yaeString("rgba: 255 155 155 255",
			    Yirl::ywTextScreenNew(Yirl::yeGetString(Yirl::yeGet($pc, "name")). " got domages for ". $atk),
			    "background"),
	    1);
    }
    print("pct: ", $pct, "\n");
    return 0
}

sub enter_action
{
    my $SLIDE_L = 550000;
    $next_acc = $time_acc + Yirl::ywidGetTurnTimer();
    $sld_pos = $time_acc / $SLIDE_L;
    $sld_true_pos = $next_acc / $SLIDE_L;
    $nb_slide=scalar @door_open;

    if ($sld_true_pos != $sld_pos and $sld_true_pos < $nb_slide) {
	Yirl::yeReCreateString(@door_open[$sld_true_pos], $cur_txt_img, "text");
	if (int($sld_true_pos) == 7) {
	    Yirl::ywReplaceEntry2(
		$cur_cnt,
		Yirl::yaeString("rgba: 255 155 155 255",
				Yirl::ywTextScreenNew("You: so, what now ?"),
				"background"),
		1);

	} elsif (int($sld_true_pos) == 11) {
	    Yirl::ywReplaceEntry2(
		$cur_cnt,
		Yirl::yaeString("rgba: 155 255 155 255",
				Yirl::ywTextScreenNew("Akira: look, a map"),
				"background"),
		1);

	} elsif (int($sld_true_pos) == 14) {
	    Yirl::ywReplaceEntry2(
		$cur_cnt,
		Yirl::yaeString("rgba: 155 155 155 255",
				Yirl::ywTextScreenNew("going to the map..."),
				"background"),
		1);
	}
    } elsif (int($sld_true_pos) == $nb_slide) {
	    Yirl::ywReplaceEntry2($cur_cnt, $map_dialogue, 1);
	    Yirl::yeRemoveChildByStr($cur_cnt, "action");
    }
    $time_acc = $next_acc;
}

sub goto_basement
{
    $basement_wid = Yirl::yeCreateArray();
    Yirl::yePushBack($basement_wid, $basement_dialogue, "dialogue");
    Yirl::yeCreateString("dialogue", $basement_wid, "<type>");
    Yirl::yeCreateInt(20, $basement_wid, "txt-size");
    Yirl::yeReCreateString($lab_map, $cur_txt_img, "text");
    Yirl::ywReplaceEntry2($cur_cnt, $basement_wid, 1);
}
sub in_elevator
{
    my $SLIDE_L = 550000;
    $next_acc = $time_acc + Yirl::ywidGetTurnTimer();
    $sld_pos = $time_acc / $SLIDE_L;
    $sld_true_pos = $next_acc / $SLIDE_L;
    $nb_slide=scalar @to_elevator;

    if ($sld_true_pos != $sld_pos and $sld_true_pos < $nb_slide) {
	Yirl::yeReCreateString(@to_elevator[$sld_true_pos], $cur_txt_img, "text");
	if (int($sld_true_pos) == 0) {
	    Yirl::ywReplaceEntry2(
		$cur_cnt,
		Yirl::yaeString("rgba: 155 155 155 255",
				Yirl::ywTextScreenNew("You push the button"),
				"background"),
		1);

	}
    } elsif (int($sld_true_pos) == $nb_slide) {
	Yirl::yeRemoveChildByStr($cur_cnt, "action");
	goto_basement
    }
    $time_acc = $next_acc;
}

sub goto_elevator
{
    Yirl::yeCreateFunction("in_elevator", $cur_cnt, "action");
    Yirl::ywSetTurnLengthOverwrite(-1);
    $time_acc = 0;
}

sub look_entrance
{
    my $SLIDE_L = 600000;
    $next_acc = $time_acc + Yirl::ywidGetTurnTimer();
    $sld_pos = $time_acc / $SLIDE_L;
    $sld_true_pos = $next_acc / $SLIDE_L;
    $nb_slide=scalar @look_entrance;

    if ($sld_true_pos != $sld_pos and $sld_true_pos < $nb_slide) {
	Yirl::yeReCreateString(@look_entrance[$sld_true_pos], $cur_txt_img, "text");
	if (int($sld_true_pos) == 2) {
	    Yirl::ywReplaceEntry2(
		$cur_cnt,
		Yirl::yaeString("rgba: 255 155 155 255",
				Yirl::ywTextScreenNew("You: looking for nude photo are you ?"),
				"background"),
		1);

	}
    } elsif (int($sld_true_pos) == $nb_slide) {
	    Yirl::ywReplaceEntry2($cur_cnt, $entrance_dialogue, 1);
	    Yirl::yeRemoveChildByStr($cur_cnt, "action");
	    Yirl::yePrint($entrance_dialogue)
    }
    $time_acc = $next_acc;
}

sub look_entrance_init
{
    Yirl::yeCreateFunction("look_entrance", $cur_cnt, "action");
    Yirl::ywSetTurnLengthOverwrite(-1);
    $time_acc = 0;
}

sub console_action
{
    my $input_wid = $_[0];
    my $txt = Yirl::yeGetString($_[1]);
    my $container = $_[2];

    Yirl::yesCall(Yirl::ygGet("text_input_reset"), $input_wid);

    if (uc($txt) eq "HELP") {
	Yirl::yeReCreateString($console_help, $cur_txt_img, "text");
    } elsif (uc($txt) eq "DRAW") {
	Yirl::yeReCreateString($console_draw, $cur_txt_img, "text");
    } elsif (uc($txt) eq "OPEN") {
	Yirl::yeReCreateString($door_open[0], $cur_txt_img, "text");
	Yirl::ywReplaceEntry2(
	    $cur_cnt,
	    Yirl::yaeString("rgba: 155 155 155 255",
			    Yirl::ywTextScreenNew("doors are open..."),
			    "background"),
	    1);
	Yirl::yeCreateFunction("enter_action", $cur_cnt, "action");
	Yirl::ywSetTurnLengthOverwrite(-1);
	$time_acc = 0;
    } else {
	Yirl::yeReCreateString($console_unknow, $cur_txt_img, "text");
    }
    return 1;
}

sub do_console
{
    $wid = $_[0];

    Yirl::yeReCreateString($console, $cur_txt_img, "text");
    Yirl::ywReplaceEntry2(
	$cur_cnt,
	Yirl::yaeString(
	    "croco-427.console-text-input",
	    Yirl::yaeString(
		"nextOnKeyDown",
		Yirl::yaeString(
		    "rgba: 155 255 155 255",
		    Yirl::ywTextScreenNew("What is this machinery ?"),
		    "background"),
		"action"),
	    "next"),
	1);
    return 1;
}

sub widget_init
{
    $wid = $_[0];
    print "widget_init !!!!!!\n";
    do "./story.pl";
    print $door;
    print $test;
    $entries = Yirl::yeCreateArray($wid, "entries");
    $txt_img = Yirl::yeCreateArray($entries);
    $cur_cnt = $wid;
    $cur_txt_img = $txt_img;
    $basement_dialogue = Yirl::ygFileToEnt(0, "./basement-dialoue.json");
    Yirl::yePrint($basement_dialogue);
    Yirl::yeCreateInt(0, $wid, "totxp"); # total xp win
    Yirl::yeCreateInt(1, $wid, "current");
    Yirl::yePushBack($wid, $map_dialogue, "=map=dia");
    Yirl::yePushBack($wid, $basement_dialogue, "=bas=dia");
    Yirl::yePushBack($wid, $entrance_dialogue, "=entrance=dia");
    #Yirl::yePushBack($entries, $door_dialogue);
    #Yirl::yePushBack($entries, $map_dialogue);
    Yirl::yePushBack($entries, $entrance_dialogue);
    Yirl::yeCreateString("text-screen", $txt_img, "<type>");
    Yirl::yaeString(
	"rgba: 0 0 0 200",
	Yirl::yaeInt(4, Yirl::yeCreateArray($txt_img, "margin"), "size"),
	"color");

    # to remove
    # goto_basement

    Yirl::yeCreateString($door, $txt_img, "text");
    Yirl::yeCreateString("rgba: 255 255 255 255", $wid, "background");
    Yirl::yeCreateString("horizontal", $wid, "cnt-type");
    Yirl::yeCreateInt(70, $txt_img, "size");
    $pc = Yirl::yeGet($wid, "pc");
    if (!$pc) {
	$pc = Yirl::yaeInt(
	    0, Yirl::yaeInt(
		13, Yirl::yaeInt(
		    13, Yirl::yeCreateArray($wid, "pc"),
		    "life"),
		"max_life"),
	    "xp");

	Yirl::yeCreateString("Ji", $pc, "name");
	my $stats = Yirl::yeCreateArray($pc, "stats");
	Yirl::yeCreateInt(0, $stats, "charm");
	Yirl::yeCreateInt(4, $stats, "smart");
	Yirl::yeCreateInt(4, $stats, "agility");
	Yirl::yeCreateInt(4, $stats, "strength");
	Yirl::yePrint($pc);
	print("NEED NEW PC\n");
    }

    Yirl::yePushBack($le_mod, $wid, "main_wid");
    $ret = Yirl::ywidNewWidget($wid, "container");
    return $ret;
}

sub mod_init
{
    $mod = $_[0];
    print("in mod !\n");
    $callback = Yirl::yeCreateFunction("widget_init");
    print("UwU !\n");
    $pl = Yirl::yeCreateArray($mod, "pre-load");
    $pls = Yirl::yeCreateArray($pl);
    Yirl::yeCreateString("YIRL_MODULES_PATH/dialogue/", $pls, "path");
    Yirl::yeCreateString("module", $pls, "type");
    $pls = Yirl::yeCreateArray($pl);
    Yirl::yeCreateString("YIRL_MODULES_PATH/TextInput/", $pls, "path");
    Yirl::yeCreateString("module", $pls, "type");

    Yirl::yeCreateFunction("lab", $mod, "lab");
    Yirl::yeCreateFunction("do_console", $mod, "do_console");
    Yirl::yeCreateFunction("goto_elevator", $mod, "goto_elevator");
    Yirl::yeCreateFunction("attack", $mod, "attack");
    Yirl::yeCreateFunction("look_entrance_init", $mod, "look_entrance_init");

    $input = Yirl::yaeString(
	"text-input",
	Yirl::yeCreateArray($mod, "console-text-input"),
	"<type>"
	);
    Yirl::yaeInt(4, Yirl::yeCreateArray($input, "margin"), "size"),
    Yirl::yeCreateFunction("console_action", $input, "on-enter");
    Yirl::ygInitWidgetModule($mod, "croco-427", $callback);
    #need a destroy callback that rest that.
    $original_time = Yirl::ywGetTurnLengthOverwrite();

    Yirl::ywSetTurnLengthOverwrite(0);
    $le_mod = $mod;
    return $mod;
}


