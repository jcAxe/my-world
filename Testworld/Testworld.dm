//This is a test World created by Keryar on 26/07/2018
/*
	These are simple defaults for your project.
 */

world
	fps = 25			// 25 frames per second
	icon_size = 64		// 32x32 icon size by default
	view = 6			// show up to 6 tiles outward from center (13x13 view)
	turf = /turf/grass

// Make objects move 8 pixels per tick when walking

mob
	icon = 'person.dmi'
	var
		MAXHP = 30
		HP = 30
		wealth = 0
	proc
		ToggleDamagedSprite()
			if(src.HP < src.MAXHP)
				src.icon_state = "damaged"
			else
				src.icon_state = "full"
		DeathCheck()
			if(HP <= 0)
				world << "[src] dies!"
				world << "[usr] killed [src]"
				del(src)
	bug
		icon = 'bug.dmi'
		icon_state = "full"
	Del()
		var/obj/gold/G = new(src.loc)
		G.amount = rand(1,100)
		..()
	Login()
		icon_state = gender
		world << "[usr] just logged in!"
		..()
	verb
		attack(mob/M as mob in oview(1))
			if(M.HP <= 0)
				usr << "You cannot damage a dead body. [M] is already dead!"
			else
				usr << "You attacked [M]!"
				oview() << "[usr] attacked [M]!"
				var/damage = rand(1,10)
				world << "[damage] damage!" 			//maybe later place view instead of world
				M.HP -= damage
				M.ToggleDamagedSprite()
				M.DeathCheck()

		wealth()
			if (wealth != 0)
				usr << "You have [wealth] gold pieces!"
			else
				usr << "You have no gold pieces!"
		say(msg as text)						// the user will use the command "say" as text, and the text will be used through the variable msg
			world << "[usr]: [msg]"				//the world sees chatroom-like output

mob
	step_size = 64

obj
	step_size = 64

obj
	tree
		icon = 'tree.dmi'
	gold
		icon = 'gold.dmi'
		var
			amount
		verb
			get()										//obj/gold/verb/get()
				set src in view(1)   						//src must be close
				usr << "You pick up [amount] gold"
				usr.wealth += amount 	 					//add to usr wealth
				del(src)
turf
	grass
		icon = 'grassFloor.dmi'

