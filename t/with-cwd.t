#!/usr/bin/perl
# vi: set ts=4 sw=4 :

use warnings;
use strict;

use Test::More tests => 5;

my $out;

$out = `with-cwd /bin pwd`;
is $out, "/bin\n", "changes to the specified directory";

$out = `with-cwd /bin echo true`;
is $out, "true\n", "echo works";

$out = `with-cwd does-not-exist echo true`;
isnt $?, 0, "fails if the directory doesn't exist";
is $out, "", "doesn't run if the cd failed";

$out = `with-cwd /bin bash -c 'echo 2=["\$1"]' 'first arg' 'second arg'`;
is $out, "2=[second arg]\n", "passes through args intact";

