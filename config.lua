Config = {}

Config.UseOldEsx = false

Config.Notify = 'okok' -- 'ox' / 'okok' / 'esx'

Config.PoliceAlertProbability = 0 -- in %

Config.ResistanceChance = 0 -- in % / 0 for disable

Config.NameWeaponNPC = "weapon_snspistol_mk2" -- https://wiki.rage.mp/index.php?title=Weapons must be [Handguns]

Config.CheckUpdate = true



Config.BlacklistNpc = {
    [GetHashKey('s_m_m_highsec_01')] = true,
    [GetHashKey('s_f_m_shop_high')] = true,
    [GetHashKey('mp_m_weapexp_01')] = true,
    [GetHashKey('s_m_m_scientist_01')] = true,
    [GetHashKey('s_m_y_blackops_01')] = true,
    [GetHashKey('u_m_y_babyd')] = true,
    [GetHashKey('mp_m_shopkeep_01')] = true
}

Config.Items = {
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

Strings = { --- 
    ['can_rob_npc_again'] = 'Vous ne pouvez pas braquer la même personne deux fois',
    ['rob_complete'] = 'You have rob this person',
    ['police_alert'] = 'Un citoyen se fait Racketter , faites vite !',
    ['police_alert_blip'] = 'Racket',
}
