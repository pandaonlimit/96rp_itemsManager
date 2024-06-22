# 96rp_itemsManager
<p>
  Stop items from being swapped<br>
  Everyone can use and modify this resource for free!<br>
  Credits would be cool ofc :)<br>
  It works only with ox_inventory
</p>
<p>
  Feel free to join our discord and support us if u want to :)<br>
  We dont sell anything and want to offer free scripts in the near future<br>
  You can also ask us for help or report bugs with a ticket on our discord!
</p>
<h1><a href="https://discord.gg/96rp">discord.gg/96rp</a></h1>
Current functions:
<ul>
   <li>Blacklist item from being swapped</li>
   <li>Blacklist items only with given metadata</li>
   <li>Whitelist inventorys</li>
</ul>
<pre>
local blacklist = {
  WEAPON_STUNGUN = { 'policeItem' },    <- items with "policeItem" as metadata are blacklisted
  WEAPON_44MAGNUM = {  },               <- item is blacklisted
}
  
local whiteListInventorys = {
    "policetrash_1",                      <- inventorys allowed to swap items
}

local metadataJobWhiteList = {
    policeItem = 'police'                 <- comming soon?!
}
</pre>
