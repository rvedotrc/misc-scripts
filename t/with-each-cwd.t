#!/usr/bin/perl
# vi: set ts=4 sw=4 :

use warnings;
use strict;

use Test::More tests => 7;

use File::Basename 'dirname';
my $data = dirname(__FILE__)."/data";

chdir "$data/.." or die "chdir $data: $!";

my $out;
my $expect;

$out = `with-each-cwd -- pwd`;
is $out, "", "no dirs: command never runs";
is $?, 0, "no dirs: must succeed";

$out = `with-each-cwd data/one data/two data/one -- cat  file`;
is $out, "data/one\n1\ndata/two\n2\ndata/one\n1\n", "some dirs: outputs dir before each command";
is $?, 0, "no dirs: must succeed";

$out = `with-each-cwd data/one data/two -- true`;
is $?, 0, "normally succeeds";

$out = `with-each-cwd data/one data/does-not-exist -- true`;
isnt $?, 0, "fails if we can't cd to at least one dir";

$out = `with-each-cwd data/one data data/two -- cat file`;
isnt $?, 0, "fails if a command fails";

