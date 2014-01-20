init start
	REGEX_LOOT          = '^Loot of ?a?n? (.-): (.+)$' --TEMP FIX
 local warnItems = {"royal helmet", "terra legs", "spellbook of mind control", "terra mantle", "sacred tree amulet", "terra amulet", "noble axe", "mercenary sword", "medusa shield", "crown armor", "tower shield", "warrior helmet", "titan axe", "knight armor", "swamplair armor"} -- you can add more items here
 local maxLines = 10 -- max lines to display at once

 local lootMsgs = {}
init end

setfontstyle('Tahoma', 7, 75, 0xFFFFFF, 1, 0x000000)

foreach newmessage m do
 local creature, loot = m.content:match(REGEX_LOOT)
 if loot then
  local message, color = m.content, 0xFFFFFF

  for k, v in ipairs(warnItems) do
   if loot:find(v, 1, false) then
    color = 0xFF0000
    break
   end
  end

  table.insert(lootMsgs, 1, {message = message, color = color})
 end
end

while #lootMsgs > maxLines do
 table.remove(lootMsgs)
end

for k, msg in ipairs(lootMsgs) do
 setfontcolor(msg.color)

 drawtext(msg.message, 0, k * 10)
end
setposition($worldwin.left + 3, $worldwin.bottom - #lootMsgs * 10 - 13)
