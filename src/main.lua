---@meta _
---@diagnostic disable

-- grabbing our dependencies,
-- these funky (---@) comments are just there
--	 to help VS Code find the definitions of things

---@diagnostic disable-next-line: undefined-global
local mods = rom.mods

---@module 'SGG_Modding-ENVY-auto'
mods['SGG_Modding-ENVY'].auto()
-- ^ this gives us `public` and `import`, among others
--	and makes all globals we define private to this plugin.
---@diagnostic disable: lowercase-global

---@diagnostic disable-next-line: undefined-global
rom = rom
---@diagnostic disable-next-line: undefined-global
_PLUGIN = PLUGIN

---@module 'SGG_Modding-Hades2GameDef-Globals'
game = rom.game

---@module 'SGG_Modding-ModUtil'
modutil = mods['SGG_Modding-ModUtil']

---@module 'SGG_Modding-Chalk'
chalk = mods["SGG_Modding-Chalk"]
---@module 'SGG_Modding-ReLoad'
reload = mods['SGG_Modding-ReLoad']

---@module 'config'
config = chalk.auto()
-- ^ this updates our config.toml in the config folder!
public.config = config -- so other mods can access our config

local function on_ready()
    -- what to do when we are ready, but not re-do on reload.
    if config.enabled == false then return end
    game.GlobalVoiceLines.PoseidonDoubleRewardReactionLines =
    {
        {
            BreakIfPlayed = true,
            RandomRemaining = true,
            PreLineWait = 0.25,
            Source = { LineHistoryName = "NPC_Poseidon_01", SubtitleColor = game.Color.PoseidonVoice },
            GameStateRequirements =
            {
                --
            },
            { Cue = "/VO/Poseidon_0202", Text = "{#Emph}Hahaha{#Prev}, yes!", PlayFirst = true },
            { Cue = "/VO/Poseidon_0202", Text = "{#Emph}Hahaha{#Prev}, yes!", PlayFirst = true },
            { Cue = "/VO/Poseidon_0202", Text = "{#Emph}Hahaha{#Prev}, yes!" },
            { Cue = "/VO/Poseidon_0202", Text = "{#Emph}Hahaha{#Prev}, yes!" },
            { Cue = "/VO/Poseidon_0202", Text = "{#Emph}Hahaha{#Prev}, yes!" },
            { Cue = "/VO/Poseidon_0202", Text = "{#Emph}Hahaha{#Prev}, yes!" },
        },
    }
end

-- IDK if we need this but i don't think it hurts anything?
local function on_reload()
    if config.enabled == false then return end
    game.GlobalVoiceLines.PoseidonDoubleRewardReactionLines =
    {
        {
            BreakIfPlayed = true,
            RandomRemaining = true,
            PreLineWait = 0.25,
            Source = { LineHistoryName = "NPC_Poseidon_01", SubtitleColor = game.Color.PoseidonVoice },
            GameStateRequirements =
            {
                --
            },
            { Cue = "/VO/Poseidon_0202", Text = "{#Emph}Hahaha{#Prev}, yes!", PlayFirst = true },
            { Cue = "/VO/Poseidon_0202", Text = "{#Emph}Hahaha{#Prev}, yes!", PlayFirst = true },
            { Cue = "/VO/Poseidon_0202", Text = "{#Emph}Hahaha{#Prev}, yes!" },
            { Cue = "/VO/Poseidon_0202", Text = "{#Emph}Hahaha{#Prev}, yes!" },
            { Cue = "/VO/Poseidon_0202", Text = "{#Emph}Hahaha{#Prev}, yes!" },
            { Cue = "/VO/Poseidon_0202", Text = "{#Emph}Hahaha{#Prev}, yes!" },
        },
    }
end

-- this allows us to limit certain functions to not be reloaded.
local loader = reload.auto_single()

-- this runs only when modutil and the game's lua is ready
modutil.once_loaded.game(function()
    loader.load(on_ready, on_reload)
end)
