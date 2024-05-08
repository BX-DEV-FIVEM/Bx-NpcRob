Config = {}

Config.UseOldEsx = false -- false use ESX Export

Config.Notify = 'okok' -- 'ox' / 'okok' / 'esx'

Config.TimeToRobAgain = 30

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
    ['rob_cooldown'] = 'Vous ne pouvez pas ',
}



