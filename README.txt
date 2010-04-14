256
	echo all 256 bytes (00..FF) to standard output

add
	adds numbers, optionally also showing the mean average

	add [-a] -e [NUM ...]
	add [-a] [FILE ...]

	With -e, the numbers to add area specified on the command line.
	Without -e, the nubers are read from the given FILEs (or standard
	input if no files are specified, or if FILE is "-"), one per line.

add-dnscache-response-times
	given some dnscache logs (including the multilog "@HEX" timestamp) on
	standard input, annotate each "sent" line with the response time
	(timestamp difference between the 'sent' line and the corresponding
	'query' line).

basename-filter, dirname-filter
	For each line on standard input, perform "basename" or "dirname" and
	echo to standard output.

countpct
	Counts patterns on standard input (or from FILEs), showing counts of
	each, and as a percentage of the total.

	countpct [FILE ...]

	For each unique line seen, one line is printed to standard output,
	showing the percentage, count, and the line itself.  The output is
	unordered.

decode-base64, encode-base64
decode-mime-header, encode-mime-header
decode-quotedprintable, encode-quotedprintable
	Copies from standard input to standard output, applying the specified
	decode/encode.

dirname-filter
	See basename-filter.

encode-base64
encode-mime-header
encode-quotedprintable
	See decode-base64 / decode-mime-header / decode-quotedprintable.

git-push-new-repo
linux26-diskstats-agent

read-djbdns-ips
	Given some djbdns (dnscache/tinydns/axfrdns) logs on standard input,
	make each line a little more human-readable before echoing to standard
	output:
	- turns each IPv4 address into dot-quad notation
	- shows query type names (aaaa, etc)

read-nginx-timestamps

realpath
	Perform realpath(3) translations

	realpath PATH ...
	realpath

	If one or more PATHs are specified, translate each PATH, showing the
	results one per line.

	If no PATHs are specified, then read PATHs from standard input, one
	per line, translate each PATH, and show each to standard output, one
	per line.

uniqish
	uniqish - output only unique lines, more or less

	uniqish [--lines|-n COUNT] [FILE ...]

	Reads lines from the specified FILEs (or standard input, if no files
	are named).  Each line is copied to standard output, unless the last
	COUNT lines were all exactly the same as this one.  The default value
	for COUNT is 5.

uri-escape
uri-unescape
	Copies from standard input to standard output, applying/removing
	URI-escaping.

whichglob
	Show executables on your PATH which match a pattern.

	whichglob GLOB

	e.g.
	  whichglob '*wm*'
	shows executables on your PATH matching '*wm*', e.g. window managers.

with-cwd
	Change directory then run a program.

	with-cwd DIR PROG [ARG ...]

xml-escape
xml-unescape
	Copies from standard input to standard output, applying/removing
	XML-escaping.
