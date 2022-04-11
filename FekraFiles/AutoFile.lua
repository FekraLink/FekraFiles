local function AutoFile(msg)
local text = msg.content_.text_
if Sudo(msg) then
if text == 'تفعيل النسخه التلقائيه' or text == 'تفعيل جلب نسخه الجروبات' or text == 'تفعيل عمل نسخه للمجموعات' then   
Dev_Manial(msg.chat_id_,msg.id_, 1, "⌁︙تم تفعيل جلب نسخة الجروبات التلقائيه\n⌁︙سيتم ارسال نسخه تلقائيه للكروبات كل يوم الى خاص المطور الاساسي", 1, 'md')
DevManial:del(Fekra.."Manial:Lock:AutoFile")
end
if text == 'تعطيل النسخه التلقائيه' or text == 'تعطيل جلب نسخه الجروبات' or text == 'تعطيل عمل نسخه للمجموعات' then  
Dev_Manial(msg.chat_id_,msg.id_, 1, "⌁︙تم تعطيل جلب نسخة الجروبات التلقائيه", 1, 'md')
DevManial:set(Fekra.."Manial:Lock:AutoFile",true) 
end 
end

if (text and not DevManial:get(Fekra.."Manial:Lock:AutoFile")) then
Time = DevManial:get(Fekra.."Manial:AutoFile:Time")
if Time then 
if Time ~= os.date("%x") then 
local list = DevManial:smembers(Fekra..'Manial:Groups') 
local BotName = (DevManial:get(Fekra.."Manial:NameBot") or 'فكرة' or 'فكره')
local GetJson = '{"BotId": '..Fekra..',"BotName": "'..BotName..'","GroupsList":{'  
for k,v in pairs(list) do 
LinkGroups = DevManial:get(Fekra.."Manial:Groups:Links"..v)
Welcomes = DevManial:get(Fekra..'Manial:Groups:Welcomes'..v) or ''
ManialConstructors = DevManial:smembers(Fekra..'Manial:ManialConstructor:'..v)
BasicConstructors = DevManial:smembers(Fekra..'Manial:BasicConstructor:'..v)
Constructors = DevManial:smembers(Fekra..'Manial:Constructor:'..v)
Managers = DevManial:smembers(Fekra..'Manial:Managers:'..v)
Admis = DevManial:smembers(Fekra..'Manial:Admins:'..v)
Vips = DevManial:smembers(Fekra..'Manial:VipMem:'..v)
if k == 1 then
GetJson = GetJson..'"'..v..'":{'
else
GetJson = GetJson..',"'..v..'":{'
end
if #Vips ~= 0 then 
GetJson = GetJson..'"Vips":['
for k,v in pairs(Vips) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Admis ~= 0 then
GetJson = GetJson..'"Admis":['
for k,v in pairs(Admis) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Managers ~= 0 then
GetJson = GetJson..'"Managers":['
for k,v in pairs(Managers) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Constructors ~= 0 then
GetJson = GetJson..'"Constructors":['
for k,v in pairs(Constructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #BasicConstructors ~= 0 then
GetJson = GetJson..'"BasicConstructors":['
for k,v in pairs(BasicConstructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #ManialConstructors ~= 0 then
GetJson = GetJson..'"ManialConstructors":['
for k,v in pairs(ManialConstructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if LinkGroups then
GetJson = GetJson..'"LinkGroups":"'..LinkGroups..'",'
end
GetJson = GetJson..'"Welcomes":"'..Welcomes..'"}'
end
GetJson = GetJson..'}}'
local File = io.open('./'..Fekra..'.json', "w")
File:write(GetJson)
File:close()
local Manial = 'https://api.telegram.org/bot' .. TokenBot .. '/sendDocument'
local curl = 'curl "' .. Manial .. '" -F "chat_id='..DevId..'" -F "document=@'..Fekra..'.json' .. '" -F "caption=⌁︙يحتوي الملف على ↫ '..#list..' مجموعه"'
io.popen(curl)
io.popen('fm -fr '..Fekra..'.json')
DevManial:set(Fekra.."Manial:AutoFile:Time",os.date("%x"))
end
else 
DevManial:set(Fekra.."Manial:AutoFile:Time",os.date("%x"))
end
end

end
return {
Fekra = AutoFile
}