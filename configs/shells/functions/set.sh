function set_flutter {
	# Fix path not found in editors, e.g. VSCode
	if command -v flutter >/dev/null; then
		if mise which flutter 1>/dev/null 2>/dev/null; then
			export FLUTTER_ROOT="$(mise where flutter)"
		fi
	fi
}
