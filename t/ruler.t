#!/usr/bin/perl
# vi: set ts=4 sw=4 :

use warnings;
use strict;

use Test::More tests => 20;

my $out;

my @first_20 = qw(
.
..
...
....
...._
...._.
...._..
...._...
...._....
...._...10
...._...10.
...._...10..
...._...10...
...._...10....
...._...10...._
...._...10...._.
...._...10...._..
...._...10...._...
...._...10...._....
...._...10...._...20
);

for my $i (1..20) {
	$out = `ruler $i`;
	is $out, $first_20[$i-1]."\n", "ruler $i";
}

