local function ChangeUser(msg)
local text = msg.content_.text_
if ChatType == 'sp' or ChatType == 'gp'  then
if text then 
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,result)
if result.id_ then 
local Manial = DevManial:get("FekraTEAM:User"..result.id_)
if not result.username_ then 
if Manial then 
Dev_Manial(msg.chat_id_, msg.id_, 1, "حذف معرفه خمطو بسرعه، 😹💔 \nهذا معرفه @"..Manial.."", 1, 'html')
DevManial:del("FekraTEAM:User"..result.id_) 
end
end
if result.username_ then 
if Manial and Manial ~= result.username_ then 
local Manial_text = {
'معرفك الجديد عشره بربع محد ياخذه😹💔',
"هاها غيرت معرفك نشروك بقناة فضايح😹💔💭",
"معرفك الجديد حلو منين خامطه؟!🤤♥️",
"معرفك القديم @"..result.username_.." ضمه بقناة لاينبعص، 😹♥️",
}
Manials = math.random(#Manial_text)
Dev_Manial(msg.chat_id_, msg.id_, 1, Manial_text[Manials], 1, 'html')
end  
DevManial:set("FekraTEAM:User"..result.id_, result.username_) 
end
end
end,nil) 
end
end

end
return {
Fekra = ChangeUser
}