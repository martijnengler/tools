(* 
Marked preview

A script to open the current document (in your editor) in the awesome Marked app

By Martijn Engler (http://applecoach.nl)
September 19, 2012

Works great with Keyboard Maestro:
	http://keyboardmaestro.com/main/
*)

-- got this method from http://vanderbrew.com/blog/2010/02/15/get-current-application-with-applescript/
on GetCurrentApp()
	tell application "System Events"
		set _app to item 1 of (every process whose frontmost is true)
		return name of _app
	end tell
end GetCurrentApp

tell application GetCurrentApp()
	set theFilename to get the file of the document of the first window
end tell

tell application "Marked"
	open theFilename
	activate
end tell