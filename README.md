# Alignmate

Alignment helper for visual objects.

## Methods

- `top(obj[, opts])`
- `topRight(obj[, opts])`
- `topLeft(obj[, opts])`
- `bottom(obj[, opts])`
- `bottomRight(obj[, opts])`
- `bottomLeft(obj[, opts])`
- `center(obj[, opts])`
- `centerRight(obj[, opts])`
- `centerLeft(obj[, opts])`
- `grid(obj, row, col, opts)`

## Options

- `padTop`
- `padRight`
- `padLeft`
- `padBottom`

## Usage

_Using `button` UI helper._

```lua
local Alignmate = require('alignmate')
local Button = require('button')

local submitBtn = Button.new({
    label = 'Submit'
})

Alignmate:center(submitBtn)

```