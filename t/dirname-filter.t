#!/usr/bin/perl
# vi: set ts=4 sw=4 :

use warnings;
use strict;

use Test::More tests => 1;

my $out;

$out = get_output(qw(
	file
	dir/file
	.
	..
	/path/to/foo
	/
));

my @want = qw(
	.
	dir
	.
	.
	/path/to
	/
);

is_deeply $out, \@want, "simple";

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
		exec "dirname-filter";
		die $!;
	}

	close $w;
	my @out = <$r>;
	chomp @out;
	return \@out;
}

