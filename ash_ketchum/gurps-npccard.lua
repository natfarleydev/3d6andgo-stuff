require("gurps_character.lua")

function tex_define_draw_pic()
  if cget('Character picture') then
    tex.sprint([[\def\drawpic{\draw (0,1.666) rectangle ++(1, 1.3) node[midway] {]]
        .. [[\includegraphics[width=1in]{]]
        .. cget('Character picture').value
        .. [[}};}]])
  else
    tex.sprint([[\def\drawpic{}]])
  end
end

-- From http://lua-users.org/wiki/SplitJoin
function strjoin(delimiter, list)
  local len = #list
  if len == 0 then
    return "" 
  end
  local string = list[1]
  for i = 2, len do 
    string = string .. delimiter .. list[i] 
  end
  return string
end

function print_with_filter(filter)
  make_inline_list(cfilter(filter))
end

function make_inline_list(arr)
  tex.sprint([[\makeatletter]])
  local tmp_tbl = {}
  for _,v in ipairs(arr) do
    table.insert(tmp_tbl, [[\gurps@char@print@attr{]] .. v.name .. "}")
  end
  tex.sprint(strjoin("; ", tmp_tbl))
  tex.sprint([[\makeatother]])
end
