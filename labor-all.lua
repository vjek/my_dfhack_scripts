-- Assign all labors to all active dwarves
-- by vjek
--[====[

 labor-all
 =============
 assign all dwarves all labors, minus hunting, and assign one dwarf to cut wood

]====]

function labor_all(unit)
    if unit==nil then
        print ("No unit available!  Aborting with extreme prejudice.")
        return
	end
	for key,v in pairs(unit.status.labors) do
		if tonumber(key) then
			break
		elseif key == "CUTWOOD" then
		    unit.status.labors.CUTWOOD = false
		elseif key == "HUNT" then
		    unit.status.labors.HUNT = false
		elseif key == "FISH" then
		    unit.status.labors.FISH = false
		else
		    unit.status.labors[key] = true
		end
	end
end

function adjust_all_dwarves()
    for _,v in ipairs(df.global.world.units.all) do
        if v.race == df.global.ui.race_id and v.status.current_soul then
            print("Adjusting "..dfhack.TranslateName(dfhack.units.getVisibleName(v)))
			labor_all(v)
			v.military.pickup_flags.update = true
			lastdwarf=v
		end
	end
	lastdwarf.status.labors.MINE = false
	lastdwarf.status.labors.CUTWOOD = true
	lastdwarf.military.pickup_flags.update = true
end

adjust_all_dwarves()

--[====[
MINE                     = true
HAUL_STONE               = true
HAUL_WOOD                = true
HAUL_BODY                = true
HAUL_FOOD                = true
HAUL_REFUSE              = true
HAUL_ITEM                = true
HAUL_FURNITURE           = true
HAUL_ANIMALS             = true
CLEAN                    = true
CUTWOOD                  = true
CARPENTER                = true
DETAIL                   = true
MASON                    = true
ARCHITECT                = true
ANIMALTRAIN              = true
ANIMALCARE               = true
DIAGNOSE                 = true
SURGERY                  = true
BONE_SETTING             = true
SUTURING                 = true
DRESSING_WOUNDS          = true
FEED_WATER_CIVILIANS     = true
RECOVER_WOUNDED          = true
BUTCHER                  = true
TRAPPER                  = true
DISSECT_VERMIN           = true
LEATHER                  = true
TANNER                   = true
BREWER                   = true
ALCHEMIST                = true
SOAP_MAKER               = true
WEAVER                   = true
CLOTHESMAKER             = true
MILLER                   = true
PROCESS_PLANT            = true
MAKE_CHEESE              = true
MILK                     = true
COOK                     = true
PLANT                    = true
HERBALIST                = true
FISH                     = true
CLEAN_FISH               = true
DISSECT_FISH             = true
HUNT                     = true
SMELT                    = true
FORGE_WEAPON             = true
FORGE_ARMOR              = true
FORGE_FURNITURE          = true
METAL_CRAFT              = true
CUT_GEM                  = true
ENCRUST_GEM              = true
WOOD_CRAFT               = true
STONE_CRAFT              = true
BONE_CARVE               = true
GLASSMAKER               = true
EXTRACT_STRAND           = true
SIEGECRAFT               = true
SIEGEOPERATE             = true
BOWYER                   = true
MECHANIC                 = true
POTASH_MAKING            = true
LYE_MAKING               = true
DYER                     = true
BURN_WOOD                = true
OPERATE_PUMP             = true
SHEARER                  = true
SPINNER                  = true
POTTERY                  = true
GLAZING                  = true
PRESSING                 = true
BEEKEEPING               = true
WAX_WORKING              = true
HANDLE_VEHICLES          = true
HAUL_TRADE               = true
PULL_LEVER               = true
REMOVE_CONSTRUCTION      = true
HAUL_WATER               = true
GELD                     = true
BUILD_ROAD               = true
BUILD_CONSTRUCTION       = true
PAPERMAKING              = true
BOOKBINDING              = true
83                       = true
84                       = true
85                       = true
86                       = true
87                       = true
88                       = true
89                       = true
90                       = true
91                       = true
92                       = true
93                       = true
]====]
