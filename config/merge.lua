--[[   ____    ______
      /\  _`\ /\__  _\   __
 __  _\ \ \/\_\/_/\ \/ /_\ \___
/\ \/'\\ \ \/_/_ \ \ \/\___  __\
\/>  </ \ \ \L\ \ \ \ \/__/\_\_/
 /\_/\_\ \ \____/  \ \_\  \/_/
 \//\/_/  \/___/    \/_/

 [=====================================]
 [  Author: Dandraffbal-Stormreaver US ]
 [  xCT+ Version 4.x.x                 ]
 [  ©2015. All Rights Reserved.        ]
 [====================================]]

local ADDON_NAME, addon = ...

-- =====================================================
-- CreateMergeSpellEntry(
--    class,       [string] - class name that spell belongs to
--    interval,       [int] - How often to update merged data (in seconds)
--    prep,           [int] - The minimum time to wait to update merged data (NOT USED YET)
--    desc,        [string] - A short, helpful qualifier (1-2 words)
--  )
--    Creates a merge settings entry for a spell.
-- =====================================================
local function CreateMergeSpellEntry(class, interval, desc, prep)
  return {
         class = class      or "ITEM",
      interval = interval   or 3,
          prep = prep       or 0,
          desc = desc,
    }
end

-- Filter These Spells Remove
-- [1949] - Damage to Self

-- List of Spells that need to be merged
addon.merges = {

-- items (legendary rings)
  [187626] = CreateMergeSpellEntry("ITEM", .5, "Legedary Ring for Agility Users"),        -- Legedary Ring (Agility DPS - INSTANT)
  [187625] = CreateMergeSpellEntry("ITEM", .5, "Legedary Ring for Intellect DPS Users"),  -- Legedary Ring (Intellect DPS - INSTANT)
  [187624] = CreateMergeSpellEntry("ITEM", .5, "Legedary Ring for Strength DPS Users"),   -- Legedary Ring (Strength DPS - INSTANT)

-- items (legendary cloaks)
  [147891] = CreateMergeSpellEntry("ITEM", 3.5, "Legedary Cloak for Melee"),         -- Legedary Cloak (Melee - dmg over 3s)
  [148008] = CreateMergeSpellEntry("ITEM", 3.5, "Legedary Cloak for Casters"),       -- Legedary Cloak (Caster - dmg over 3s)
  [148009] = CreateMergeSpellEntry("ITEM", 5,   "Legedary Cloak for Healers"),       -- Legedary Cloak (Healer - heal over 10s)
  [149276] = CreateMergeSpellEntry("ITEM", 3.5, "Legedary Cloak for Hunters"),       -- Legedary Cloak (Hunter - dmg over 3s)

  -- Trinket: Kardris' Toxic Totem (Based on class and spec)
  [146061] = CreateMergeSpellEntry("ITEM", 5, "Physical Damage (Melee)"),            -- Multi-Strike (Physical, Melee)
  [146063] = CreateMergeSpellEntry("ITEM", 5, "Holy Damage"),                        -- Multi-Strike (Holy Dmg, ?????)
  [146064] = CreateMergeSpellEntry("ITEM", 5, "Arcane Damage (Balance Druids)"),     -- Multi-Strike (Arcane Boomkin)
  [146065] = CreateMergeSpellEntry("ITEM", 5, "Shadow Damage (Priests, Warlocks)"),  -- Multi-Strike (Shadow, Lock/Priest)
  [146067] = CreateMergeSpellEntry("ITEM", 5, "Fire, Frost Damage (Mages)"),         -- Multi-Strike (Fire, Frost Mage)
  [146069] = CreateMergeSpellEntry("ITEM", 5, "Physical Damage (Hunters)"),          -- Multi-Strike (Physical, Hunter)
  [146071] = CreateMergeSpellEntry("ITEM", 5, "Nature Damage (Elemental Shamans)"),  -- Multi-Strike (Nature, Ele Shaman)
  [146070] = CreateMergeSpellEntry("ITEM", 5, "Arcane Damage (Mages)"),              -- Multi-Strike (Arcane Mage)
  [146075] = CreateMergeSpellEntry("ITEM", 5, "Nature Damage (Windwalker Monks)"),   -- Multi-Strike (Nature, Monk)
  [146177] = CreateMergeSpellEntry("ITEM", 5, "Holy Healing (Priest, Paladin)"),     -- Multi-Strike (Holy, Healing)
  [146178] = CreateMergeSpellEntry("ITEM", 5, "Nature Healing (Druid, Monk)"),       -- Multi-Strike (Nature, Healing)

  -- Trinket: Thok's Acid-Grooved Tooth (Based on class and spec)
  [146137] = CreateMergeSpellEntry("ITEM", .5, "Physical Damage (Melee)"),           -- Cleave (Physical, Melee)
  [146157] = CreateMergeSpellEntry("ITEM", .5, "Holy Damage"),                       -- Cleave (Holy Dmg, ?????)
  [146158] = CreateMergeSpellEntry("ITEM", .5, "Arcane Damage (Balance Druids)"),    -- Cleave (Arcane Boomkin)
  [146159] = CreateMergeSpellEntry("ITEM", .5, "Shadow Damage (Priests, Warlocks)"), -- Cleave (Shadow, Lock/Priest)
  [146160] = CreateMergeSpellEntry("ITEM", .5, "Fire, Frost Damage (Mages)"),        -- Cleave (Fire, Frost Mage)
  [146162] = CreateMergeSpellEntry("ITEM", .5, "Physical Damage (Hunters)"),         -- Cleave (Physical, Hunter)
  [146166] = CreateMergeSpellEntry("ITEM", .5, "Arcane Damage (Mages)"),             -- Cleave (Arcane Mage)
  [146171] = CreateMergeSpellEntry("ITEM", .5, "Nature Damage (Elemental Shamans)"), -- Cleave (Nature, Ele)
  [148234] = CreateMergeSpellEntry("ITEM", .5, "Holy Healing (Priests, Paladins)"),  -- Cleave (Holy, Healing)
  [148235] = CreateMergeSpellEntry("ITEM", .5, "Nature Healing (Monks, Druids)"),    -- Cleave (Nature, Healing)

  -- Trinket: Warlord's of Draenor
  [184280] = CreateMergeSpellEntry("ITEM",   7, "Mirror of the Blademaster"),         -- Felstorm (every 2s for 20s)
  [184248] = CreateMergeSpellEntry("ITEM",  .5, "Discordant Chorus"),                 -- Discordant Chorus
  [185098] = CreateMergeSpellEntry("ITEM", 4.5, "Soothing Breeze"),                   -- Monk Class Trinket (Sacred Draenic Incense)

-- Follower / Bodyguard
  [171764] = CreateMergeSpellEntry("ITEM", 3.5, "Vivianne (Follower)"),               -- Fireball (for 8s)
  [175806] = CreateMergeSpellEntry("ITEM", 3.5, "Vivianne (Follower)"),               -- Meteor (Initial Dmg - AoE - every 5s for 8s)
  [173010] = CreateMergeSpellEntry("ITEM", 3.5, "Vivianne (Follower)"),               -- Blizzard
  [175814] = CreateMergeSpellEntry("ITEM", 3.5, "Vivianne (Follower)"),               -- Meteor Burn (DoT - AoE - every 5s for 8s)
  [176020] = CreateMergeSpellEntry("ITEM",  .5, "Aeda (Follower)"),                   -- Demonic Leap (INSTANT)
  [176017] = CreateMergeSpellEntry("ITEM", 3.5, "Aeda (Follower)"),                   -- Shadow Bolt Volley
  [172965] = CreateMergeSpellEntry("ITEM", 3.5, "Delvar (Follower)"),                 -- Death and Decay
  [175796] = CreateMergeSpellEntry("ITEM", 3.5, "Delvar (Follower)"),                 -- Breath of Sindragosa

-- Warlords of Draenor
  [159238] = CreateMergeSpellEntry("ITEM", 3.5, "Shattered Hand (Weapon Enchant)"),   -- WoD Shattered Hand Enchant
  [143924] = CreateMergeSpellEntry("ITEM", 3.5, "Item Leech"),                        -- Item life Leech
  [165421] = CreateMergeSpellEntry("ITEM", 3.5, "Shredder"),                          -- Gorgrond Shredder
  [164603] = CreateMergeSpellEntry("ITEM", 3.5, "Shredder"),                          -- Gorgrond Shredder
  [188505] = CreateMergeSpellEntry("ITEM",  .5, "Felmouth Frenzy"),                   -- Felmouth Frenzy Food (Tanaan)
  [182635] = CreateMergeSpellEntry("ITEM",  .5, "HFC Construct #1"),                  -- HFC Construct (Reverberating Blow)
  [182218] = CreateMergeSpellEntry("ITEM",  .5, "HFC Construct #2"),                  -- HFC Construct (Volatile Felblast)
  [180223] = CreateMergeSpellEntry("ITEM", 1.5, "HFC Construct #4"),                  -- HFC Construct (Felblaze Residue)
  [185656] = CreateMergeSpellEntry("ITEM",  .5, "Shadowfel Annihilation"),            -- HFC Xhul'horac (Friendly Fire)
  [181102] = CreateMergeSpellEntry("ITEM",  .5, "Mark Eruption"),                     -- HFC Mannoroth (Mark of Doom)

-- death knight (damage)
  [55078]  = CreateMergeSpellEntry("DEATHKNIGHT"),      -- Blood Plague
  [91776]  = CreateMergeSpellEntry("DEATHKNIGHT", 4),   -- Claw (Army of the Dead)
  [52212]  = CreateMergeSpellEntry("DEATHKNIGHT"),      -- Death and Decay
  [55095]  = CreateMergeSpellEntry("DEATHKNIGHT"),      -- Frost Fever
  [49184]  = CreateMergeSpellEntry("DEATHKNIGHT", .5),  -- Frost: Howling Blast                              (INSTANT)
  [168828] = CreateMergeSpellEntry("DEATHKNIGHT"),      -- Unholy: Necrosis
  [155159] = CreateMergeSpellEntry("DEATHKNIGHT", 2.5), -- Necrotic Plague
  [50401]  = CreateMergeSpellEntry("DEATHKNIGHT", 1.5), -- Frost: Razorice

-- death knight (healing)
  [119980] = CreateMergeSpellEntry("DEATHKNIGHT", 4),   -- Conversion
  [53365]  = CreateMergeSpellEntry("DEATHKNIGHT", 4),   -- Unholy Strength

-- druid (damage)
  [106998] = CreateMergeSpellEntry("DRUID"),              -- Astral Storm                               (Every 1s for 10s)
  [42231]  = CreateMergeSpellEntry("DRUID"),              -- Hurricane
  [33745]  = CreateMergeSpellEntry("DRUID"),              -- Lacerate
  [164812] = CreateMergeSpellEntry("DRUID"),              -- Moonfire (WoD)
  [124991] = CreateMergeSpellEntry("DRUID", 3, "Damage"), -- Nature's Vigil (Damage)
  [1822]   = CreateMergeSpellEntry("DRUID"),              -- Rake
  [1079]   = CreateMergeSpellEntry("DRUID", 2),           -- Rip
  [50288]  = CreateMergeSpellEntry("DRUID"),              -- Starfall
  [164815] = CreateMergeSpellEntry("DRUID"),              -- Sunfire (WoD)
  [106785] = CreateMergeSpellEntry("DRUID", 1),           -- Swipe (Cat)
  [106830] = CreateMergeSpellEntry("DRUID", 4),           -- Thrash (Cat)
  [77758]  = CreateMergeSpellEntry("DRUID", 4),           -- Thrash (Bear)
  [61391]  = CreateMergeSpellEntry("DRUID", .5),          -- Typhoon                                    (INSTANT)

-- druid (healing)
  [162359] = CreateMergeSpellEntry("DRUID"),            -- Genesis
  [33763]  = CreateMergeSpellEntry("DRUID"),            -- Lifebloom
  [124988] = CreateMergeSpellEntry("DRUID", 3, "Heal"), -- Nature's Vigil (Heal)
  [8936]   = CreateMergeSpellEntry("DRUID"),            -- Regrowth
  [774]    = CreateMergeSpellEntry("DRUID"),            -- Rejuvenation
  [155777] = CreateMergeSpellEntry("DRUID"),            -- Rejuvenation (Germination)
  [81269]  = CreateMergeSpellEntry("DRUID"),            -- Swiftmend (Efflorescence)
  [48438]  = CreateMergeSpellEntry("DRUID"),            -- Wild Growth

-- hunter
  [131900] = CreateMergeSpellEntry("HUNTER", 6),        -- A Murder of Crows                          (Over 30s)
  [120361] = CreateMergeSpellEntry("HUNTER", 4),        -- Barrage                                    (Channeled over 3s) 4 to be safe :P
  [118459] = CreateMergeSpellEntry("HUNTER", 2.5),      -- Beast Cleave                               (INSTANT)
  [3674]   = CreateMergeSpellEntry("HUNTER", 4),        -- Black Arrow                                (Every 2s for 20s)
  [13812]  = CreateMergeSpellEntry("HUNTER"),           -- Explosive Trap
  [53301]  = CreateMergeSpellEntry("HUNTER"),           -- Explosive Shot (3 ticks merged as one)
  [121414] = CreateMergeSpellEntry("HUNTER", 6),        -- Glaive Toss (Initial Damage)               (Merged with DoT)
  [120699] = CreateMergeSpellEntry("HUNTER", 4),        -- Lynx Rush                                  (9x over 4s)
  [2643]   = CreateMergeSpellEntry("HUNTER", 2.5),      -- Multi-Shot                                 (INSTANT)
  [118253] = CreateMergeSpellEntry("HUNTER", 8),        -- Serpent Sting (Survival)                   (over 15s)

-- mage
  [155152] = CreateMergeSpellEntry("MAGE"),             -- Primatic Crystal
  [157977] = CreateMergeSpellEntry("MAGE"),             -- Unstable Magic
  [120]    = CreateMergeSpellEntry("MAGE"),             -- Cone of Cold
  [114954] = CreateMergeSpellEntry("MAGE"),             -- Arcane: Nether Tempest                     (Merged w/ Secondary Spell)
  [1449]   = CreateMergeSpellEntry("MAGE", .5),         -- Arcane: Arcane Explosion
  [7268]   = CreateMergeSpellEntry("MAGE", 2),          -- Arcane: Arcane Missiles
  [153640] = CreateMergeSpellEntry("MAGE", 3.5),        -- Arcane: Arcane Orb													(3.5 for rough travel time)
  [157980] = CreateMergeSpellEntry("MAGE"),             -- Arcane: Supernova
  [12654]  = CreateMergeSpellEntry("MAGE"),             -- Fire: Ignite
  [2120]   = CreateMergeSpellEntry("MAGE", 4),          -- Fire: Flamestrike                          (Over 4 seconds)
  [44461]  = CreateMergeSpellEntry("MAGE"),             -- Fire: Living Bomb                          (Merged w/ DoT)
  [11366]  = CreateMergeSpellEntry("MAGE"),             -- Fire: Pyroblast
  [31661]  = CreateMergeSpellEntry("MAGE", .5),         -- Fire: Dragon's Breath
  [157981] = CreateMergeSpellEntry("MAGE"),             -- Fire: Blast Wave
  [83853]  = CreateMergeSpellEntry("MAGE"),             -- Fire: Combustion
  [153564] = CreateMergeSpellEntry("MAGE"),             -- Fire: Meteor
  [155158] = CreateMergeSpellEntry("MAGE", 4.5),        -- Fire: Meteor (DOT)													(Over 8 seconds)
  [148022] = CreateMergeSpellEntry("MAGE", 4),          -- Frost: Icicle (Mastery)                    (Could not find an actual time)
  [42208]  = CreateMergeSpellEntry("MAGE"),             -- Frost: Blizzard
  [122]    = CreateMergeSpellEntry("MAGE", .5),         -- Frost: Nova                                (INSTANT)
  [157997] = CreateMergeSpellEntry("MAGE"),             -- Frost: Ice Nova
  [153596] = CreateMergeSpellEntry("MAGE"),             -- Frost: Comet Storm
  [113092] = CreateMergeSpellEntry("MAGE"),             -- Frost: Frost Bomb
  [84721]  = CreateMergeSpellEntry("MAGE", 2.5),        -- Frost: Frozen Orb

-- monk (damage)
  [128531] = CreateMergeSpellEntry("MONK", 4),          -- Blackout Kick (DoT)                        (Every 1s for 4s)
  [115181] = CreateMergeSpellEntry("MONK", .5),         -- Breath of Fire                             (INSTANT)
  [148135] = CreateMergeSpellEntry("MONK", 3),          -- Chi Burst (DoT)
  [157676] = CreateMergeSpellEntry("MONK"),             -- Chi Burst (Instant)
  [132467] = CreateMergeSpellEntry("MONK", 3),          -- Chi Wave (Damage)
  [113656] = CreateMergeSpellEntry("MONK", 4),          -- Fists of Fury                              (Merged w/ Secondary Spell)
  [121253] = CreateMergeSpellEntry("MONK", .5),         -- Keg Smash                                  (INSTANT)
  [148187] = CreateMergeSpellEntry("MONK", 2.5),        -- Rushing Jade Wind (Damage)                 (Duplicated SCK healing interval)
  [107270] = CreateMergeSpellEntry("MONK", 2.5),        -- Spinning Crane Kick                        (Over 2s)
  [124255] = CreateMergeSpellEntry("MONK", 6),          -- Stagger/Staffelung
  [124098] = CreateMergeSpellEntry("MONK", 6),          -- Zen Sphere (Damage)                        (Merged w/ Detonate)
  [117952] = CreateMergeSpellEntry("MONK", 4.5),        -- Crackling Jade Lightning                   (Over 4s)
  [123996] = CreateMergeSpellEntry("MONK", 3),          -- Crackling Tiger Lightning                  (3 targets, every 1s for ??s)
  [157680] = CreateMergeSpellEntry("MONK", 2.5),        -- Chi Explosion (DMG)
  [158221] = CreateMergeSpellEntry("MONK", 2.5),        -- Hurricane Strike
  [117993] = CreateMergeSpellEntry("MONK", 1.5),        -- Chi Torpedo (DMG)                          (Travel Time)

-- monk (healing)
  [128591] = CreateMergeSpellEntry("MONK", 3),          -- Blackout Kick (Heal??)
  [130654] = CreateMergeSpellEntry("MONK", 3),          -- Chi Burst
  [124040] = CreateMergeSpellEntry("MONK", 1),          -- Chi Torpedo                                (Travel Time)
  [132463] = CreateMergeSpellEntry("MONK", 3),          -- Chi Wave (Heal)
  [117895] = CreateMergeSpellEntry("MONK", 3),          -- Eminence                                   (Merged w/ Statue)
  [132120] = CreateMergeSpellEntry("MONK", 6),          -- Enveloping Mist                            (Every 1s for 6s)
  [119611] = CreateMergeSpellEntry("MONK", 6),          -- Renewing Mist                              (Every 3s for 18s)
  [115310] = CreateMergeSpellEntry("MONK"),             -- Revival
  [127722] = CreateMergeSpellEntry("MONK", 3),          -- Serpent's Zeal
  [115175] = CreateMergeSpellEntry("MONK", 4.5),        -- Soothing Mist                              (Every 1s for 8s)
  [117640] = CreateMergeSpellEntry("MONK", 2.5),        -- Spinning Crane Kick (Heal)                 (Over 2s)
  [116670] = CreateMergeSpellEntry("MONK", .5),         -- Uplift                                     (INSTANT)
  [124081] = CreateMergeSpellEntry("MONK", 6),          -- Zen Sphere (Heal)                          (Merged w/ Detonate)
  [116847] = CreateMergeSpellEntry("MONK", 2.5),        -- Rushing Jade Wind (Heal)                   (Duplicated SCK healing interval)

-- paladin (damage)
  [101423] = CreateMergeSpellEntry("PALADIN"),          -- Seal of Righteousness                      (INSTANT)
  [88263]  = CreateMergeSpellEntry("PALADIN"),          -- Hammer of the Righteous
  [159561] = CreateMergeSpellEntry("PALADIN", 4.5),     -- Consecration                               (Every 1s for 8s)
  [81297]  = CreateMergeSpellEntry("PALADIN", 4.5),     -- Consecration (Tanks???)                    (Every 1s for 8s)
  [157122] = CreateMergeSpellEntry("PALADIN", 1),       -- Holy Shield                                (Travel Time - Needs more testing)
  [119072] = CreateMergeSpellEntry("PALADIN", .5),      -- Holy Wrath
  [86704]  = CreateMergeSpellEntry("PALADIN", .5),      -- Ancient Fury                               (INSTANT)
  [114919] = CreateMergeSpellEntry("PALADIN", 6.5),     -- Arcing Light (Damage)
  [31935]  = CreateMergeSpellEntry("PALADIN"),          -- Avenger's Shield
  [31803]  = CreateMergeSpellEntry("PALADIN", 6),       -- Censure
  [53385]  = CreateMergeSpellEntry("PALADIN"),          -- Divine Storm
  [122032] = CreateMergeSpellEntry("PALADIN"),          -- Exorcism (Glyph of Mass Exorcism)
  [96172]  = CreateMergeSpellEntry("PALADIN"),          -- Hand of Light (Mastery)
  [114852] = CreateMergeSpellEntry("PALADIN", .5),      -- Holy Prism (Healing on Target, Damage AoE) (INSTANT)
  [42463]  = CreateMergeSpellEntry("PALADIN"),          -- Seal of Truth

-- paladin (healing)
  [119952] = CreateMergeSpellEntry("PALADIN", 6.5),     -- Arcing Light (Heal)                        (Every 2s for 17.5s)
  [53652]  = CreateMergeSpellEntry("PALADIN"),          -- Beacon of Light
  [121129] = CreateMergeSpellEntry("PALADIN", .5),      -- Daybreak                                   (INSTANT)
  [114163] = CreateMergeSpellEntry("PALADIN", 5),       -- Eternal Flame (Merged with Off-Hand)       (Every 3s for 30s)
  [114871] = CreateMergeSpellEntry("PALADIN", .5),      -- Holy Prism (Damage on Target, Healing AoE) (ISNTANT)
  [82327]  = CreateMergeSpellEntry("PALADIN"),          -- Holy Radiance
  [85222]  = CreateMergeSpellEntry("PALADIN"),          -- Light of Dawn
  [86678]  = CreateMergeSpellEntry("PALADIN"),          -- Light of the Ancient Kings
  [94289]  = CreateMergeSpellEntry("PALADIN"),          -- Protector of the Innocent
  [20167]  = CreateMergeSpellEntry("PALADIN"),          -- Seal of Insight (Heal)
  [159375] = CreateMergeSpellEntry("PALADIN", 1.5),     -- Shining Protector (Prot Paladin)

-- priest (damage)
  [127628] = CreateMergeSpellEntry("PRIEST", 3),        -- Cascade (Damage)
  [2944]   = CreateMergeSpellEntry("PRIEST"),           -- Devouring Plague
  [158831] = CreateMergeSpellEntry("PRIEST", 3),        -- Devouring Plague 2
  [122128] = CreateMergeSpellEntry("PRIEST", 3),        -- Divine Star (Shadow)                       (INSTANT... over 3ish)
  [120696] = CreateMergeSpellEntry("PRIEST", 5),        -- Halo (Damage)                              (INSTANT... over 5ish)
  [14914]  = CreateMergeSpellEntry("PRIEST"),           -- Holy Fire
  [132157] = CreateMergeSpellEntry("PRIEST", .5),       -- Holy Nova (Damage Effect)                  (INSTANT)
  [15407]  = CreateMergeSpellEntry("PRIEST"),           -- Mind Flay
  [49821]  = CreateMergeSpellEntry("PRIEST"),           -- Mind Sear                                  (Merged w/ Secondary Spell)
  [47666]  = CreateMergeSpellEntry("PRIEST"),           -- Penance (Damage Effect)
  [129250] = CreateMergeSpellEntry("PRIEST", 4),        -- Power Word: Solace
  [33619]  = CreateMergeSpellEntry("PRIEST", 3),        -- Reflective Shield
  [179337] = CreateMergeSpellEntry("PRIEST"),           -- Searing Insanity
  [589]    = CreateMergeSpellEntry("PRIEST", 6),        -- Shadow Word: Pain
  [34914]  = CreateMergeSpellEntry("PRIEST", 6),        -- Vampiric Touch

-- priest (healing)
  [47750]  = CreateMergeSpellEntry("PRIEST"),           -- Penance (Heal)
  [139]    = CreateMergeSpellEntry("PRIEST"),           -- Renew
  [596]    = CreateMergeSpellEntry("PRIEST", .5),       -- Prayer of Healing                          (INSTANT)
  [64844]  = CreateMergeSpellEntry("PRIEST"),           -- Divine Hymn
  [32546]  = CreateMergeSpellEntry("PRIEST"),           -- Binding Heal
  [77489]  = CreateMergeSpellEntry("PRIEST"),           -- Echo of Light
  [34861]  = CreateMergeSpellEntry("PRIEST", .5),       -- Circle of Healing                          (INSTANT)
  [23455]  = CreateMergeSpellEntry("PRIEST", .5),       -- Holy Nova (Healing)                        (INSTANT)
  [33110]  = CreateMergeSpellEntry("PRIEST"),           -- Prayer of Mending
  [88686]  = CreateMergeSpellEntry("PRIEST", 6),        -- Holy Word: Sanctuary                       (every 2 sec for 30 sec)
  [121148] = CreateMergeSpellEntry("PRIEST", 3),        -- Cascade                                    (INSTANT... over 3ish)
  [110745] = CreateMergeSpellEntry("PRIEST", 3),        -- Divine Star (Holy, Disc)                   (INSTANT... over 3ish)
  [120692] = CreateMergeSpellEntry("PRIEST", 3),        -- Halo                                       (INSTANT... over 3ish)
  [7001]   = CreateMergeSpellEntry("PRIEST", 4),        -- Light Well                                 (every 2s for 6s)
  [127626] = CreateMergeSpellEntry("PRIEST", 6.5),      -- Devouring Plague (Heal)
  [81751]  = CreateMergeSpellEntry("PRIEST", 6),        -- Atonement (Healing you do through damage)
  [126154] = CreateMergeSpellEntry("PRIEST", 3),        -- Lightspring Renew
  [15290]  = CreateMergeSpellEntry("PRIEST", 5),        -- Vampiric Embrace                           (Over 15s)

-- rogue
  [22482]  = CreateMergeSpellEntry("ROGUE", .5),        -- Blade Flurry                               (INSTANT)
  [86392]  = CreateMergeSpellEntry("ROGUE", .5),        -- Main Gauche                                (INSTANT)
  [113780] = CreateMergeSpellEntry("ROGUE"),            -- Deadly Poison                              (Merged with DoT)
  [121411] = CreateMergeSpellEntry("ROGUE"),            -- Crimson Tempest                            (Merged with DoT)
  [51723]  = CreateMergeSpellEntry("ROGUE", .5),        -- Fan of Knives                              (INSTANT)
  [8680]   = CreateMergeSpellEntry("ROGUE"),            -- Wound Poison
  [157607] = CreateMergeSpellEntry("ROGUE"),       	    -- Swift Poison (Combat Rogue Perk)           (INSTANT)
  [57841]  = CreateMergeSpellEntry("ROGUE", 3.5),       -- Killing Spree

-- shaman (damage)
  [421]    = CreateMergeSpellEntry("SHAMAN", .5),       -- Chain Lightning                            (Merged with Mastery, INSTANT)
  [77478]  = CreateMergeSpellEntry("SHAMAN"),           -- Earthquake
  [8349]   = CreateMergeSpellEntry("SHAMAN"),           -- Fire Nova
  [8050]   = CreateMergeSpellEntry("SHAMAN"),           -- Flame Shock
  [10444]  = CreateMergeSpellEntry("SHAMAN"),           -- Flametongue Attack
  [114074] = CreateMergeSpellEntry("SHAMAN", .5),       -- Lava Beam                                  (Merged with Mastery, INSTANT)
  [26364]  = CreateMergeSpellEntry("SHAMAN"),           -- Lightning Shield (Static Shock)
  [8187]   = CreateMergeSpellEntry("SHAMAN"),           -- Magma Totem
  [58879]  = CreateMergeSpellEntry("SHAMAN"),           -- Spirit Hunt (Spirit Wolves)
  [51490]  = CreateMergeSpellEntry("SHAMAN"),           -- Thunderstorm
  [25504]  = CreateMergeSpellEntry("SHAMAN", .5),       -- Windfury Attack                            (INSTANT)
  [177601] = CreateMergeSpellEntry("SHAMAN"),           -- Liquid Magma                               (Every 0.5s for 10s)

-- shaman (healing)
  [114911] = CreateMergeSpellEntry("SHAMAN", 5),        -- Ancestral Guidance                         (INSTANT)
  [1064]   = CreateMergeSpellEntry("SHAMAN", .5),       -- Chain Heal                                 (INSTANT)
  [73921]  = CreateMergeSpellEntry("SHAMAN"),           -- Healing Rain
  [52042]  = CreateMergeSpellEntry("SHAMAN"),           -- Healing Stream Totem
  [114942] = CreateMergeSpellEntry("SHAMAN", 4),        -- Healing Tide Totem
  [114083] = CreateMergeSpellEntry("SHAMAN"),           -- Restorative Mists (Ascendance)
  [61295]  = CreateMergeSpellEntry("SHAMAN"),           -- Riptide
  [115357] = CreateMergeSpellEntry("SHAMAN"),           -- Windstrike                                 (Merged w/ Off-Hand)
  [32175]  = CreateMergeSpellEntry("SHAMAN"),           -- Stormstrike                                (Merged w/ Off-Hand)
  [114089] = CreateMergeSpellEntry("SHAMAN"),           -- Wind Lash (Ascendance)                     (Merged w/ Off-Hand)
  [189509] = CreateMergeSpellEntry("SHAMAN", .5),       -- Electrocute (T18 - Enhance 2P)             (INSTANT)

-- warlock (damage)
  [980]    = CreateMergeSpellEntry("WARLOCK"),          -- Agony                                      (Cataclysm Spam)
  [124915] = CreateMergeSpellEntry("WARLOCK", .5),      -- Chaos Wave                                 (INSTANT)
  [108685] = CreateMergeSpellEntry("WARLOCK", .5),      -- Conflagrate                                (INSTANT)
  [146739] = CreateMergeSpellEntry("WARLOCK"),          -- Corruption                                 (Cataclysm Spam)
  [689]    = CreateMergeSpellEntry("WARLOCK"),          -- Drain Life
  [103103] = CreateMergeSpellEntry("WARLOCK", 4),       -- Drain Soul                                 (Every 1s for 4s)
  [89753]  = CreateMergeSpellEntry("WARLOCK"),          -- Felstorm (Felguard)
  [104318] = CreateMergeSpellEntry("WARLOCK"),          -- Fel Firebolt (Wild Imps)
  [86040]  = CreateMergeSpellEntry("WARLOCK"),          -- Hand of Gul'dan (Shadowflame)
  [47960]  = CreateMergeSpellEntry("WARLOCK"),          -- Hand of Gul'dan (DOT a.k.a Shadowflame )
  [5857]   = CreateMergeSpellEntry("WARLOCK"),          -- Hellfire
  [157736] = CreateMergeSpellEntry("WARLOCK"),          -- Immolate
  [20153]  = CreateMergeSpellEntry("WARLOCK"),          -- Immolation (Infernal)
  [129476] = CreateMergeSpellEntry("WARLOCK"),          -- Immolation Aura
  [114654] = CreateMergeSpellEntry("WARLOCK", .5),      -- Incinerate                                 (INSTANT)
  [30213]  = CreateMergeSpellEntry("WARLOCK", .5),      -- Legion Strike (Felguard)                   (INSTANT)
  [104233] = CreateMergeSpellEntry("WARLOCK", 4),       -- Rain of Fire (Destruction)                 (Every 1s for 8s)
  [27243]  = CreateMergeSpellEntry("WARLOCK"),          -- Seed of Corruption                         (Merged w/ Explosion & Soulburned)
  [30108]  = CreateMergeSpellEntry("WARLOCK"),          -- Unstable Affliction                        (Cataclysm Spam)
  [116858] = CreateMergeSpellEntry("WARLOCK", .5),      -- Choas Bolt                                 (Charred Remains Talent)

-- warlock (healing)
  [89653]  = CreateMergeSpellEntry("WARLOCK"),          -- Drain Life
  [63106]  = CreateMergeSpellEntry("WARLOCK"),          -- Siphon Life
  [108366] = CreateMergeSpellEntry("WARLOCK"),          -- Soul Leech
  [108447] = CreateMergeSpellEntry("WARLOCK"),          -- Soul Link

-- warrior
  [50622]  = CreateMergeSpellEntry("WARRIOR"),          -- Bladestorm                                 (Merged with Offhand)
  [113344] = CreateMergeSpellEntry("WARRIOR"),          -- Bloodbath
  [115767] = CreateMergeSpellEntry("WARRIOR", 3),       -- Deep Wounds
  [52174]  = CreateMergeSpellEntry("WARRIOR", .5),      -- Heroic Leap                                (INSTANT)
  [96103]  = CreateMergeSpellEntry("WARRIOR"),          -- Raging Blow                                (Merged w/ Off-Hand)
  [156287] = CreateMergeSpellEntry("WARRIOR", 3),       -- Ravager                                    (Every 1s for 10s)
  [6572]   = CreateMergeSpellEntry("WARRIOR", .5),      -- Revenge                                    (INSTANT)
  [46968]  = CreateMergeSpellEntry("WARRIOR", .5),      -- Shockwave                                  (INSTANT)
  [6343]   = CreateMergeSpellEntry("WARRIOR", .5),      -- Thunder Clap                               (INSTANT)
  [1680]   = CreateMergeSpellEntry("WARRIOR"),          -- Whirlwind
  [5308]   = CreateMergeSpellEntry("WARRIOR"),          -- Execute                                    (Merged w/ Off-Hand)
  [118000] = CreateMergeSpellEntry("WARRIOR", .5),      -- Dragon Roar
}


addon.merge2h = {
  -- Death Knight (Damage)
  [66198] = 49020,     -- Obliterate (DW)
  [66196] = 49143,     -- Frost Strike (DW)

  -- Hunter (Damage)
  [120761] = 121414,   -- Glaive Toss

  -- Mage (Damage)
  [44457]  = 44461,    -- Living Bomb (DOT)
  [114923] = 114954,   -- Nether Tempest (50% to random player)

  -- Monk (Damage)
  [117418] = 113656,   -- Fists of Fury
  [125033] = 124098,   -- Zen Sphere: Detonate (Damage)

  -- Monk (Healing)
  [126890] = 117895,   -- Eminence (Statue)
  [125953] = 115175,   -- Soothing Mist (Statue)
  [124101] = 124081,   -- Zen Sphere: Detonate (Heal)

  -- Paladin (Healing)
  [156322] = 114163,   -- Eternal Flame (HoT)

  -- Paladin (Damage)
  [53595] = 88263,		 -- Hammer of the Righteous (Holy DMG)

  -- Priest (Damage)
  [124469] = 49821,    -- Mind Sear

  -- Rogue (Damage)
  [122233] = 121411,   -- Crimson Tempest (DoT)
  [2818]   = 113780,   -- Deadly Poison (DoT)
  [57842]  = 57841,    -- Killing Spree (Offhand)

  -- Shaman (damage)
  [32176]  = 32175,    -- Stormstrike
  [115360] = 115357,   -- Windstrike
  [114093] = 114089,   -- Wind Lash (Ascendance)

  -- Warlock (Damage)
  [131737] = 980,      -- Agony (Malefic Grasp)
  [131740] = 172,      -- Corruption (Malefic Grasp)
  [131736] = 30108,    -- Unstable Affliction (Malefic Grasp)
  [27285]  = 27243,    -- Seed of Corruption (Explosion)
  [87385]  = 27243,    -- Seed of Corruption (Explosion Soulburned)

  -- Warrior
  [85384]  = 96103,    -- Raging Blow
  [44949]  = 1680,     -- Whirlwind (Offhand)
  [95738]  = 50622,    -- Bladestorm (Offhand)
  [163558] = 5308,     -- Execute (Offhand)
}
