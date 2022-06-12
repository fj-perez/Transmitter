on open location this_URL
	
	set hostname to "xxx.xxx.xxx.xxx"
	set portname to "xxxx"   	
	
	set rpc_url to "http://" & hostname & ":" & portname & "/transmission/rpc"
	
	set cmd to "curl --silent " & rpc_url & " | sed 's/.*<code>//g;s/<\\/code>.*//g'"
	
	set session_id to do shell script cmd
	
	set add_cmd to "curl --silent --header \"" & session_id & "\" " & rpc_url & " -d \"{\\\"method\\\":\\\"torrent-add\\\",\\\"arguments\\\":{\\\"paused\\\":false,\\\"filename\\\":\\\"" & this_URL & "\\\"}}\""
	
	set response to do shell script add_cmd
	set added_index to offset of "added" in response
	set duplicate_index to offset of "duplicate" in response
	
	if added_index is not 0 then
		display notification "File added succesfully!" with title "Transmitter"
		delay 0.5
	else if duplicate_index is not 0 then
		display notification "Duplicated file!" with title "Transmitter"
		delay 0.5
	else
		display dialog "Error adding file: " & response
	end if
	
end open location

on run
	display dialog "Transmitter 1.0"
	delay 1
end run