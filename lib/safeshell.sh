safe_pathname() {
	local PATHNAME="$1"

	# If it starts with "-", prefix with "./"
	PATHNAME="${PATHNAME/#-/./-}"

	echo -n "$PATHNAME"
}

abs_pathname() {
	local PATHNAME="$1"
	local BASE_DIR="${2:-$PWD}"

	# If it's not absolute, make it so
	case "$PATHNAME" in
		/*) ;;
		*) PATHNAME="$BASE_DIR/$PATHNAME" ;;
	esac

	echo -n "$PATHNAME"
}

