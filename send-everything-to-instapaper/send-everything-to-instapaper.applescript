set theUsername to the text returned of (display dialog "Username?" default answer "")
set thePassword to the text returned of (display dialog "Password?" default answer "" with hidden answer)

-- if you'd rather just hardcode your credentials uncomment and change the following lines
-- (less hassle, but also less secure)
--
-- set theUsername to "my@example.org"
-- set thePassword to "mybirthday"

tell application "Safari"
	set theWindow to front window
	set theTabs to theWindow's tabs --of every window
	repeat with eachTab in theTabs
		-- send current URL to instapaper
		set theInstapaperResult to do shell script "curl \"https://www.instapaper.com/api/add?username=" & theUsername & "&password=" & thePassword & "&url=" & URL of eachTab & "\""
		if theInstapaperResult is "403" then
			display dialog "Seems like your username / password doesn't match" buttons ("Continue…") default button 1 with icon stop
			return
		else
			if theInstapaperResult is not "201" then
				display dialog "Something went wrong, I'm not sure what at this moment…" buttons ("Continue…") default button 1 with icon stop
				return
			end if
		end if
		close eachTab
	end repeat
	
	-- if the window wasn't closed by closing the last tab, close it now :)
	if theWindow exists then
		close theWindow
	end if
	
end tell