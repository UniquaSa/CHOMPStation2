
//Reagent Vore belly Sounds
var/global/list/vore_reagent_sounds = list(
		'sound/vore/walkslosh1.ogg',
		'sound/vore/walkslosh2.ogg',
		'sound/vore/walkslosh3.ogg',
		'sound/vore/walkslosh4.ogg',
		'sound/vore/walkslosh5.ogg',
		'sound/vore/walkslosh6.ogg',
		'sound/vore/walkslosh7.ogg',
		'sound/vore/walkslosh8.ogg',
		'sound/vore/walkslosh9.ogg',
		'sound/vore/walkslosh10.ogg',
		"None" = null)

var/global/list/item_tf_spawnpoints = list() // Global variable tracking which items are item tf spawnpoints

/var/global/list/existing_metroids = list() //Global variable for tracking metroids for the event announcement. Needs to go here for load order.

//stuff that only synths can eat
var/global/list/edible_tech = list(/obj/item/weapon/cell,
				/obj/item/weapon/circuitboard,
				/obj/item/integrated_circuit,
				/obj/item/broken_device,
				/obj/item/brokenbug,
				)

var/global/list/item_digestion_blacklist = list(
		/obj/item/weapon/hand_tele,
		/obj/item/weapon/card/id,
		/obj/item/weapon/gun,
		/obj/item/weapon/pinpointer,
		/obj/item/clothing/shoes/magboots,
		/obj/item/areaeditor/blueprints,
		/obj/item/weapon/disk/nuclear,
		/obj/item/device/perfect_tele_beacon,
		/obj/item/organ/internal/brain/slime,
		/obj/item/device/mmi/digital/posibrain,
		/obj/item/weapon/rig/protean)

// Options for transforming into a different mob in virtual reality.
var/global/list/vr_mob_tf_options = list(
	"Borg" = /mob/living/silicon/robot,
	"Cortical borer" = /mob/living/simple_mob/animal/borer/non_antag,
	"Hyena" = /mob/living/simple_mob/animal/hyena,
	"Giant spider" = /mob/living/simple_mob/animal/giant_spider/thermic,
	"Armadillo" = /mob/living/simple_mob/animal/passive/armadillo,
	"Parrot" = /mob/living/simple_mob/animal/passive/bird/parrot,
	"Cat" = /mob/living/simple_mob/animal/passive/cat,
	"Corgi" = /mob/living/simple_mob/animal/passive/dog/corgi,
	"Fox" = /mob/living/simple_mob/animal/passive/fox,
	"Racoon" = /mob/living/simple_mob/animal/passive/raccoon_ch,
	"Shantak" = /mob/living/simple_mob/animal/sif/shantak,
	"Goose" = /mob/living/simple_mob/animal/space/goose,
	"Space shark" = /mob/living/simple_mob/animal/space/shark,
	"Synx" = /mob/living/simple_mob/animal/synx,
	"Dire wolf" = /mob/living/simple_mob/vore/wolf/direwolf,
	"Construct Artificer" = /mob/living/simple_mob/construct/artificer,
	"Tech golem" = /mob/living/simple_mob/mechanical/technomancer_golem,
	"Metroid" = /mob/living/simple_mob/metroid/juvenile/baby,
	"Otie" = /mob/living/simple_mob/vore/otie/cotie/chubby,
	"Shadekin" = /mob/living/simple_mob/shadekin,
	"Slime" = /mob/living/simple_mob/slime/xenobio/metal,
	"Corrupt hound" = /mob/living/simple_mob/vore/aggressive/corrupthound,
	"Deathclaw" = /mob/living/simple_mob/vore/aggressive/deathclaw/den,
	"Mimic" = /mob/living/simple_mob/vore/aggressive/mimic/floor/plating,
	"Giant rat" = /mob/living/simple_mob/vore/aggressive/rat,
	"Catslug" = /mob/living/simple_mob/vore/alienanimals/catslug,
	"Dust jumper" = /mob/living/simple_mob/vore/alienanimals/dustjumper,
	"Space ghost" = /mob/living/simple_mob/vore/alienanimals/spooky_ghost,
	"Teppi" = /mob/living/simple_mob/vore/alienanimals/teppi,
	"Bee" = /mob/living/simple_mob/vore/bee,
	//"Dragon" = /mob/living/simple_mob/vore/bigdragon/friendly, //Currently adds 12 bellies to the user when transformed into. Do not uncomment without fixing this.
	"Riftwalker" = /mob/living/simple_mob/vore/demon/wendigo,
	"Horse" = /mob/living/simple_mob/vore/horse/big,
	"Morph" = /mob/living/simple_mob/vore/morph,
	"Leopardmander" = /mob/living/simple_mob/vore/leopardmander,
	"Rabbit" = /mob/living/simple_mob/vore/rabbit,
	"Red panda" = /mob/living/simple_mob/vore/redpanda,
	"Sect drone" = /mob/living/simple_mob/vore/sect_drone,
	"Armalis vox" = /mob/living/simple_mob/vox/armalis,
	"Xeno hunter" = /mob/living/simple_mob/xeno_ch/hunter,
	"Xeno queen" = /mob/living/simple_mob/xeno_ch/queen/maid,
	"Xeno sentinel" = /mob/living/simple_mob/xeno_ch/sentinel)

