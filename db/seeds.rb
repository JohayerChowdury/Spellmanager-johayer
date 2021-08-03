# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

case Rails.env
when "development"
  # add dev data here
    
    #books
    ms = Book.create(name: "Mirhalla's Spells")
    ironfist = Book.create(name: "Marathonia (IronFist)")
    giantfoot = Book.create(name: "Marathonia (GiantFoot)")
    dw = Book.create(name: "Dorfal's Wand")
    lzc = Book.create(name: "Level Zero Character!")
    
    #spells
    vicious_mockery_desc = "You unleash a string of insults laced with subtle enchantments at a creature you can see within range. " \
"If the target can hear you (though it need not understand you), it must succeed on a Wisdom saving throwor take 1d4 psychic damage and have disadvantage " \
"on the next attack roll it makes before the end of its next turn. This spell's damage increases by 1d4 when you reach 5th level (2d4), 11th level (3d4), " \
"and 17th level (4d4)."
    
    vicious_mockery = Spell.create(name: "Vicious Mockery", level: 0, school: "Enchantment", concentration: "No",
                                    is_bard: true, is_cleric: false, is_druid: false, is_paladin: false, 
                                    is_ranger: false, is_sorcerer: false, is_warlock: false, is_wizard: false, 
                                    description: vicious_mockery_desc)
    
    dancing_lights_desc = "You create up to four torch-sized lights within range, making them appear as torches, lanterns, or " \
"glowing orbs that hover in the air for the duration. You can also combine the four lights into one glowing vaguely humanoid form of Medium size. " \
"Whichever form you choose, each light sheds dim light in a 10-foot radius. As a bonus action on your turn, you can move the lights up to 60 feet to a " \
"newspot within range. A light must be within 20 feet of another light created by this spell, and a light winks out if it exceeds the spell's range."
    
    dancing_lights = Spell.create(name: "Dancing Lights", level: 0, school: "Evocation", concentration: "Yes",
                                    is_bard: true, is_cleric: false, is_druid: false, is_paladin: false,
                                    is_ranger: false, is_sorcerer: true, is_warlock: false, is_wizard: true,
                                    description: dancing_lights_desc)
    
    mending_desc = "This spell repairs a single break or tear in an object you touch, such as a broken chain link, two halves of a " \
"broken key, a torn cloak, or a leaking wineskin. As long as the break or tear is no larger than 1 foot in any dimension, you mend it. leaving no trace of " \
"the former damage. This spell can physically repair a magic item or construct, but the spell can't restore magic to such an object."
    
    mending = Spell.create(name: "Mending", level: 0, school: "Transmutation", concentration: "No", is_bard: true, is_cleric: true, 
                            is_druid: true, is_paladin: false, is_ranger: false, is_sorcerer: true, is_warlock: false, is_wizard: true,
                            description: mending_desc)
    
    minor_illusion_desc = "You create a sound or an image of an object within range that lasts for the duration. The illusion also " \
"ends if you dismiss it as an action or cast this spell again. If you create a sound, its volume can range from a whisper to a scream. It can be your voice, " \
"someone else's voice, a lion's roar, a beating of drums, or any other sound you choose. The sound continues unabated throughout the duration, or you can make " \
"discrete sounds at different times before the spell ends. If you create an image of an object - such as a chair, muddy footprints, or a small chest - it must " \
"be no larger than a 5-foot cube. The image can't create sound, light, smell, or any other sensory effect. Physical interaction with the image reveals it to " \
"be an illusion, because things can pass through it. If a creature uses its action to examine the sound or image, the creature can determine that it is an " \
"illusion with a successful Intelligence (Investigation) check against your spell save DC. If a creature discerns the illusion for what it is, the illusion " \
"becomes faint to the creature."
    
    minor_illusion = Spell.create(name: "Minor Illusion", level: 0, school: "Illusion", concentration: "No", is_bard: true, is_cleric: false,
                                    is_druid: false, is_paladin: false, is_ranger: false, is_sorcerer: true, is_warlock: true, is_wizard: true,
                                    description: minor_illusion_desc)
    
    wish_desc = "Wish is the mightiest spell a mortal creature can cast. By simply speaking aloud, you can alter the very foundations " \
