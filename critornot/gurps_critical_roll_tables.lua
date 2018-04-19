function format_num_for_tex(x)
  return tostring(x)
end

function strdiceroll(tobeat, d)
  d = d or diceroll()
  tobeat = tobeat or 10
  if tobeat < 15 then
    tocrit = 4
  elseif tobeat == 15 then
    tocrit = 5
  elseif tobeat > 15 then
    tocrit = 6
  end

  if d >= tobeat + 10 or d > 17 then
    return [[\critfail{]] .. format_num_for_tex(d) .. "}"
  elseif tobeat < 16 and d > 16 then
    return [[\critfail{]] .. format_num_for_tex(d) .. "}"
  elseif d <= tocrit then
    return [[\critpass{]] .. format_num_for_tex(d) .. "}"
  elseif d > tobeat then
    return [[\fail{]] .. format_num_for_tex(d) .. "}"
  else
    return [[\pass{]] .. format_num_for_tex(d) .. "}"
  end
end

function printcrittable(min, max)
  -- tex.sprint([[\begin{verbatim}]])
  tablespec = "l@{ }r@{}c"
  for i=3,18,1 do
    tablespec = tablespec .. "@{ }c"
  end

  s = ""

  s = s .. [[\noindent]]
  s = s .. [[\begin{tabular}{]] .. tablespec .. [[}]]

  -- for i=1,18,1 do
  --   s = s .. " & "
  -- end
  s = s .. [[\multicolumn{18}{c}{\gurps critical roll table}]]
  for i=min,max,1 do
    if i ~= 17 then
      s = s .. [[\\ Level: & \textbf{]] .. i .. [[} &]]
    else
      s = s .. [[\\ Level: & \textbf{]] .. i .. [[} &+]]
    end
    for roll=3,18,1 do
      s = s .. "& " .. strdiceroll(i, roll)
    end
  end

  s = s .. [[\end{tabular}]]
  tex.sprint(s)
end
