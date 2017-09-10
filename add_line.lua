-- This script add a line of text at the end of all text files in a folder

-- Requires Lua5.2 installed in your system. Refer to https://www.lua.org/download.html for more

-- GNU GPLv3 Licence

-- Ilias Tselios - Icarus Simulations

print("**************************************************************************")
print("* This program adds a line of text, at the end of all files in a folder. *")
print("**************************************************************************\n")

--Put on screen a understandable text for what we are asking, aka give us the full path of where the files are
io.write("Enter the full path of the folder (Enter if the files are in the same folder with that script): ")
foldername=io.read()    --Read users input and store it into foldername
io.write("Enter the text you want to be added: ") --Ask the user to type the line we want to add
text1=io.read()         --Read users input and store it into text 1


t={}                --Create a table to store the file names
fn = io.popen('ls ' .. foldername)  --list the files in the folder. 'ls': this argument is for shell commands (unix here)
for name in fn:lines() do
table.insert(t,name)                --and add them to the table "t"

    --print(name)
end

    --print(t[2])

for i=1, #t  do                         --open the file(s) in a (append mode opens an existing file or creates
local f=io.open(foldername..t[i], "a")  --a new file for appending.) It will overwrite the existing file(s)
f:write("\n", text1)                    --write the text we got from the user at a new line(\n) at the end of the file
f:close()                               --close the file(s)
end