"of reality in accord with your desires. The basic use of this spell is to duplicate any other spell of 8th level or lower. You don't need to meet any " \
"requirements in that spell, including costly components. The spell simply takes effect. Alternatively, you can create one of the following effects of " \
"your choice: * You create one object of up to 25,000 gp in value that isn't a magic item. The object can be no more than 300 feet in any dimension, and it " \
"appears in an unoccupied space you can see on the ground. * You allowup to twenty creatures that you can see to regain all hit points, and you end all " \
"effects on them described in the greater restoration spell. * You grant up to ten creatures that you can see resistance to a damage type you choose. " \
"* You grant up to ten creatures you can see immunity to a single spell or other magical effect for 8 hours. For instance, you could make yourself and all " \
"your companions immune to a lich's life drain attack. * You undo a single recent event by forcing a reroll of any roll made within the last round (including " \
"your last turn). Reality reshapes itself to accommodate the newresult. For example, a wish spell could undo an opponent's successful save, a foe's critical " \
"hit, or a friend's failed save. You can force the reroll to be made with advantage or disadvantage, and you can choose whether to use the reroll or the " \
"original roll. You might be able to achieve something beyond the scope of the above examples. State your wish to the DM as precisely as possible. The DM has " \
"great latitude in ruling what occurs in such an instance; the greater the wish, the greater the likelihood that something goes wrong. This spell might " \
"simply fail, the effect you desire might only be partly achieved, or you might suffer some unforeseen consequence as a result of howyou worded the wish. " \
"For example, wishing that a villain were dead might propel you forward in time to a period when that villain is no longer alive, effectively removing you " \
"from the game. Similarly, wishing for a legendary magic item or artifact might instantly transport you to the presence o f the item's current owner. The " \
"stress of casting this spell to produce any effect other than duplicating another spell weakens you. After enduring that stress, each time you cast a spell " \
"until you finish a long rest, you take 1d10 necrotic damage per level of that spell. This damage can't be reduced or prevented in any way. In addition, " \
"your Strength drops to 3, if it isn't 3 or lower already, for 2d4 days. For each o f those days that you spend resting and doing nothing more than light " \
"activity, your remaining recovery time decreases by 2 days. Finally, there is a 33 percent chance that you are unable to cast wish ever again if you suffer " \
"this stress."
    
    wish = Spell.create(name: "Wish", level: 9, school: "Conjuration", concentration: "No", is_bard: false, is_cleric: false, is_druid: false,
                        is_paladin: false, is_ranger: false, is_sorcerer: true, is_warlock: false, is_wizard: true,
                        description: wish_desc)
    
    feeblemind_desc = "You blast the mind of a creature that you can see within range, attempting to shatter its intellect and " \
"personality. The target takes 4d6 psychic damage and must make an Intelligence saving throw. On a failed save, the creature's Intelligence and Charisma " \
"scores become 1. The creature can't cast spells, activate magic items, understand language, or communicate in any intelligible way. The creature can, " \
"however, identify its friends, followthem, and even protect them. At the end of every 30 days, the creature can repeat its saving throwagainst this spell. " \
"If it succeeds on its saving throw, the spell ends. The spell can also be ended by greater restoration, heal, or wish."
    
    feeblemind = Spell.create(name: "Feeblemind", level: 8, school: "Enchantment", concentration: "No", is_bard: true, is_cleric: false, is_druid: true,
                                is_paladin: false, is_ranger: false, is_sorcerer: false, is_warlock: true, is_wizard: true,
                                description: feeblemind_desc)
    
    conjure_celestial_desc = "You summon a celestial of challenge rating 4 or lower, which appears in an unoccupied space that you " \
