#!/usr/bin/perl

# perl stuff:
#	uppercase: uc
#	lowercase: lc
#	lowercase first char: lcfirst (exist with uc too)
#	chomp: rm trailling whitespace

my $cur_txt_img;

sub change_img
{
    $wid = $_[0];
    $arg1 = $_[1];
    $arg2 = $_[2];
    $arg3 = $_[3];

    print("-------------------===========-----------------------\n");
    Yirl::yePrint($wid);
    print("=arg1=\n");
    Yirl::yePrint($arg1);
    print("=arg2=\n");
    Yirl::yePrint($arg2);
    print("=arg3=\n");
    Yirl::yePrint($arg3);
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
    $cur_txt_img = $txt_img;
    Yirl::yeCreateInt(1, $wid, "current");
    Yirl::yePushBack($entries, $door_dialogue);
    Yirl::yeCreateString("text-screen", $txt_img, "<type>");
    Yirl::yeCreateString($door, $txt_img, "text");
    Yirl::yeCreateString("rgba: 255 255 255 255", $txt_img, "background");
    Yirl::yeCreateString("horizontal", $wid, "cnt-type");
    Yirl::yeCreateInt(70, $txt_img, "size");
    #Yirl::yePrint($wid);
    #Yirl::yePrint($wid);
    $ret = Yirl::ywidNewWidget($wid, "container");
    #Yirl::yePrint($wid);
    return ($ret);
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

    Yirl::yeCreateFunction("change_img", $mod, "change_img");

    Yirl::ygInitWidgetModule($mod, "croco-427", $callback);
    Yirl::yePrint($mod);
    return $mod;
}


