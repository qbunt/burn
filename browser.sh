#!/bin/sh
echo 'removing downloads...'
# sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'select LSQuarantineDataURLString from LSQuarantineEvent'
echo 'downloads removed'

echo 'deleting chrome history...'
cd ~/Library/Application\ Support/Google/Chrome/Default
ls -la
# rm History History-journal
echo 'chrome history deleted'