"can see within range. The celestial disappears when it drops to 0 hit points or when the spell ends. The celestial is friendly to you and your companions " \
"for the duration. Roll initiative for the celestial, which has its own turns. It obeys any verbal commands that you issue to it (no action required by you), " \
"as long as they don't violate its alignment. If you don't issue any commands to the celestial, it defends itself from hostile creatures but otherwise takes " \
"no actions. The DM has the celestial's statistics. At Higher Levels. When you cast this spell using a 9th-level spell slot, you summon a celestial of " \
"challenge"
    
    conjure_celestial = Spell.create(name: "Conjure Celestial", level: 7, school: "Conjuration", concentration: "Yes", is_bard: false, is_cleric: true,
                                        is_druid: false, is_paladin: false, is_ranger: false, is_sorcerer: false, is_warlock: false, is_wizard: false,
                                        description: conjure_celestial_desc)
    
    heal_desc = "Choose a creature that you can see within range. A surge of positive energy washes through the creature, causing it " \
"to regain 70 hit points. This spell also ends blindness, deafness, and any diseases affecting the target. This spell has no effect on constructs or undead. " \
"At Higher Levels. When you cast this spell using a spell slot of 7th level or higher, the amount of healing increases by 10 for each slot level above 6th."
    
    heal = Spell.create(name: "Heal", level: 6, school: "Evocation", concentration: "No", is_bard: false, is_cleric: true, is_druid: true,
                        is_paladin: false, is_ranger: false, is_sorcerer: false, is_warlock: false, is_wizard: false,
                        description: heal_desc)
    
    true_seeing_desc = "This spell gives the willing creature you touch the ability to see things as they actually are. For the " \
"duration, the creature has truesight, notices secret doors hidden by magic, and can see into the Ethereal Plane, all out to a range of 120 feet."
    
    true_seeing = Spell.create(name: "True Seeing", level: 6, school: "Divination", concentration: "No", is_bard: true, is_cleric: true,
                                is_druid: false, is_paladin: false, is_ranger: false, is_sorcerer: true, is_warlock: true, is_wizard: true,
                                description: true_seeing_desc)
    
    transport_plants_desc = "This spell creates a magical link between a Large or larger inanimate plant within range and another " \
"plant, at any distance, on the same plane of existence. You must have seen or touched the destination plant at least once before. For the duration, any " \
"creature can step into the target plant and exit from the destination plant by using 5 feet of movement."
    
    transport_plants = Spell.create(name: "Transport Via Plants", level: 6, school: "Conjuration", concentration: "No", is_bard: false, is_cleric: false, 
                                    is_druid: true, is_paladin: false, is_ranger: false, is_sorcerer: false, is_warlock: false, is_wizard: false,
                                    description: transport_plants_desc)
    
    bigby_hand_desc = "You create a Large hand of shimmering, translucent force in an unoccupied space that you can see within range. " \
"The hand lasts for the spell's duration, and it moves at your command, mimicking the movements of your own hand. The hand is an object that has AC 20 and " \
"hit points equal to your hit point maximum. If it drops to 0 hit points, the spell ends. It has a Strength of 26 (+8) and a Dexterity of 10 (+0). The hand " \
"doesn't fill its space. When you cast the spell and as a bonus action on your subsequent turns, you can move the hand up to 60 feet and then cause one of " \
"the following effects with it. Clenched Fist. The hand strikes one creature or object within 5 feet of it. Make a melee spell attack for the hand using " \
"your game statistics. On a hit, the target takes 4d8 force damage. Forceful Hand. The hand attempts to push a creature within 5 feet of it in a direction " \
"you choose. Make a check with the hand's Strength contested by the Strength (Athletics) check of the target. If the target is Medium or smaller, you have " \
"advantage on the check. If you succeed, the hand pushes the target up to 5 feet plus a number of feet equal to five times your spellcasting ability " \
"modifier. The hand moves with the target to remain within 5 feet of it. Grasping Hand. The hand attempts to grapple a Huge or smaller creature within 5 " \
"feet of it. You use the hand's Strength score to resolve the grapple. If the target is Medium or smaller, you have advantage on the check. While the hand " \
"is grappling the target, you can use a bonus action to have the hand crush it. When you do so, the target takes bludgeoning damage equal to 2d6 + your " \
"spellcasting ability modifier. Interposing Hand. The hand interposes itself between you and a creature you choose until you give the hand a different " \
"command. The hand moves to stay between you and the target, providing you with half cover against the target. The target can't move through the hand's " \
"space if its Strength score is less than or equal to the hand's Strength score. If its Strength score is higher than the hand's Strength score, the target " \
"can move toward you through the hand's space, but that space is difficult terrain for the target. At Higher Levels. When you cast this spell using a spell " \
"slot of 6th level or higher, the damage from the clenched fist option increases by 2d8 and the damage from the grasping hand increases by 2d6 for each slot " \
"level above 5th."
    
    bigby_hand = Spell.create(name: "Bigby\'s Hand", level: 5, school: "Evocation", concentration: "Yes", is_bard: false, is_cleric: false,
                                is_druid: false, is_paladin: false, is_ranger: false, is_sorcerer: false, is_warlock: false, is_wizard: true,
                                description: bigby_hand_desc)
    
    raise_dead_desc = "You return a dead creature you touch to life, provided that it has been dead no longer than 10 days. " \
