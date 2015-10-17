--Made by DigitalBlast Team
--[[
	.By using this software, you agree that websites that have harmful, offensive content WILL BE REMOVED
	and that domain name will be placeholded. (makeing it un-useable)
	
	.Also by useing this software you agree that your website will contain NO inapropreate content
	
	Host ComputerCraft webpages
    Copyright (C) 2014-2015  DigitalBlast (Used to be Sapphire)

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
    
    Github repository: https://github.com/DigitalBlast/GREENNET
]]--
local SoftwareVersion = "16.0 GN2"

-- Start prep

local requestCount = 0

if not fs.exists( "www" ) then
    fs.makeDir( "www" )
 end
 
 if not fs.exists("www/index") then
    local file = fs.open( "www/index", "w" )
    file.write( "term.setBackgroundColor(colors.gray) term.clear() term.setCursorPos(1,1) if term.isColor() then term.setTextColor('colors.white') else term.setTextColor('colors.cyan') end print('This is the GreenNet server default webpage')" )
    file.close( )
 end

-- End prep

-- GUI function(s)

--End GUI function(s)

-- Logic function(s)

-- End logic functions