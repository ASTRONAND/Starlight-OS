function os.home()
    return "/home/test"
term.clear()
term.setCursorPos(1,1)

local make_package = dofile("sys/modules/require.lua").make

local multishell = multishell
local parentShell = shell
local parentTerm = term.current()

if multishell then
    multishell.setTitle(multishell.getCurrent(), "shell")
end

local bExit = false
local sDir = parentShell and parentShell.dir() or ""
local sPath = parentShell and parentShell.path() or ".:"..os.home()
local tAliases = parentShell and parentShell.aliases() or {}
local tCompletionInfo = parentShell and parentShell.getCompletionInfo() or {}
local tProgramStack = {}

local shell = {} --- @export
local function createShellEnv(dir)
    local env = { shell = shell, multishell = multishell }
    env.require, env.package = make_package(env, dir)
    return env
end
-- Set up a dummy require
local require
do
    local env = setmetatable(createShellEnv(os.home()), { __index = _ENV })
    require = env.require
end
local expect = require("sys.expect").expect
local exception = require "sys.internal.exception"

-- Colors
local promptColour, textColour, bgColour
if term.isColour() then
    promptColour = colours.cyan
    textColour = colours.white
    bgColour = colours.black
else
    promptColour = colours.white
    textColour = colours.white
    bgColour = colours.black
end
