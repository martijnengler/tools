tell application "System Events"
	set app_list to every application process whose name is "VLC"
	if the (count of app_list) > 0 then
		tell application "VLC" to play
	end if
end tell