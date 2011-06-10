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

cat-range
	Output / concatenate byte-ranges of files

countpct
	Counts patterns on standard input (or from FILEs), showing counts of
	each, and as a percentage of the total.

	countpct [FILE ...]

	For each unique line seen, one line is printed to standard output,
	showing the percentage, count, and the line itself.  The output is
	unordered.

csort
	Exactly like "sort", but forces the locale to "C".

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

find-duplicates
	Simple duplicate file finder.  Just shows the names of files in
	duplicate-sets; doesn't (say) delete them.

	find-duplicates [FILE-OR-DIR ...]

find-path-conflicts
	Scans directories on your $PATH for executables; for each executable
	name found in more than one such directory, shows the executable name
	and the locations in which it was found.

git-clone-new-repos
	TODO

git-multi-pull
	Do a "git pull" on all git repositories found under DIRs (or "." by
	default).

	git-multi-pull [DIR ...]

git-push-new-repo
	TODO

git-push-to-empty-repo
	Given a local git repository with no "origin", and an empty remote
	bare repository, set up the remote as the origin of the local.

hgrep
	Colour-highlighting grep.  Unlike "grep --color", uses background
	colours instead of foreground, so I find it stands out better.

	tail ..... | hgrep [-a] -p PATTERN [-p PATTERN -p PATTERN ...]

linux26-diskstats-agent
	TODO

lsmod-graph
	Runs "lsmod", and outputs a "dot" graph of dependencies between
	modules.  e.g. "lsmod-graph | dot -Tpng -o lsmod.png"

randhex
	Pulls "N" bytes from /dev/random and shows them as lower case
	hexadecimal.

	randhex [N [separator]]

read-djbdns-ips
	Given some djbdns (dnscache/tinydns/axfrdns) logs on standard input,
	make each line a little more human-readable before echoing to standard
	output:
	- turns each IPv4 address into dot-quad notation
	- shows query type names (aaaa, etc)

read-nginx-timestamps
	Acts as a filter on the named FILEs, or standard input.  For each
	line, convert the timestamp (the number at the start of the line) to a
	human-readable timestamp.  If "-f" if specified, autoflush the output.

	read-nginx-timestamps [-f] [FILE ...]

realpath
	Perform realpath(3) translations

	realpath PATH ...
	realpath

	If one or more PATHs are specified, translate each PATH, showing the
	results one per line.

	If no PATHs are specified, then read PATHs from standard input, one
	per line, translate each PATH, and show each to standard output, one
	per line.

resize-logvol
	Helper script to resize a logical volume (which contains an ext2/ext3
	filesystem).

	resize-logvol LV SIZE

ruler
	Outputs a ruler (default: width of terminal), to help with counting
	characters.

sorted-terse-listing
	Somewhat like "find ... -ls", but always processes directory entries
	in a predictable order, and the output is more machine-readable.  Good
	for comparing two directory trees.

	sorted-terse-listing [PATH ...]

svstat-tidy
	Runs "svstat" (part of the daemontools suite), passing through
	whatever arguments were given to svstat-tidy, and reformats the output
	into a fixed-width style.

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

with-each-cwd
	For each directory listed, change to that directory then run some
	command.

	with-each-cwd [DIR ...] -- PROG [ARG ...]

xml-escape
xml-unescape
	Copies from standard input to standard output, applying/removing
	XML-escaping.

