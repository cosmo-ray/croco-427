#!/usr/bin/perl

# perl stuff:
#	uppercase: uc
#	lowercase: lc
#	lowercase first char: lcfirst (exist with uc too)
#	chomp: rm trailling whitespace

my $cur_txt_img;
my $cur_cnt;

sub console_action
{
    my $input_wid = $_[0];
    my $txt = Yirl::yeGetString($_[1]);
    my $container = $_[2];

    #Yirl::yePrint($input_wid);
    #print($txt . "\n");
    Yirl::yePrint(Yirl::ywCntGetEntry($container, 0));
    Yirl::yesCall(Yirl::ygGet("text_input_reset"), $input_wid);
    print "-----\n";
    if (uc($txt) eq "HELP") {
	Yirl::yeReCreateString($console_help, $cur_txt_img, "text");
    } elsif (uc($txt) eq "DRAW") {
	Yirl::yeReCreateString($console_draw, $cur_txt_img, "text");
    } else {
	Yirl::yeReCreateString($console_unknow, $cur_txt_img, "text");
    }
    print "--oo--\n";
    return 1;
}

sub do_console
{
    $wid = $_[0];

    Yirl::yeReCreateString($console, $cur_txt_img, "text");
    print("-------------------===========-----------------------\n");
    Yirl::yePrint($wid);
    print("= new ts =\n");
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
    do "/usr/share/cows/kitty.cow";
    $thoughts='o';
    print $the_cow;
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
    Yirl::yePrint($mod);
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
    Yirl::yePrint($mod);
    return $mod;
}


