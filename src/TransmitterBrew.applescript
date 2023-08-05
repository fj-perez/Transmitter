on open location this_URL

	set add_cmd to "/opt/homebrew/bin/transmission-remote -a \"" & this_URL & "\""
	set response to do shell script add_cmd	
	
	if {response ends with "success"} then
		display notification "File added." with title "Transmitter"
	end if
	
	(*set added_index to offset of "added" in response
	set duplicate_index to offset of "duplicate" in response
	
	if added_index is 0 then
		display notification "File added succesfully!" with title "Transmitter"
		delay 0.5
	else if duplicate_index is not 0 then
		display notification "Duplicated file!" with title "Transmitter"
		delay 0.5
	else
		display dialog "Error adding file: " & response
	end if*)

end open location

on run
	display dialog "Transmitter 1.1"
	delay 1
	display notification ".. .."
end run