#!/usr/bin/perl
# vi: set ts=4 sw=4 :

use warnings;
use strict;

use Test::More tests => 2;

my $out;

$out = get_output(undef, qw( a b c c c d d e f f f f f f f f f g h h h h h h i ));
$out = join " ", @$out;
is $out, "a b c c c d d e f f f f f g h h h h h i", "uniqish 5 (default)";

$out = get_output(3, qw( a b c c c d d e f f f f f f f f f g h h h h h h i ));
$out = join " ", @$out;
is $out, "a b c c c d d e f f f g h h h i", "uniqish 3";

sub get_output {
	my ($n, @lines) = @_;

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
		my @args;
		push @args, "--lines", $n if defined $n;
		exec "uniqish", @args;
		die $!;
	}

	close $w;
	my @out = <$r>;
	chomp @out;

	return \@out;
}

