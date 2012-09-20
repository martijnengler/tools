## Purpose

Using the provided AppleScript with a rule and the Automator-workflow on
a folder, you can use this script to automatically print attachments coming in on a certain email address (or some other rule you provide)

## Credits

Based on the great work of the awesome Dave Caolo of 52tiger.net

Original can be found here: http://52tiger.net/print-from-ios-dropbox-ifttt-automator

Differences between our workflows:

* Mine assumes you don't want to use ifttt, and have a Mac that's always run
* My automator file automatically deletes the file after it's printed

## Installation

Installation is simple:

1. Create a folder you want to use as temp storage for the to-print documents
2. Install the workflow and set it to this folder
3. Place the applescript in the folder ~/Library/Application
		 Scripts/com.apple.mail (just create it, if it doesn't exist yet)
4. Create a new rule in Mail, something like this:
![Screenshot](https://github.com/martijnengler/tools/blob/master/print-attachment/screenshot.png)
5. Send an email with an attachment to the specified email address
6. Wait a few seconds… It's printing!