var/global/list/vr_mob_spawner_options = list(
	"Parrot" = /mob/living/simple_mob/animal/passive/bird/parrot,
	"Rabbit" = /mob/living/simple_mob/vore/rabbit,
	"Cat" = /mob/living/simple_mob/animal/passive/cat,
	"Fox" = /mob/living/simple_mob/animal/passive/fox,
	"Cow" = /mob/living/simple_mob/animal/passive/cow,
	"Dog" = /mob/living/simple_mob/vore/woof,
	"Horse" = /mob/living/simple_mob/vore/horse/big,
	"Hippo" = /mob/living/simple_mob/vore/hippo,
	"Sheep" = /mob/living/simple_mob/vore/sheep,
	"Squirrel" = /mob/living/simple_mob/vore/squirrel/big,
	"Red panda" = /mob/living/simple_mob/vore/redpanda,
	"Fennec" = /mob/living/simple_mob/vore/fennec,
	"Corgi" = /mob/living/simple_mob/animal/passive/dog/corgi,
	"Armadillo" = /mob/living/simple_mob/animal/passive/armadillo,
	"Racoon" = /mob/living/simple_mob/animal/passive/raccoon_ch,
	"Goose" = /mob/living/simple_mob/animal/space/goose,
	"Frog" = /mob/living/simple_mob/vore/aggressive/frog,
	"Dust jumper" = /mob/living/simple_mob/vore/alienanimals/dustjumper,
	"Dire wolf" = /mob/living/simple_mob/vore/wolf/direwolf,
	"Space bumblebee" = /mob/living/simple_mob/vore/bee,
	"Space bear" = /mob/living/simple_mob/animal/space/bear,
	"Otie" = /mob/living/simple_mob/vore/otie,
	"Mutated otie" =/mob/living/simple_mob/vore/otie/feral,
	"Red otie" = /mob/living/simple_mob/vore/otie/red,
	"Giant rat" = /mob/living/simple_mob/vore/aggressive/rat,
	"Giant snake" = /mob/living/simple_mob/vore/aggressive/giant_snake,
	"Hyena" = /mob/living/simple_mob/animal/hyena,
	"Space shark" = /mob/living/simple_mob/animal/space/shark,
	"Shantak" = /mob/living/simple_mob/animal/sif/shantak,
	"Kururak" = /mob/living/simple_mob/animal/sif/kururak,
	"Teppi" = /mob/living/simple_mob/vore/alienanimals/teppi,
	"Slug" = /mob/living/simple_mob/vore/slug,
	"Catslug" = /mob/living/simple_mob/vore/alienanimals/catslug,
	"Dust jumper" = /mob/living/simple_mob/vore/alienanimals/dustjumper,
	"Star treader" = /mob/living/simple_mob/vore/alienanimals/startreader,
	"Space ghost" = /mob/living/simple_mob/vore/alienanimals/spooky_ghost,
	"Space carp" = /mob/living/simple_mob/animal/space/carp,
	"Space jelly fish" = /mob/living/simple_mob/vore/alienanimals/space_jellyfish,
	"Abyss lurker" = /mob/living/simple_mob/vore/vore_hostile/abyss_lurker,
	"Abyss leaper" = /mob/living/simple_mob/vore/vore_hostile/leaper,
	"Gelatinous cube" = /mob/living/simple_mob/vore/vore_hostile/gelatinous_cube,
	"Panther" = /mob/living/simple_mob/vore/aggressive/panther,
	"Lizard man" = /mob/living/simple_mob/vore/aggressive/lizardman,
	"Pakkun" = /mob/living/simple_mob/vore/pakkun,
	"Synx" = /mob/living/simple_mob/animal/synx,
	"Jelly blob" = /mob/living/simple_mob/vore/jelly,
	"Voracious lizard" = /mob/living/simple_mob/vore/aggressive/dino,
	"Baby metroid" = /mob/living/simple_mob/metroid/juvenile/baby,
	"Super metroid" = /mob/living/simple_mob/metroid/juvenile/super,
	"Alpha metroid" = /mob/living/simple_mob/metroid/juvenile/alpha,
	"Gamma metroid" = /mob/living/simple_mob/metroid/juvenile/gamma,
	"Zeta metroid" = /mob/living/simple_mob/metroid/juvenile/zeta,
	"Omega metroid" = /mob/living/simple_mob/metroid/juvenile/omega,
	"Queen metroid" = /mob/living/simple_mob/metroid/juvenile/queen,
	"Xeno hunter" = /mob/living/simple_mob/animal/space/alien,
	"Xeno sentinel" = /mob/living/simple_mob/animal/space/alien/sentinel,
	"Xeno Praetorian" = /mob/living/simple_mob/animal/space/alien/sentinel/praetorian,
	"Xeno queen" = /mob/living/simple_mob/animal/space/alien/queen,
	"Xeno Empress" = /mob/living/simple_mob/animal/space/alien/queen/empress,
	"Xeno Queen Mother" = /mob/living/simple_mob/animal/space/alien/queen/empress/mother,
	"Defanged xeno" = /mob/living/simple_mob/vore/xeno_defanged,
	"Sect drone" = /mob/living/simple_mob/vore/sect_drone,
	"Sect queen" = /mob/living/simple_mob/vore/sect_queen,
	"Deathclaw" = /mob/living/simple_mob/vore/aggressive/deathclaw,
	"Great White Wolf" = /mob/living/simple_mob/vore/greatwolf,
	"Great Black Wolf" = /mob/living/simple_mob/vore/greatwolf/black,
	"Solar grub" = /mob/living/simple_mob/vore/solargrub,
	"Pitcher plant" = /mob/living/simple_mob/vore/pitcher_plant,
	"Red gummy kobold" = /mob/living/simple_mob/vore/candy/redcabold,
	"Blue gummy kobold" = /mob/living/simple_mob/vore/candy/bluecabold,
	"Yellow gummy kobold" = /mob/living/simple_mob/vore/candy/yellowcabold,
	"Marshmellow serpent" = /mob/living/simple_mob/vore/candy/marshmellowserpent,
	"Riftwalker" = /mob/living/simple_mob/vore/demon,
	"Wendigo" = /mob/living/simple_mob/vore/demon/wendigo,
	"Shadekin" = /mob/living/simple_mob/shadekin,
	"Catgirl" = /mob/living/simple_mob/vore/catgirl,
	"Wolfgirl" = /mob/living/simple_mob/vore/wolfgirl,
	"Lamia" = /mob/living/simple_mob/vore/lamia,
	"Corrupt hound" = /mob/living/simple_mob/vore/aggressive/corrupthound,
	"Corrupt corrupt hound" = /mob/living/simple_mob/vore/aggressive/corrupthound/prettyboi,
	"SWOOPIE XL" = /mob/living/simple_mob/vore/aggressive/corrupthound/swoopie,
	"Cultist Teshari" = /mob/living/simple_mob/humanoid/cultist/tesh,
	"Burning Mage" = /mob/living/simple_mob/humanoid/cultist/human/bloodjaunt/fireball,
	"Converted" = /mob/living/simple_mob/humanoid/cultist/noodle,
	"Cultist Teshari Mage" = /mob/living/simple_mob/humanoid/cultist/castertesh,
	"Monkey" = /mob/living/carbon/human/monkey,
	"Wolpin" = /mob/living/carbon/human/wolpin,
	"Sparra" = /mob/living/carbon/human/sparram,
	"Saru" = /mob/living/carbon/human/sergallingm,
	"Sobaka" = /mob/living/carbon/human/sharkm,
	"Farwa" = /mob/living/carbon/human/farwa,
	"Neaera" = /mob/living/carbon/human/neaera,
	"Stok" = /mob/living/carbon/human/stok,
	)