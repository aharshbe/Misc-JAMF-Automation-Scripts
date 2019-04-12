# dialog
osascript -e '
set icon to POSIX file "/Applications/zoom.us.app/Contents/Resources/ZPlogo.icns"
set icon to icon as alias
display dialog "Lorem ipsum dolor sit amet\n\nUpdating will restart Lorem ipsum dolor sit amet." buttons {"Update now", "Later"} default button "Update now" with icon icon'

# alert
osascript -e '
set icon to POSIX file "/Applications/zoom.us.app/Contents/Resources/ZPlogo.icns"
set icon to icon as alias
set theAlertText to "Lorem ipsum dolor sit amet"
set theAlertMessage to "Lorem ipsum dolor sit amet. Update now or later?"
display alert theAlertText message theAlertMessage as critical buttons {"Update now", "Later"} default button "Update now" cancel button "Later"
'

# Notification
osascript -e 'display notification "Lorem ipsum dolor sit amet" with title "Title"'

