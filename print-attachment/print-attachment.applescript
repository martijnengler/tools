-- borrowed some code from this script:
-- http://www.macosxtips.co.uk/index_files/automatically-save-mail-attachments-using-applescript.php

-- for some reason I can't get this to work
-- so the actual path is a few lines down in the code, as home:dropbox:ios-print
-- just change it there and everything should work fine
global attachmentsFolder
set attachmentsFolder to ((path to home folder as text) & "Dropbox:ios-print") as text

using terms from application "Mail"
	on process_message(theMessage)
		set attachmentsFolder to "home:Dropbox:ios-print"
		set {year:y, month:m, day:d, hours:h, minutes:min} to theMessage's date sent
		set timeStamp to ("" & y & "-" & my pad(m as integer) & "-" & my pad(d) & "-" & my pad(h) & "-" & my pad(min))
		repeat with theAttachment in theMessage's mail attachments
			set originalName to name of theAttachment
			set savePath to attachmentsFolder & ":" & timeStamp & " " & originalName
			
			-- slight modification, so it works on Mountain Lion
			save theAttachment in file savePath
		end repeat
	end process_message
	
	on perform mail action with messages theMessages
		try
			set theMessageCount to count of theMessages
			-- set theMessageCount to 1
			repeat with theMessageIndex from 1 to theMessageCount
				my process_message(item theMessageIndex of theMessages)
			end repeat
		on error m number n
			display dialog the "Exception in Mail action: (" & n & ") " & m
		end try
	end perform mail action with messages
	
	-- Adds leading zeros to date components
	on pad(n)
		return rich text -2 thru -1 of ("00" & n)
	end pad
end using terms from