"If the creature's soul is both willing and at liberty to rejoin the body, the creature returns to life with 1 hit point. This spell also neutralizes " \
"any poisons and cures nonmagical diseases that affected the creature at the time it died. This spell doesn't, however, remove magical diseases, curses, " \
"or similar effects; if these aren't first removed prior to casting the spell, they take effect when the creature returns to life. The spell can't return " \
"an undead creature to life. This spell closes all mortal wounds, but it doesn't restore missing body parts. If the creature is lacking body parts or organs " \
"integral for its survival - its head, for instance - the spell automatically fails. Coming back from the dead is an ordeal. The target takes a - 4 penalty " \
"to all attack rolls, saving throws, and ability checks. Every time the target finishes a long rest, the penalty is reduced by 1 until it disappears."
    
    raise_dead = Spell.create(name: "Raise Dead", level: 5, school: "Necromancy", concentration: "No", is_bard: true, is_cleric: true, is_druid: false,
                                is_paladin: true, is_ranger: false, is_sorcerer: false, is_warlock: false, is_wizard: false,
                                description: raise_dead_desc)
    
    blight_desc = "Necromantic energy washes over a creature of your choice that you can see within range, draining moisture " \
"and vitality from it. The target must make a Constitution saving throw. The target takes 8d8 necrotic damage on a failed save, or half as much damage on " \
"a successful one. This spell has no effect on undead or constructs. If you target a plant creature or a magical plant, it makes the saving throwwith " \
"disadvantage, and the spell deals maximum damage to it. If you target a nonmagical plant that isn't a creature, such as a tree or shrub, it doesn't make a " \
"saving throw; it simply withers and dies. At Higher Levels. When you cast this spell using a spell slot of 5th level or higher, the damage increases by " \
"1d8 for each slot level above 4th. "
    
    blight = Spell.create(name: "Blight", level: 4, school: "Necromancy", concentration: "No", is_bard: false, is_cleric: false, is_druid: true,
                            is_paladin: false, is_ranger: false, is_sorcerer: true, is_warlock: true, is_wizard: true,
                            description: blight_desc)
    
    control_water_desc = "Until the spell ends, you control any freestanding water inside an area you choose that is a cube up to " \
