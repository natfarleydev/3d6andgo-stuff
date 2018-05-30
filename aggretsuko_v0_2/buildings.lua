function node_window_style(scaling)
  -- if math.random(6) == 6 then
  --   return "fill=yellow!80!black,inner sep=".. 0.25*scaling .. "ex"
  -- else
    return "fill=black!30,inner sep=".. 0.25*scaling .. "ex"
  -- end

end

function tree_decay_function(last_tree)
  local retval = 1 - math.exp(-last_tree*0.1)
  -- print("tree_decay_function returns " .. retval)
  return retval
end

-- How long ago was the last tree?
_GLASTTREE = 0
function set_last_tree(val)
  _GLASTTREE = val or 0
end

function add_to_last_tree()
  _GLASTTREE = _GLASTTREE + 1
end

function tex_tree(scale)
  s = [[\tikzsetnextfilename{tree}\begin{tikzpicture}[x=]] .. scale .. [[ex,y=]] .. scale .. [[ex]
    \draw[fill=brown] (-0.2,-1) rectangle (0.2,0.5);
    \draw[fill=green!90!black] (1,0) -- (0.5,1) -- (0.7,1) -- (0.3,2) -- (0.5,2) -- (0,3) -- (-0.5,2) -- (-0.3,2) -- (-0.7,1) -- (-0.5,1) -- (-1,0) -- cycle;
  \end{tikzpicture}]]
  tex.sprint(s)
end

function tex_building(i)
  -- print("")
  -- print("Creating building with " .. i .. " windows")
  -- print("")
  local imod3 = i % 3
  local idiv3 = i - imod3
  local rownum = idiv3/3
  local building_width = -1
  local building_center = -1
  if rownum + imod3 > 1 then
    building_width = 4
    building_center = 2
  else
    building_width = i + 1
    building_center = (i+1)/2
  end
  local s = [[\tikzsetnextfilename{building-]] .. i .. [[}]]

  local scaling = 0.65
  s = s .. [[\begin{tikzpicture}[x=]] .. scaling .. [[ex,y=]] .. scaling .. [[ex]
    \node[draw,inner sep=]] .. scaling*0.25 .. [[ex, minimum width=]] .. building_width*scaling .. [[ex, minimum height=]] .. (rownum + 2)*scaling .. [[ex,anchor=south,fill=black!10] at (]] .. building_center .. [[,0) {};
      ]]
  local j = 0
  local k = 0
  for j=1,3 do
    for k=1,rownum do
      s = s .. [[\node[]] .. node_window_style(scaling) .. [[] at (]]
        .. j .. "," .. k .. ") {};"
    end
  end
  if imod3 > 0 then
    k = rownum + 1
    for j=1,imod3 do
      s = s .. [[\node[fill=black!30,inner sep=]] .. scaling*0.25 .. [[ex] at (]]
        .. j .. "," .. k .. ") {};"
    end
  end
  s = s .. [[\end{tikzpicture}]]
  tex.print(s)
end
