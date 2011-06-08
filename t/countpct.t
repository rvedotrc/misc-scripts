#!/usr/bin/perl
# vi: set ts=4 sw=4 :

use warnings;
use strict;

use Test::More tests => 1;

my $out;

$out = get_output(qw( a b c c c d d e f f f f f f f f f g h h h h h h i ));

my $want = <<EOF;
   4.00%           1 a
   4.00%           1 b
   4.00%           1 e
   4.00%           1 g
   4.00%           1 i
   8.00%           2 d
  12.00%           3 c
  24.00%           6 h
  36.00%           9 f
EOF

is $out, $want, "simple";

sub get_output {
	my (@lines) = @_;

	open(my $fh, "+>", undef) or die $!;
	print $fh map { "$_\n" } @lines
		or die $!;
	seek($fh, 0, 0) or die $!;

	pipe(my $r, my $w) or die $!;

	defined(my $pid = fork) or die $!;

	if (not $pid) {
		close $r;
		open STDIN, "<&".fileno($fh) or die $!;
		open STDOUT, ">&".fileno($w) or die $!;
		exec "countpct | sort -k2n";
		die $!;
	}

	close $w;
	my $out = do { local $/; <$r> };
	return $out;
}

