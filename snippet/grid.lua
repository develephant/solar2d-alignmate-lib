## ...

woodTxt = Text.new({text = woodAmt, parent = view})
metalTxt = Text.new({text = metalAmt, parent = view})
concreteTxt = Text.new({text = concreteAmt, parent = view})

grid = { woodTxt, metalTxt, concreteTxt }

--Automatically creates a new group
local txtGrp = Alignmate.renderGrid(grid, 2, {boxWidth=140})

--Center it with an 80px top padding
Alignmate.center(txtGrp, {top=80})

## ...