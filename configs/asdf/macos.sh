local plugin_list=(
	'firebase'
	'flutter'
	'golang'
	'hugo https://github.com/Edditoria/asdf-hugo.git'
	'nodejs'
	'python'
	'rust'
	'shellcheck'
	'shfmt'
)

# NOTE: init_install_list !== .tool-versions
local init_install_list=(
	'firebase latest'
	'flutter latest'
	'golang latest'
	'hugo latest:extended'
	'python 3.10'
	'python 2.7'
	'rust stable'
	'shellcheck latest'
	'shfmt latest'
)
# 'nodejs lts' # Instead, handle by setup_asdf_nodejs.sh

local asdf_updates_disabled=true
