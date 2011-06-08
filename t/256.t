#!/usr/bin/perl
# vi: set ts=4 sw=4 :

use warnings;
use strict;

use Test::More tests => 2;

my $out = `256`;

is length($out), 256, "outuput is of the correct length";

my $want = join "", map { chr($_) } 0..255;
is $out, $want, "content is correct";

