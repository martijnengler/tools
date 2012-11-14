tell application "System Events"
	set app_list to every application process whose name is "Spotify"
	if the (count of app_list) > 0 then
		tell application "Spotify" to pause
	end if
end tell