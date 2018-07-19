# classes creation notes
#user - done
#Province - Name
#District - Name, Province ID, point:lat, point:lang
#Sector - Name, District ID
#climate zones -
#notifications/reports - extreme weather id, recepient id, status,
#extreme weather - jsonb:weather-data
#Disaster -
# "disasters":[
#  rails g scaffold disaster string:event integer:province_id integer:district_id integer:sector datetime:date_of_occurence string:location integer:deaths integer:injured integer:missing integer:houses_destroyed integer:houses_damaged integer:directly_affected integer: indirectly_affected integer:relocated integer:evacuated integer:losses_usd integer:losses_local string:damages_crops_hectares integer:lost_cattle integer:damages_roads_meters string:comments
