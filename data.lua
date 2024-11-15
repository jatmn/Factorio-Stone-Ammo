--
-- Thanks to ZwerOxotnik for help with code optimizations here.
--
--

local j_sa_kb_behaviour = settings.startup["j_sa_kb_behaviour"].value
local j_sa_stone = settings.startup["j_sa_stone"].value
local j_sa_size = settings.startup["j_sa_size"].value
local j_sa_clips = settings.startup["j_sa_clips"].value
local j_sa_damage = settings.startup["j_sa_damage"].value

local item_sounds = require("__base__.prototypes.item_sounds")


data:extend({
  {
		type = "recipe",
		name = "j_cheap_stone_ammo_recipe",
		category = "crafting",
		enabled = true,
    hidden = false,
		energy_required = 0.5,
		ingredients = {
		  {type = "item", name = "stone", amount = j_sa_stone},
		},
		results = 
    {
			{type = "item", name = "j_cheap_stone_ammo", amount = j_sa_clips},	
		},
  },
})


local j_cheap_stone_ammo = {
  type = "ammo",
  name = "j_cheap_stone_ammo",
  icon = "__jatmn_stone_ammo__/graphics/icons/Stone-firearm-magazine.png",
  icon_size = 64,
  icon_mipmaps = 4,
  ammo_category = "bullet",
  ammo_type = {
    action = {{
      type = "direct",
      action_delivery = {{
        type = "instant",
        source_effects = {{ type = "create-explosion", entity_name = "explosion-gunshot" }},
        target_effects = {
          {
            type = "create-entity",
            entity_name = "explosion-hit",
            offsets = {{ 0, 1 }},
            offset_deviation = {{ -0.5, -0.5 }, { 0.5, 0.5 }}
          },
          {type = "damage", damage = {amount = j_sa_damage, type = "physical"}},
        }
      }}
    }}
  },
  magazine_size = j_sa_size,
  subgroup = "ammo",
  order = "a[basic-clips]-a[firearm-magazine]",
  inventory_move_sound = item_sounds.ammo_small_inventory_move,
  pick_sound = item_sounds.ammo_small_inventory_pickup,
  drop_sound = item_sounds.ammo_small_inventory_move,
  stack_size = 200,
  weight = 5*kg
}
if j_sa_kb_behaviour == "Knockback" then
  local target_effects = j_cheap_stone_ammo.ammo_type.action[1].action_delivery[1].target_effects
  target_effects[#target_effects + 1] = { type = "push-back", distance = 3 }
end

data:extend({ j_cheap_stone_ammo })