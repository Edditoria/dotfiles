local plugin_list=(
	'deno'
	'golang'
	'nodejs'
	'shellcheck'
	'shfmt'
)

# NOTE: init_install_list !== .tool-versions
local init_install_list=(
	'deno latest'
	'golang latest'
	'nodejs latest'
	'shellcheck latest'
	'shfmt latest'
)

local asdf_updates_disabled=false
