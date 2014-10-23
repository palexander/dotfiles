local resize = {}

local window = require "mjolnir.window"

function resize.next_screen()
  local win = window.focusedwindow()
	local frame = win:frame()
	local screenframe = win:screen():frame()
	local nextscreenframe = win:screen():next():frame()
	local newframe = {}
  newframe.w = frame.w
  newframe.h = frame.h
	print((screenframe.w - frame.w) / 2)
	print((screenframe.h - frame.h) / 2)
	newframe.x = nextscreenframe.x + (screenframe.w - frame.w) / 2
	newframe.y = nextscreenframe.y + (screenframe.h - frame.h) / 2
  win:setframe(newframe)
end

function resize.previous_screen()
  local win = window.focusedwindow()
	local screenframe = win:screen():frame()
	local newframe = {}
  newframe.w = screenframe.w
  newframe.h = screenframe.h
	newframe.x = screenframe.x
	newframe.y = screenframe.y
  win:setframe(newframe)
end	

function resize.maximize()
  local win = window.focusedwindow()
	local screenframe = win:screen():frame()
	local newframe = {}
  newframe.w = screenframe.w
  newframe.h = screenframe.h
	newframe.x = screenframe.x
	newframe.y = screenframe.y
  win:setframe(newframe)
end

function resize.percent_resize(factorW, factorH)
  local win = window.focusedwindow()
	local screenframe = win:screen():frame()
	local newframe = {}
  newframe.w = screenframe.w * (factorW / 100)
  newframe.h = screenframe.h * (factorH / 100)
	newframe.x = (screenframe.w - newframe.w) / 2
	newframe.y = (screenframe.h - newframe.h) / 2
  win:setframe(newframe)
end

function resize.center_resize(factor)
  local win = window.focusedwindow()
	local screenframe = win:screen():frame()
	local newframe = {}
  newframe.w = screenframe.w * (factor / 100)
  newframe.h = screenframe.h * (factor / 100)
	newframe.x = (screenframe.w - newframe.w) / 2
	newframe.y = (screenframe.h - newframe.h) / 2
  win:setframe(newframe)
end

function resize.vertical_split(factor)
  local win = window.focusedwindow()
	local screenframe = win:screen():frame()
	local newframe = {}
	newframe.x = 0
	newframe.y = 0
	newframe.w = screenframe.w * (factor / 100)
	newframe.h = screenframe.h
	win:setframe(newframe)
end

function resize.vertical_split_right(factor)
  local win = window.focusedwindow()
	local screenframe = win:screen():frame()
	local newframe = {}
	newframe.w = screenframe.w * (factor / 100)
	newframe.h = screenframe.h
	newframe.x = screenframe.w - newframe.w
	newframe.y = 0
	win:setframe(newframe)
end

return resize