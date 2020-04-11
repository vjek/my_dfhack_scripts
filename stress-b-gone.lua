-- Adjust many stress related personality traits of all dwarves in play
-- by vjek
--[====[

 stress-b-gone
 =============
 Sets the stress related personality traits of all dwarves in play to: 

 She is impervious to the effects of stress.  
 She has an incredibly calm demeanor.  
 She never becomes angry.  
 She never feels discouraged.  
 She never envies others their status, situation or possessions.  
 She never feels hatred toward anyone or anything.  
 She does not have feelings of emotional attachment and has never felt even a moment's connection with another being.  
 She is never moved by the emotions of others.
 She is completely convinced of her own worthlessness.  
 She has no sense of vengeance or retribution.  
 She is  shameless, absolutely unfazed by the thoughts of others.  
 She finds something humorous in everything, no matter how serious or inappropriate.   
 She often feels filled  with joy.  
 She has such a developed sense of optimism that she always assumes the best outcome will eventually occur, no matter what.  

]====]

function brainwash_unit(unit)
    if unit==nil then
        print ("No unit available!  Aborting with extreme prejudice.")
        return
	end

	unit.status.current_soul.personality.traits.STRESS_VULNERABILITY = 1
	unit.status.current_soul.personality.traits.ANXIETY_PROPENSITY = 1
	unit.status.current_soul.personality.traits.ANGER_PROPENSITY = 1
	unit.status.current_soul.personality.traits.DEPRESSION_PROPENSITY = 1
	unit.status.current_soul.personality.traits.ENVY_PROPENSITY = 1
	unit.status.current_soul.personality.traits.HATE_PROPENSITY = 1
	unit.status.current_soul.personality.traits.EMOTIONALLY_OBSESSIVE = 1
	unit.status.current_soul.personality.traits.SWAYED_BY_EMOTIONS = 1
	unit.status.current_soul.personality.traits.PRIDE = 1
	unit.status.current_soul.personality.traits.VENGEFUL = 1
	unit.status.current_soul.personality.traits.BASHFUL = 1
	unit.status.current_soul.personality.traits.HUMOR = 99
	unit.status.current_soul.personality.traits.CHEER_PROPENSITY = 99
	unit.status.current_soul.personality.traits.HOPEFUL = 99
end

function adjust_all_dwarves()
    for _,v in ipairs(df.global.world.units.all) do
        if v.race == df.global.ui.race_id and v.status.current_soul then
            print("Adjusting "..dfhack.TranslateName(dfhack.units.getVisibleName(v)))
			brainwash_unit(v)
		end
	end
end

adjust_all_dwarves()
