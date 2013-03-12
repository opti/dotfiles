on replaceString(theText, oldString, newString)
  set AppleScript's text item delimiters to oldString
  set tempList to every text item of theText
  set AppleScript's text item delimiters to newString
  set theText to the tempList as string
  set AppleScript's text item delimiters to ""
  return theText
end replaceString

on run argv
  set theAckCmd to item 1 of argv
  set thePath to item 2 of argv
  set theSearchStr to item 3 of argv
  set theEscapedSearchStr to replaceString(theSearchStr, "'", "'\\''")

  tell application "iTerm"
    activate

    if (count of terminal) = 0 then make new terminal

    tell the first terminal
      launch session "Default Session"
      tell the last session
        write text "cd " & thePath
        write text theAckCmd & " '" & theEscapedSearchStr & "'"
        set name to "ack"
      end tell
    end tell

  end tell
end run
