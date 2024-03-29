local plugin_list=(
	'firebase'
	'flutter'
	'golang'
	'hugo'
	'nodejs'
	'python'
	'rust'
)

# NOTE: init_install_list !== .tool-versions
local init_install_list=(
	'firebase latest'
	'flutter latest'
	'golang latest'
	'hugo latest'
	'nodejs lts'
	'python 3.10'
	'python 2.7'
	'rust stable'
)
# 'nodejs lts-gallium' # and more: Handle by setup_asdf_nodejs.sh

local asdf_updates_disabled=true