"100 feet on a side. You can choose from any of the following effects when you cast this spell. As an action on your turn, you can repeat the same effect or " \
"choose a different one. Flood. You cause the water level of all standing water in the area to rise by as much as 20 feet. If the area includes a shore, the " \
"flooding water spills over onto dry land. If you choose an area in a large body of water, you instead create a 20-foot tall wave that travels from one side " \
"of the area to the other and then crashes down. Any Huge or smaller vehicles in the wave's path are carried with it to the other side. Any Huge or smaller " \
"vehicles struck by the wave have a 25 percent chance of capsizing. The water level remains elevated until the spell ends or you choose a different effect. " \
"If this effect produced a wave, the wave repeats on the start of your next turn while the flood effect lasts. Part Water. You cause water in the area to " \
"move apart and create a trench. The trench extends across the spell's area, and the separated water forms a wall to either side. The trench remains until " \
"the spell ends or you choose a different effect. The water then slowly fills in the trench over the course of the next round until the normal water level " \
"is restored. Redirect Flow. You cause flowing water in the area to move in a direction you choose, even if the water has to flowover obstacles, up walls, " \
"or in other unlikely directions. The water in the area moves as you direct it, but once it moves beyond the spell's area, it resumes its flowbased on the " \
"terrain conditions. The water continues to move in the direction you chose until the spell ends or you choose a different effect. Whirlpool. This effect " \
"requires a body of water at least 50 feet square and 25 feet deep. You cause a whirlpool to form in the center of the area. The whirlpool forms a vortex " \
"that is 5 feet wide at the base, up to 50 feet wide at the top, and 25 feet tall. Any creature or object in the water and within 25 feet of the vortex is " \
"pulled 10 feet toward it. A creature can swim away from the vortex by m aking a Strength (Athletics) check against your spell save DC. When a creature " \
"enters the vortex for the first time on a turn or starts its turn there, it must make a Strength saving throw. On a failed save, the creature takes 2d8 " \
"bludgeoning damage and is caught in the vortex until the spell ends. On a successful save, the creature takes half damage, and isn't caught in the vortex. " \
"A creature caught in the vortex can use its action to try to swim away from the vortex as described above, but has disadvantage on the Strength (Athletics) " \
"check to do so. The first time each turn that an object enters the vortex, the object takes 2d8 bludgeoning damage; this damage occurs each round it " \
"remains in the vortex."
    
    control_water = Spell.create(name: "Control Water", level: 4, school: "Transmutation", concentration: "Yes", is_bard: false, is_cleric: true,
                                   is_druid: true, is_paladin: false, is_ranger: false, is_sorcerer: false, is_warlock: false, is_wizard: true,
                                   description: control_water_desc) 
    
    locate_creature_desc = "Describe or name a creature that is familiar to you. You sense the direction to the creature's location, " \
"as long as that creature is within 1,000 feet of you. If the creature is moving, you knowthe direction of its movement. The spell can locate a specific " \
"creature known to you, or the nearest creature of a specific kind (such as a human or a unicorn), so long as you have seen such a creature up close - " \
"within 30 feet - at least once. If the creature you described or named is in a different form, such as being under the effects of a polymorph spell, this " \
"spell doesn't locate the creature. This spell can't locate a creature if running water at least 10 feet wide blocks a direct path between you and the " \
"creature."
    
    locate_creature = Spell.create(name: "Locate Creature", level: 4, school: "Divination", concentration: "Yes", is_bard: true, is_cleric: true,
                                    is_druid: true, is_paladin: true, is_ranger: true, is_sorcerer: false, is_warlock: false, is_wizard: true,
                                    description: locate_creature_desc)
    
    staggering_smite_desc = "The next time you hit a creature with a melee weapon attack during this spell's duration, your weapon " \
"pierces both body and mind, and the attack deals an extra 4d6 psychic damage to the target. The target must make a Wisdom saving throw. On a failed save, " \
"it has disadvantage on attack rolls and ability checks, and can't take reactions, until the end of its next turn."
    
    staggering_smite = Spell.create(name: "Staggering Smite", level: 4, school: "Evocation", concentration: "Yes", is_bard: false, is_cleric: false,
                                    is_druid: false, is_paladin: true, is_ranger: false, is_sorcerer: false, is_warlock: false, is_wizard: false,
                                    description: staggering_smite_desc)
    
    conjure_animals_desc = "You summon fey spirits that take the form of beasts and appear in unoccupied spaces that you can see " \
