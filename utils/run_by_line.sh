#!/usr/bin/env bash

function run_by_line {
	# Read a text file, and run a command line-by-line
	# - Any empty line will be ignored
	# - Any line beginning with "#" character will be ignored
	# - In each line, the characters after "#" will be ignored
	# Usage: run_by_line [command_prefix] <file>
	# credit: https://stackoverflow.com/questions/10929453/read-a-file-line-by-line-assigning-the-value-to-a-variable
	while read -r line || [[ -n "$line" ]]; do
		# ignore the line starting with "#", or empty line
		if [[ "$line" == \#* || -z "$line" ]]; then
			:
		else
			# cut out "# comments" from the list e.g. coffeescript # install first
			local this_line=$(echo $line | cut -d '#' -f 1)
			$1 $this_line
		fi
	done < "$2"
}
