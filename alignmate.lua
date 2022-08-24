--#############################################################################
--# Alignmate - Helper for aligning display objects
--#############################################################################
local _M = {}
_M.VERSION = '0.0.1'

local contentHeight = display.contentHeight
local contentWidth = display.contentWidth

local actualContentHeight = display.actualContentHeight
local actualContentWidth = display.actualContentWidth

local defaultPadding = 10

local defaultBoxHeight = 80
local defaultBoxWidth = 80

local gridRows = contentHeight / defaultBoxHeight
local gridCols = contentWidth / defaultBoxWidth

local function objInfo(obj)
  print("X: "..obj.x, "Y: "..obj.y)
  print("Width: "..obj.width, "Height: "..obj.height)
end

function _M.top(obj, opts)
  opts = opts or {}

  obj.x = display.contentCenterX
  obj.y = (obj.height * 0.5) + (opts.top or defaultPadding)
end
_M.topCenter = _M.top

function _M.topRight(obj, opts)
  opts = opts or {}

  obj.x = (actualContentWidth - (obj.width * 0.5)) - (opts.right or defaultPadding)
  obj.y = (obj.height * 0.5) + (opts.top or defaultPadding)
end

function _M.topLeft(obj, opts)
  opts = opts or {}

  obj.x = (obj.width * 0.5) + (opts.left or defaultPadding) 
  obj.y = (obj.height * 0.5) + (opts.top or defaultPadding)
end

function _M.bottom(obj, opts)
  opts = opts or {
    bottom = 0
  }

  obj.x = display.contentCenterX
  obj.y = (contentHeight - (obj.height * 0.5)) - (opts.bottom or defaultPadding)
end
_M.bottomCenter = _M.bottom

function _M.bottomRight(obj, opts)
  opts = opts or {}

  obj.x = (contentWidth - (obj.width * 0.5)) - (opts.padRight or defaultPadding)
  obj.y = (contentHeight - (obj.height * 0.5)) - (opts.padBottom or defaultPadding)
end

function _M.bottomLeft(obj, opts)
  opts = opts or {}

  obj.x = (obj.width * 0.5) + (opts.padLeft or defaultPadding) 
  obj.y = (contentHeight - (obj.height * 0.5)) - (opts.padBottom or defaultPadding)
end

function _M.center(obj, opts)
  opts = opts or {}

  opts.top = opts.top or 0

  obj.x = display.contentCenterX
  obj.y = display.contentCenterY + opts.top
end

function _M.centerRight(obj, opts)
  opts = opts or {}

  obj.x = (actualContentWidth - (obj.width * 0.5)) - (opts.padRight or defaultPadding)
  obj.y = display.contentCenterY
end

function _M.centerLeft(obj, opts)
  opts = opts or {}

  obj.x = (obj.width * 0.5) + (opts.padLeft or defaultPadding) 
  obj.y = display.contentCenterY
end

--# WIP
function _M.grid(obj, row, col, opts)
  opts = opts or {}

  local boxWidth = opts.boxWidth or defaultBoxWidth
  local boxHeight = opts.boxHeight or defaultBoxHeight
  local boxPadding = opts.boxPadding or defaultPadding

  if row > gridRows or row < 1 then
    error("Row position is out of bounds.")
  end

  if col > gridCols or col < 1 then
    error("Col position is out of bounds.")
  end

  obj.x = (boxWidth * col) - (boxWidth * 0.5)
  obj.y = (boxHeight * row) - (boxHeight * 0.5)

  return obj
end


function _M.renderGrid(grid_arr, starting_row, options)
  local gridGrp = display.newGroup()
  gridGrp.anchorX = .5
  gridGrp.anchorY = .5
  gridGrp.anchorChildren = true

  for i in ipairs(grid_arr) do
    gridGrp:insert( _M.grid(grid_arr[i], starting_row, i, options) )
  end  

  return gridGrp
end
--#


function _M.info()
  print("Content Height: "..contentHeight)
  print("Content Width: "..contentWidth)
  print("Actual Content Height: "..actualContentHeight)
  print("Actual Content Width: "..actualContentWidth)
end

return _M