"within range. Choose one of the following options for what appears: * One beast of challenge rating 2 or lower * Two beasts of challenge rating 1 or lower " \
"* Four beasts of challenge rating 1/2 or lower * Eight beasts of challenge rating 1/4 or lower Each beast is also considered fey, and it disappears when it " \
"drops to 0 hit points or when the spell ends. The summoned creatures are friendly to you and your companions. Roll initiative for the summoned creatures as " \
"a group, which has its own turns. They obey any verbal commands that you issue to them (no action required by you). If you don't issue any commands to them, " \
"they defend themselves from hostile creatures, but otherwise take no actions. The DM has the creatures' statistics. At Higher Levels. When you cast this " \
"spell using certain higher-level spell slots, you choose one of the summoning options above, and more creatures appear: twice as many with a 5th-level slot, " \
"three times as many with a 7th-level slot, and four times as many with a 9th-level slot."
    
    conjure_animals = Spell.create(name: "Conjure Animals", level: 3, school: "Conjuration", concentration: "Yes", is_bard: false, is_cleric: false,
                                    is_druid: true, is_paladin: false, is_ranger: true, is_sorcerer: false, is_warlock: false, is_wizard: false,
                                    description: conjure_animals_desc)
    
    dispel_magic_desc = "Choose one creature, object, or magical effect within range. Any spell of 3rd level or lower on the target " \
"ends. For each spell of 4th level or higher on the target, make an ability check using your spellcasting ability. The DC equals 10 + the spell's level. " \
"On a successful check, the spell ends. At Higher Levels. When you cast this spell using a spell slot of 4th level or higher, you automatically end the " \
"effects of a spell on the target if the spell's level is equal to or less than the level of the spell slot you used."
    
    dispel_magic = Spell.create(name: "Dispel Magic", level: 3, school: "Abjuration", concentration: "No", is_bard: true, is_cleric: true, is_druid: true,
                                is_paladin: true, is_ranger: false, is_sorcerer: true, is_warlock: true, is_wizard: true,
                                description: dispel_magic_desc)
    
    tasha_hideous_laughter_desc = "A creature of your choice that you can see within range perceives everything as hilariously funny " \
"and falls into fits of laughter if this spell affects it. The target must succeed on a Wisdom saving throwor fall prone, becoming incapacitated and unable " \
"to stand up for the duration. A creature with an Intelligence score of 4 or less isn't affected. At the end of each of its turns, and each time it takes " \
"damage, the target can make another Wisdom saving throw. The target has advantage on the saving throwif it's triggered by damage. On a success, the spell " \
"ends."
    
    tasha_hideous_laughter = Spell.create(name: "Tasha's Hideous Laughter", level: 1, school: "Enchantment", concentration: "Yes", is_bard: true,
                                            is_cleric: false, is_druid: false, is_paladin: false, is_ranger: false, is_sorcerer: false, is_warlock: false,
                                            is_wizard: true,
                                            description: tasha_hideous_laughter_desc)
    
    hellish_rebuke_desc = "As a reaction in response to being damaged by a creature within 60 feet of you that you can see, you " \
"point your finger, and the creature that damaged you is momentarily surrounded by hellish flames. The creature must make a Dexterity saving throw. It " \
"takes 2d10 fire damage on a failed save, or half as much damage on a successful one. At Higher Levels. When you cast this spell using a spell slot of 2nd " \
"level or higher, the damage increases by 1d10 for each slot level above 1st."
    
    hellish_rebuke = Spell.create(name: "Hellish Rebuke", level: 1, school: "Evocation", concentration: "No", is_bard: false, is_cleric: false,
                                    is_druid: false, is_paladin: false, is_ranger: false, is_sorcerer: false, is_warlock: true, is_wizard: false,
                                    description: hellish_rebuke_desc)
    
    #books_spells
    
    ms.spells << [mending, conjure_celestial, heal, true_seeing]
    ms.save
    ironfist.spells << [mending, locate_creature, conjure_animals]
    ironfist.save
    giantfoot.spells << [vicious_mockery, dancing_lights, feeblemind, tasha_hideous_laughter, raise_dead]
    giantfoot.save
    dw.spells << locate_creature
    dw.save
      
when "production"
  # run seed data in production
end
