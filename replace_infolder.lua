-- This script replaces the same piece of text in all text files in a folder.

--  X-Plane specific: .obj, .pol, .lin, .str filetypes

-- Requires Lua5.2 installed in your system. Refer to https://www.lua.org/download.html for more

-- GNU GPLv3 Licence

-- Ilias Tselios - Icarus Simulations


print("*********************************************************************************************************")
print("* Welcome! This script will replace a piece of text in all files of the kind you will set, in a folder. *")
print("*********************************************************************************************************\n")


io.write("Give me the full path of the folder or press enter if the script runs from the same folder as the files you want to change: \n")
foldername = io.read()
io.write("\nGive me the file type you want to change, ie. pol or obj, etc: ")
filetype = io.read()
io.write("\nGive me the text you want to be replaced: ")
local text1 = io.read()
io.write("\nGive me the new text you want me to put in the files: ")
local text2 = io.read()


files_t={}          --We create a table to store all the file names that we want to open and change the piece of text

local files_a = io.popen(string.format('cd %s ; ls --file-type *.%s ' , foldername , filetype))
for name in files_a:lines() do
    table.insert(files_t,name)                --and add them to the table "t"

    --print(name)
end
print (files_t[1], files_t[4])


for i=1, #files_t  do
    local f=io.open(foldername .. files_t[i], "r")
   -- if not f then error(" \nfile(s) <"..files_t[i].."> not found\n") end
     content = f:read("*all")				--read the file into memory
    f:close()
end

content = string.gsub(content, text1, text2)	--replace the text




for i=1, #files_t  do
    local f=io.open(foldername .. files_t[i], "w")
    f:write(content)								--write the file
    f:close()
end


print("\n***\n***")
print ("DEBUG folder name: ", foldername)
print ("DEBUG file type: ", filetype)
print ("DEBUG text to be replaced: ", text_a)
print ("DEBUG new text: ", text_b)
print (files_t[1], files_t[4])
print("***\n***\n")