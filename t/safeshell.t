#!/usr/bin/perl
# vi: set ts=4 sw=4 :

use warnings;
use strict;

use Test::More 0.94;
use Test::More tests => 2;

sub test {
	my ($func, $args, $expect, $name) = @_;

	my $qargs = '"$@"';
	open(my $fh, "-|",
		"bash", "-c", ". lib/safeshell.sh ; $func $qargs",
		"dummy", # why?
		@$args);
	my $out = do { local $/; <$fh> };
	close $fh;

	is $out, $expect, $name;
}

subtest "safe_pathname", sub {
	plan tests => 6;
	test("safe_pathname", [ "foo" ], "foo");
	test("safe_pathname", [ "./x" ], "./x"); 
	test("safe_pathname", [ "/usr/bin" ], "/usr/bin"); 
	test("safe_pathname", [ "-P" ], "./-P"); 
	test("safe_pathname", [ "/usr\n-P" ], "/usr\n-P"); 
	test("safe_pathname", [ "\n-P" ], "\n-P"); 
};

subtest "abs_pathname", sub {
	plan tests => 4;
	test("abs_pathname", [ "/etc/X11" ], "/etc/X11");
	test("abs_pathname", [ "/et\nc/X11" ], "/et\nc/X11");
	test("abs_pathname", [ "foo/bar" ], "$ENV{PWD}/foo/bar");
	test("abs_pathname", [ "foo/bar", "/etc" ], "/etc/foo/bar");
};

# eof safeshell.t
