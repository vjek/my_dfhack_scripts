-- Adjust all entertainer performance attributes of a single unit
-- by vjek
--[====[

elevate-performance
===============
Iterates through and sets all the musical instrument, poetry, music, and dance
skills, for this unit, based on this units civ, to Legendary.

]====]
local utils = require 'utils'
unit = dfhack.gui.getSelectedUnit()
if unit.status.current_soul.performance_skills then
-- ---------------------------------------------------------------------------
-- clear out this units current musical instrument skills
unit.status.current_soul.performance_skills.musical_instruments:resize(0)

-- find all instruments for this units civ
civ_instrument_list={}
for i=0, #df.global.world.raws.itemdefs.instruments-1 do
	if df.global.world.raws.itemdefs.instruments[i].source_enid == unit.civ_id then
--		print("instrument: "..df.global.world.raws.itemdefs.instruments[i].name)
		utils.insert_or_update(unit.status.current_soul.performance_skills.musical_instruments, { new = true, id = df.global.world.raws.itemdefs.instruments[i].subtype, rating = 20 }, 'id')
	end
end

-- ---------------------------------------------------------------------------
-- clear out this units current poem skills
unit.status.current_soul.performance_skills.poetic_forms:resize(0)

-- find all poems for this units civ
    if #df.global.world.poetic_forms.all then
    	civ_poem_list = {}
	    vec=df.global.world.poetic_forms.all
	    for k=0,#vec-1 do
	    	if unit.civ_id == vec[k].originating_entity then
--	    		print("poem:"..dfhack.TranslateName(vec[k].name,true))
	    		utils.insert_or_update(unit.status.current_soul.performance_skills.poetic_forms, { new = true, id = vec[k].id, rating = 20 }, 'id')
	        end
	    end
    end

-- ---------------------------------------------------------------------------
-- clear out this units current music skills
unit.status.current_soul.performance_skills.musical_forms:resize(0)

-- find all musics for this units civ
    if #df.global.world.musical_forms.all then
    	civ_music_list = {}
	    vec=df.global.world.musical_forms.all
	    for k=0,#vec-1 do
	    	if unit.civ_id == vec[k].originating_entity then
--	    		print("music:"..dfhack.TranslateName(vec[k].name,true))
	    		utils.insert_or_update(unit.status.current_soul.performance_skills.musical_forms, { new = true, id = vec[k].id, rating = 20 }, 'id')
	        end
	    end
    end

-- ---------------------------------------------------------------------------
-- clear out this units current dance skills
unit.status.current_soul.performance_skills.dance_forms:resize(0)

-- find all dances for this units civ
    if #df.global.world.dance_forms.all then
    	civ_dance_list = {}
	    vec=df.global.world.dance_forms.all
	    for k=0,#vec-1 do
	    	if unit.civ_id == vec[k].originating_entity then
--	    		print("dance:"..dfhack.TranslateName(vec[k].name,true))
	    		utils.insert_or_update(unit.status.current_soul.performance_skills.dance_forms, { new = true, id = vec[k].id, rating = 20 }, 'id')
	        end
	    end
    end
end
