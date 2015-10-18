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
local SoftwareVersion = "16.0 GN2 ALPHA"

-- Start prep

local size = { term.getSize( ) } 

if not term.isColor( ) then
    print( "Download different version of GreenNet server for this type of computer" )
    error( "This version of GreenNet server is for advanced computers ONLY" )
end

if not http then
   error( "Error: HTTP REQUIRED!" )
end

local whitelistCheck = { http.checkURL( "http://greennet.uboxi.com" ) }
if not whitelistCheck[ 1 ] then
    error( "A fatal error has caused this: "..whitelistCheck[ 2 ] )
end

if not fs.exists( ".GREENNETSERVEROWNER" ) then
    local owner = fs.open( ".GREENNETSERVEROWNER", "w" )
    term.setBackgroundColor( colors.gray )
    term.clear()
    paintutils.drawLine( 1, 1, size[ 1 ], 1, colors.lightGray )
    term.setCursorPos( 1, 1 )
    print( "Server Owner" )
    term.setBackgroundColor( colors.gray )
    term.setCursorPos( 1,3 )
    print( "Enter the server owner: " )
    local ownerName = read( )
    owner.write( ownerName )
    owner.close()
 end
 
 if not fs.exists( ".GREENNETSERVERDOMAINSAVE" ) then
    
 end

local serverMode = true

local requestCount = 0

local UIPage

local data = { }

local softwareBreak

if not fs.exists( "www" ) then
    fs.makeDir( "www" )
 end
 
 if not fs.exists( "www/index" ) then
    local file = fs.open( "www/index", "w" )
    file.write( "term.setBackgroundColor(colors.gray) term.clear() term.setCursorPos(1,1) if term.isColor() then term.setTextColor(colors.cyan) else term.setTextColor(colors.white) end print('This is the GreenNet server default webpage')" )
    file.close( )
 end

-- End prep

-- GUI function(s)

function homeUI( )

    UIPage = "home"

    term.setBackgroundColor( colors.gray )
    term.clear( )
    paintutils.drawLine( 1, 1, size[ 1 ], 1, colors.lightGray )
    
    term.setCursorPos( 1, 1 )
    print( "Home | " )
    term.setCursorPos( 8, 1 )
    print( "Requests: " )
    term.setTextColor( colors.cyan )
    term.setCursorPos( 18, 1 )
    write( requestCount )
    term.setCursorPos( 20,1 )
    term.setTextColor( colors.white )
    print( SoftwareVersion )
    
    term.setBackgroundColor( colors.gray )
    term.setCursorPos( 1, 3 )
    write( "Server power:" )
    
    if serverMode then
        term.setBackgroundColor( colors.green )
        write( "On" )
        term.setBackgroundColor( colors.gray )
    else
        term.setBackgroundColor( colors.red )
        write( "Off" )
        term.setBackgroundColor( colors.gray )
    end
    
    term.setCursorPos( 1, 5 )
    print( "[Domain Settings Page]" )
    
    term.setCursorPos( 1, 7 )
    print( "[Exit GreenNet server]" )
    
    term.setCursorPos( 1, 9 )
    print( "[Power off server]" )
end

function domainNameUI( )
    term.setBackgroundColor( colors.gray )
    term.clear( )
    paintutils.drawLine( 1, 1, size[ 1 ], 1, colors.lightGray )
    
    term.setCursorPos( 1, 1 )
    print( "Domain Settings" )
    term.setBackgroundColor( colors.gray )
    term.setCursorPos( 1, 3 )
    print( "Nothing to see here... Yet" )
    sleep( 3 )
    homeUI()
end

-- End GUI function(s)

-- Request control

-- Request control

-- Logic code

function UIHandle()
    data = { os.pullEvent( "mouse_click" ) }
    if UIPage == "home" then
        if data[ 4 ] == 5 and data[ 3 ] >= 1 and data[ 3 ] <= 22 then
            domainNameUI()
        elseif data[ 4 ] == 7 and data[ 3 ] >= 1 and data[ 3 ] <= 22 then
            softwareBreak = true
            term.clear( )
            term.setCursorPos( 1, 1 )
            print( "Thank you for using GreenNet Server" )
        elseif data[ 4 ] == 9 and data[ 3 ] >= 1 and data[ 3 ] <= 18 then
            os.shutdown( )
        elseif data[ 4 ] == 3 and data[ 3 ] >= 14 and data[ 3 ] <= 15 then
            if serverMode then
                serverMode = false
            else
                serverMode = true
            end
            homeUI()
        end
    end 
end

-- End logic code