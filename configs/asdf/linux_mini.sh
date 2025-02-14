local plugin_list=(
	'deno'
	'golang'
	'hugo https://github.com/Edditoria/asdf-hugo.git'
	'nodejs'
	'shellcheck'
	'shfmt'
)

# NOTE: init_install_list !== .tool-versions
local init_install_list=(
	'deno latest'
	'golang latest'
	'hugo latest:extended'
	'nodejs latest'
	'shellcheck latest'
	'shfmt latest'
)

local asdf_updates_disabled=false
