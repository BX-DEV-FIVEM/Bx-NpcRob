

![1](https://github.com/BX-DEV-FIVEM/Bx-NpcRob/assets/140925178/49ea9145-2231-4879-8117-f83b9e88e13b)

![2](https://github.com/BX-DEV-FIVEM/Bx-NpcRob/assets/140925178/385f1c74-a7a3-4597-8465-ed3665e215be)

***
**Introducing BX-NpcRob, an advanced FiveM script that allows players to engage in dynamic NPC robberies with OX_Target, featuring extensive customization options, configurable police alerts, and top-tier optimization for a seamless gameplay experience**

***
**Features**

* **🚓 Rob NPC**: Players can rob NPCs.
* **🔥 Blacklist NPC**: Ability to add NPCs to a blacklist to make them unrobable.
* **📣 Configurable Notifications**: Supports OX / OKOK or ESX notifications.
* **🔒 Minimum Cops Requirement**: A configurable number of minimum police presence required for a robbery to proceed.
* **🚨 Police Alerts**: Configurable probability and notifications for police alerts when a robbery occurs.
* **🚓 Npc Attack probability**: Probability of an NPC becoming aggressive .
* **👨‍🔧 Multi-language and Easy to Configure**: Configurations and messages can be easily adjusted via config.lua.
* **🔄 Automated Updates**: Automatic update checks to ensure users always have the latest version.
* **🟢 Maximum Optimization**: Designed for minimal performance impact (0.00 ms).

***


**Update**

* **V2** : Add Config.TimeToRobAgain


***

**Dependency**

* **ESX**
* **OX_LIB** (for notifications and utilities)
* **OX_TARGET** 
* **Name must be : 'Bx-NpcRob'**


***

**Configuration**

<details>

<summary><strong>Config.lua</strong></summary>

```lua
Config = {}

Config.UseOldEsx = false -- false use ESX Export

Config.Notify = 'okok' -- 'ox' / 'okok' / 'esx'

Config.MinimumCops = 1 -- Minimum cops for rob 

Config.PoliceJobName = 'police' -- Name of police job

Config.PoliceAlertProbability = 30 -- in %

Config.ResistanceChance = 5 -- in % / 0 for disable

Config.NameWeaponNPC = "weapon_snspistol_mk2" -- https://wiki.rage.mp/index.php?title=Weapons must be [Handguns]

Config.CheckUpdate = true



Config.BlacklistNpc = { --- Npc can't be rob
    [GetHashKey('s_m_m_highsec_01')] = true,
    [GetHashKey('s_f_m_shop_high')] = true,
    [GetHashKey('mp_m_weapexp_01')] = true,
    [GetHashKey('s_m_m_scientist_01')] = true,
    [GetHashKey('s_m_y_blackops_01')] = true,
    [GetHashKey('u_m_y_babyd')] = true,
    [GetHashKey('mp_m_shopkeep_01')] = true
}

Config.Items = { --- Random Item to rob
    {
        itemName = 'phone',
        itemRandomAmount = {1, 1}
    },
    {
        itemName = 'money',
        itemRandomAmount = {1, 150}
    },
    {
        itemName = 'bread',
        itemRandomAmount = {1, 1} 
    },
    {
        itemName = 'water',
        itemRandomAmount = {1, 1}
    },
}

Strings = { --- translation
    ['racket'] = 'Rob this person',
    ['can_rob_npc_again'] = 'You can\'t rob the same person twice',
    ['rob_complete'] = 'You have rob this person',
    ['police_alert'] = 'A citizen is being racketed, help him!',
    ['police_alert_blip'] = 'Racket',
    ['need_police'] = 'Not enough police officers in town.',
}



```

</details>

***

**Live Preview**

[YOUTUBE](https://www.youtube.com/watch?v=L5CmgFKxnKA)


***

**BX-DOCUMENTATION**

[DOCUMENTATION](https://bx-devs.gitbook.io/doc)

***

For any questions or support, feel free to join us !

[![Discord](https://github.com/BX-DEV-FIVEM/BX-Carjob/assets/140925178/6b508333-aa27-44ff-9b3c-9030b00c1f28)](https://discord.gg/GhAcTjNcu8)
