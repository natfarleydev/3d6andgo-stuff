function tex_set_card_name(name)
  tex.sprint([[\tikzsetnextfilename{card-]] .. name:gsub("[ ()]", "_") .. [[}]])
end
