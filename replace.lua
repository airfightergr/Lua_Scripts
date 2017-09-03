-- This script replaces a piece of text in a text file.

-- Requires Lua5.2 installed in your system. Refer to https://www.lua.org/download.html for more

-- GNU GPLv3 Licence

-- Ilias Tselios - Icarus Simulations

-- Put on screen a few lines to explain how this script is working
io.write("\n\n\nWelcome! You will be asked to specify the file you want to change the text. \n")
io.write("If the file is not at the same directory as this file, please provide full path. \n")
io.write("For example: Users/username/desktop/file.obj \n\n\n")

io.write('Give me the name of the file: ')		--Get the filename
local name=io.read()
io.write('Text to be replaced: ')				--Get the text to be replaced
local text1=io.read()
io.write('Text to written: ')					--Get the text we want to write
local text2=io.read()

local f = io.open(name, "r")				--open the file for reading
if not f then error(" \nfile <"..name.."> not found\n") end
local content = f:read("*all")				--read the file into memory
f:close()									--close it

content = string.gsub(content, text1, text2)	--replace the text

local f = io.open(name, "w")					--open the file for writing
f:write(content)								--write the file
f:close()										--close the file...DONE!