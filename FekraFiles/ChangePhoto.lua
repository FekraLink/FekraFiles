local function ChangePhoto(msg)
local text = msg.content_.text_
if ChatType == 'sp' or ChatType == 'gp'  then
if text then 
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,result)
if result.id_ then 
local Manial = DevManial:get("FekraTEAM:Photo"..result.id_)
if not result.profile_photo_ then 
if Manial then 
Dev_Manial(msg.chat_id_, msg.id_, 1, "حذف كل صوره مضروب بوري، 😹💔", 1, 'html')
DevManial:del("FekraTEAM:Photo"..result.id_) 
end
end
if result.profile_photo_ then 
if Manial and Manial ~= result.profile_photo_.big_.persistent_id_ then 
local Manial_text = {
"وفف مو صوره غنبلةة، 🤤♥️",
"طالع صاكك بالصوره الجديده ممكن نرتبط؟ ، 🤤♥️",
"حطيت صوره جديده عود شوفوني اني صاكك بنات، 😹♥️",
"اححح شنيي هالصوره الجديده، 🤤♥️",
}
Manial3 = math.random(#Manial_text)
Dev_Manial(msg.chat_id_, msg.id_, 1, Manial_text[Manial3], 1, 'html')
end  
DevManial:set("FekraTEAM:Photo"..result.id_, result.profile_photo_.big_.persistent_id_) 
end
end
end,nil) 
end
end

end
return {
Fekra = ChangePhoto
}