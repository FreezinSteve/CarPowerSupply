	#picaxe 14m2
	
	
	high B.4	; Switch on main power relay
	pause 60000	; wait 90 seconds for pi to power up
	pause 30000	; wait 90 seconds for pi to power up
main:	
 	; Check to see if ignition is off
 	if pinC.4 = 0 then
		let b0 = b0 + 1	
	else
		let b0 = 0
	endif
	pause 1000					; wait 1 second
	if pinC.3 = 1 then goto main		; If shutdown disable set then loop to start
	if b0 > 30 then goto shutdown		; Shutdown if ignition off for more than 30 seconds
	goto main					; loop back to start 

shutdown:
	low	B.4	; Switch off main power relay