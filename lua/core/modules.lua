
local modules = require('core').modules


-- [ File Manager ] --

if modules.builtins.netrw then
  require('modules.base.netrw')
end

if modules.plugin.dashboard  then
  require('modules.plugin.dashboard')
end


if not modules.plugin.statusline then
  require('modules.base.statusline')
else
  require('modules.plugin.statusline')
end


