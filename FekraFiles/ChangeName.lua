local function ChangeName(msg)
local text = msg.content_.text_
if ChatType == 'sp' or ChatType == 'gp'  then
if text then 
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,result)
if result.id_ then 
local Manial = DevManial:get("FekraTEAM:Name"..result.id_)
if not result.first_name_ then 
if Manial then 
DevManial:del("FekraTEAM:Name"..result.id_) 
end
end
if result.first_name_ then 
if Manial and Manial ~= result.first_name_ then 
local Manial_text = {
"اسمك "..result.first_name_.." ليش غيرته 🌚😹",
"وفف اسمكك الجديد يشكك، 🤤♥️ ",
"ليش غيرت اسمك "..result.first_name_.."\n قطيت احد حبي ؟ 🌚😹",
"اسمك "..result.first_name_.." فد شي وين زخرفته ؟، 🤤♥️", 
}
Manials = math.random(#Manial_text)
Dev_Manial(msg.chat_id_, msg.id_, 1, Manial_text[Manials], 1, 'html')
end  
DevManial:set("FekraTEAM:Name"..result.id_, result.first_name_)  
end
end
end,nil) 
end
end

end
return {
Fekra = ChangeName
}