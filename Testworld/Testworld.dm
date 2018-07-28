//This is a test World created by Keryar on 26/07/2018
/*
	These are simple defaults for your project.
 */

world
	fps = 25		// 25 frames per second
	icon_size = 64	// 32x32 icon size by default
	view = 6		// show up to 6 tiles outward from center (13x13 view)
	turf = /turf/grass

// Make objects move 8 pixels per tick when walking

mob
	icon = 'person.dmi'
	var
		HP = 30
	Login()
		icon_state = gender
		..()
	verb
		say(msg as text)		// the user will use the command "say" as text, and the text will be used through the variable msg
			world << "[usr]: [msg]"		//the world sees chatroom-like output

mob
	step_size = 64

obj
	step_size = 64

turf
	grass
		icon = 'grassFloor.dmi'

