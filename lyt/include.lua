local List = require 'pandoc.List'

local include_auto = false
function get_vars (meta)
  if meta['include-auto'] then include_auto = true end
end

local transclude
function transclude (cb)
  -- ignore code blocks which are not of class "include"
  if not cb.classes:includes 'include' then return end

  local format = cb.attributes['format']
  local blocks = List:new()
  for line in cb.text:gmatch('[^\n]+') do
    if line:sub(1,2) ~= '//' then
      local fh = io.open(line)
      if not fh then
        io.stderr:write("cannot open file " .. line .. " | skipping includes\n")
      else
        local contents = pandoc.read(fh:read '*a', format).blocks
        contents = pandoc.walk_block(
          pandoc.Div(contents),{ CodeBlock = transclude }
        ).content
        blocks:extend(contents)
        fh:close()
      end
    end
  end
  return blocks
end

return {
  { Meta = get_vars },
  { CodeBlock = transclude }
}
