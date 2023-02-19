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

sub enter_action
{
    if ($time_acc eq 0) {
	$time_acc = 1;
	return
    }
    my $SLIDE_L = 1000000;
    $next_acc = $time_acc + Yirl::ywidGetTurnTimer();
    $sld_pos = $time_acc / $SLIDE_L;
    $sld_true_pos = $next_acc / $SLIDE_L;
    $nb_slide=scalar @door_open;

    if ($sld_true_pos != $sld_pos and $sld_true_pos < $nb_slide) {
	Yirl::yeReCreateString(@door_open[$sld_true_pos], $cur_txt_img, "text");
	if (int($sld_true_pos) == 5) {
	    Yirl::ywReplaceEntry2(
		$cur_cnt,
		Yirl::yaeString("rgba: 255 155 155 255",
				Yirl::ywTextScreenNew("You: so, what now ?"),
				"background"),
		1);

	} elsif (int($sld_true_pos) == 6) {
	    Yirl::ywReplaceEntry2(
		$cur_cnt,
		Yirl::yaeString("rgba: 155 255 155 255",
				Yirl::ywTextScreenNew("Akira: look, a map"),
				"background"),
		1);
	} elsif (int($sld_true_pos) == $nb_slide - 1) {
	    print("BEGIN YOOOOOOO ? \n");
	    Yirl::yePrint($map_dialogue);
	    print("END YOOOOOOO ? \n");
	    Yirl::ywReplaceEntry2($cur_cnt, $map_dialogue, 1);
	    Yirl::yeRemoveChildByStr($cur_cnt, "action");
	}
    }
    $time_acc = $next_acc;
}

sub console_action
{
    my $input_wid = $_[0];
    my $txt = Yirl::yeGetString($_[1]);
    my $container = $_[2];

    #Yirl::yePrint($input_wid);
    #print($txt . "\n");
    Yirl::yesCall(Yirl::ygGet("text_input_reset"), $input_wid);
    print "-----\n";
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
    print("-------------------===========-----------------------\n");
    Yirl::ywReplaceEntry2(
	$cur_cnt,
	Yirl::yaeString(
	    "croco-427.console-text-input",
	    Yirl::yaeString(
		"nextOnKeyDown",
		Yirl::yaeString(
		    "rgba: 155 155 155 255",
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
    Yirl::yeCreateInt(1, $wid, "current");
    Yirl::yePushBack($entries, $door_dialogue);
    Yirl::yeCreateString("text-screen", $txt_img, "<type>");
    Yirl::yaeString(
	"rgba: 0 0 0 200",
	Yirl::yaeInt(4, Yirl::yeCreateArray($txt_img, "margin"), "size"),
	"color");
    Yirl::yeCreateString($door, $txt_img, "text");
    Yirl::yeCreateString("rgba: 255 255 255 255", $wid, "background");
    Yirl::yeCreateString("horizontal", $wid, "cnt-type");
    Yirl::yeCreateInt(70, $txt_img, "size");
    #Yirl::yePrint($wid);
    #Yirl::yePrint($wid);
    $ret = Yirl::ywidNewWidget($wid, "container");
    #Yirl::yePrint($wid);
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

    Yirl::yeCreateFunction("do_console", $mod, "do_console");

    $input = Yirl::yaeString(
	"text-input",
	Yirl::yeCreateArray($mod, "console-text-input"),
	"<type>"
	);
    Yirl::yeCreateFunction("console_action", $input, "on-enter");
    Yirl::ygInitWidgetModule($mod, "croco-427", $callback);
    #need a destroy callback that rest that.
    $original_time = Yirl::ywGetTurnLengthOverwrite();

    Yirl::ywSetTurnLengthOverwrite(0);
    return $mod;
}


