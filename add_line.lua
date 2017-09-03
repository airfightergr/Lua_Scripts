-- This script add a line of text at the end of all files in a folder

-- Requires Lua5.2 installed in your system. Refer to https://www.lua.org/download.html for more

print("**************************************************************************")
print("* This program adds a line of text, at the end of all files in a folder. *")
print("**************************************************************************\n")
io.write("Enter the full path of the folder (Enter if the files are in the same folder with that script): ")
foldername=io.read()
io.write("Enter the text you want to be added: ")
text1=io.read()


t={}
fn = io.popen('ls ' .. foldername)
for name in fn:lines() do 
table.insert(t,name)
--print(name) 
end

--print(t[2])

for i=1, #t  do
local f=io.open(foldername..t[i], "a")
f:write("\n", text1)
f:close()
end
--
--t={}
--x=5
--y=0
--for i = 1, 5 do
--    t[i] = x+i
--end
--print(t[1], t[2], t[3], t[4], t[5])
--for i = 1, #t do
--    y = y + t[i]
--end
--print(y)

-- /users/ilias/desktop/objects/
