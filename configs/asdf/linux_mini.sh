local plugin_list=(
	'deno'
	'golang'
	'nodejs'
)

# NOTE: init_install_list !== .tool-versions
local init_install_list=(
	'deno latest'
	'golang latest'
	'nodejs lts'
)

local asdf_updates_disabled=false
