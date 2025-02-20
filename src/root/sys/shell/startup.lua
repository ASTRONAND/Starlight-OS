--[[
SPDX-FileCopyrightText: 2023 The CC: Tweaked Developers
SPDX-License-Identifier: MPL-2.0
Edited by Starlight-OS team for use in Starlight-OS.
Edits are filed under GNU General Public License.
    Copyright (C) 2025  StarlightOS

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>

    contacts-
      <https://raw.githubusercontent.com/ASTRONAND/Starlight-OS/refs/heads/main/legal/contacts.md>
]]
term.clear()
local rootdir = shell.cmdDir()
-- Setup aliases
shell.clearAlias("ls")
shell.clearAlias("dir")
shell.clearAlias("sh")
shell.clearAlias("cp")
shell.clearAlias("mv")
shell.clearAlias("rm")
shell.clearAlias("clr")
shell.clearAlias("rs")
shell.setAlias("ls", "/"..rootdir.."list.lua")
shell.setAlias("dir", "/"..rootdir.."list.lua")
shell.setAlias("sh", "/"..rootdir.."shell.lua")
shell.setAlias("cp", "/"..rootdir.."copy.lua")
shell.setAlias("mv", "/"..rootdir.."move.lua")
shell.setAlias("rm", "/"..rootdir.."delete.lua")
shell.setAlias("clr", "/"..rootdir.."clear.lua")
shell.setAlias("rs", "/"..rootdir.."redstone.lua")
shell.setAlias("shutdown", "/sys/serv/shutdown.lua")
shell.setAlias("reboot", "/sys/serv/reboot.lua")

if fs.exists("/sys/shell/startups/") and fs.isDir("/sys/shell/startups/") then
  local tFiles = fs.list("/sys/shell/startups/")
  for _, sFile in ipairs(tFiles) do
      local sPath = "/sys/shell/startups/" .. sFile
      if not fs.isDir(sPath) then
          shell.run("run "..sPath)
      end
  end
end
