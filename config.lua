Restricted = {
  vehicles = {
    'stockade3',
    'rhino',
    'khanjali',
    'scarab',
    'scarab2',
    'scarab3',
    'thruster',
    'blimp',
    'blimp2',
    'blimp3',

    -- vehicles only admins can use
    admin = {
      'admincar2',
    },
    -- vehicles only moderators (and above) can use
    moderator = {
      'admincar1',
    },
  },

  peds = {
    admin = {
      'adminped',
    },
    moderator = {
      'modped',
    },
    'mp_f_stripperlite',
  },

  weapons = {
    -- You can also define your own ace permission
    customAce = {},
    moderator = {
      'weapon_railgun',
      'weapon_rayminigun',
      'weapon_raycarbine',
      'weapon_raypistol',
      'weapon_grenade',
      'weapon_stickybomb',
      'weapon_grenadelauncher',
      'weapon_grenadelauncher_smoke',
      'weapon_rpg',
      


    },
    'weapon_minigun',
    'weapon_snowball',
  },
}

-- Banned weapon ammunition types. Only valid for Mk II weapons. See ammotypes.lua
WeaponAmmoBannedTypes = {}
-- WeaponAmmoBannedTypes = {
--   table.unpack(AmmoFMJ),
--   table.unpack(AmmoAP),
--   table.unpack(AmmoIncendiary),
-- }

-- You can modify the ace prefix here
Prefix = 'dblacklist'

-- Instead of a blacklist, you can make this a whitelist
Inverted = false

-- Whether the vehicle blacklist only kicks them from
-- the vehicle if they're in the driver's seat
VehicleDriverBlacklist = true

Inherits = { -- The order to inherit from. You can also do this manually by adding 'add_ace dblacklist.admin dblacklist.moderator allow' etc for each ace
  'customAce',
  'admin',
  'moderator',
}

-- Once done configuring, add 'add_ace group.admin dblacklist.admin'
-- and 'add_ace group.moderator dblacklist.moderator' to your server.cfg