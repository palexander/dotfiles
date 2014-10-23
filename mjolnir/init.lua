local application = require "mjolnir.application"
local hotkey = require "mjolnir.hotkey"
local window = require "mjolnir.window"
local fnutils = require "mjolnir.fnutils"
local grid = require "mjolnir.bg.grid"

local resize = require './resize'

local mash_app = {"cmd", "alt", "ctrl"}
local mash = {"cmd", "ctrl"}
local mashshift = {"cmd", "alt", "shift"}
local minimash = {"ctrl", "alt"}

hotkey.bind(mash, ';', function() grid.snap(window.focusedwindow()) end)
hotkey.bind(mash, "'", function() fnutils.map(window.visiblewindows(), grid.snap) end)

-- adjust grid size
hotkey.bind(mash, '=', function() grid.adjustwidth( 1) end)
hotkey.bind(mash, '-', function() grid.adjustwidth(-1) end)
hotkey.bind(mash, ']', function() grid.adjustheight( 1) end)
hotkey.bind(mash, '[', function() grid.adjustheight(-1) end)

hotkey.bind(mash, 'M', resize.maximize)

hotkey.bind(mash, 'N', resize.next_screen)
hotkey.bind(mash, 'P', grid.pushwindow_prevscreen)

-- move windows
hotkey.bind(minimash, 'left', grid.pushwindow_left)
hotkey.bind(minimash, 'right', grid.pushwindow_right)
hotkey.bind(minimash, 'up', grid.pushwindow_up)
hotkey.bind(minimash, 'down', grid.pushwindow_down)

-- resize windows
hotkey.bind(mash, 'left', grid.resizewindow_thinner)
hotkey.bind(mash, 'right', grid.resizewindow_wider)
hotkey.bind(mash, 'up', grid.resizewindow_shorter)
hotkey.bind(mash, 'down', grid.resizewindow_taller)

-- center based resizing
hotkey.bind(mash, 'z', function() resize.center_resize(35) end)
hotkey.bind(mash, 'c', function() resize.center_resize(70) end)
hotkey.bind(mash, 'x', function() resize.percent_resize(50, 70) end)
hotkey.bind(mash, 'v', function() resize.percent_resize(85, 85) end)

-- vertical resizing
hotkey.bind(mash, '1', resize.maximize)
hotkey.bind(mash, '2', function() resize.vertical_split(60) end)
hotkey.bind(mash, '3', function() resize.vertical_split(50) end)
hotkey.bind(mash, '4', function() resize.vertical_split(40) end)
hotkey.bind(mash, '5', function() resize.vertical_split_right(40) end)
hotkey.bind(mash, '6', function() resize.vertical_split_right(50) end)
