-- Finds all evil clouds that turn dwarves into husks
-- by vjek
--[====[

cloudfinder
===========
``cloudfinder`` Finds all evil clouds that turn dwarves into husks

Typical usage would be during worldgen or prior to embark, with results of:

This is the list of husk-making evil clouds:
1                        = EVIL_CLOUD_4
2                        = EVIL_CLOUD_6
3                        = EVIL_CLOUD_8
This is the list of husk-making region interactions:
1                        = REGIONAL_2
2                        = EVIL_CLOUD_6
1                        = REGIONAL_7
2                        = EVIL_CLOUD_4

The first list are all the EVIL_CLOUD inorganic materials that create husks.
The second list are all of the world region interactions that contain one of
 those clouds from the first list.

]====]
-- ---------------------------------------------------------------------------
evil_cloud_count=0
evil_cloud_list={}
husking_region_list={}
for x = 0, #df.global.world.raws.inorganics-1 do
	if string.find(df.global.world.raws.inorganics[x].id,"EVIL_CLOUD_") ~= nil then
		for y = 0, #df.global.world.raws.inorganics[x].str-1 do
			if df.global.world.raws.inorganics[x].str[y][0] ~= nil then
				if string.find(df.global.world.raws.inorganics[x].str[y][0],"husk") ~= nil then
					table.insert(evil_cloud_list,df.global.world.raws.inorganics[x].id)
				end
			end
		end
	end
end
--
print("This is the list of husk-making evil clouds:")
printall(evil_cloud_list)
--
for x = 0, #df.global.world.raws.interactions-1 do
	if string.find(df.global.world.raws.interactions[x].name,"REGIONAL_") ~= nil then
		for y = 0, #df.global.world.raws.interactions[x].str-1 do
			for z = 1, #evil_cloud_list do
				if string.find(df.global.world.raws.interactions[x].str[y][0],evil_cloud_list[z]) ~= nil then
					table.insert(husking_region_list,{df.global.world.raws.interactions[x].name,evil_cloud_list[z]})
				end
			end
		end
	end
end
--
print("This is the list of husk-making region interactions:")
for a = 1,#husking_region_list do
	printall(husking_region_list[a])
end
