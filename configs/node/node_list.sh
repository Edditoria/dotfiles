# Implement in functions/setup_asdf_nodejs and functions/setup_nvm
local node_list=(
	'lts/fermium'
	'lts/gallium'
)

# Implement in functions/setup_nvm
local alias_list=(
	'f lts/fermium'
	'g lts/gallium'
	'default g'
	'd default'
)

# Implement in functions/setup_asdf_nodejs
local default_node='lts-gallium'
