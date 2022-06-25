--[[
    DO NOT REUPLOAD WITHOUT MY PERMISSION
    Thank you for using my script

    ----

    Infinite will ignore:
    * AFK passive
    * Message (notification) settings, even if enabled - THIS EXCLUDES WELCOME MESSAGE
    * Time settings
    * Teleport

    It will start on join, non-configurable

    ----

    WARNING | TELEPORT IS UNTESTED.
    WARNING | THIS SCRIPT DOES NOT STOP VDM WHATSOEVER, PLEASE KEEP IN MIND
    WARNING | PASSIVE MODE ENABLES GODMODE, YOU SHOULD ONLY ALLOW AFK PASSIVE TO TRUSTED MEMBERS
    WARNING | This script may also have lots of bugs or issues, if so please DM me on Discord: asciidude#0001
]]--

config = {}

config.serverName = "Virginia State Roleplay"
config.infinite = false -- Infinitely enable peacetime upon join, heavily recommended against using


-- JOIN PASSIVE --
config.joinEnabled = true -- Enable or disable join passive
config.time = 120 * 100 -- Time in seconds (x * 100)

config.messageEnabled = true -- Determine if you'd like to show a message to the player about Peace Mode
config.message = "~r~You are in ~b~Passive Mode~r~, this will last ~b~2 minutes" -- The message to show the player

config.endMessageEnabled = true -- Notify the user when passive mode is disabled
config.endMessage = "~g~Passive Mode has been disabled, you can now resume roleplay" -- The message to show the player


-- TELEPORTATION --
config.teleportEnabled = false -- Teleport the player to somewhere on join, then either back or other coordinates on join
config.teleportCoordinates = "0,0,0" -- The coordinates to teleport to (seperate by ,)
config.teleportBackEnabled = true -- Determine if you want to enable teleporting back, if so this will ignore the second set of coordinates
config.teleportCoordinates2 = "0,0,0" -- The coordinates to teleport to when the join passive is done (once again, seperate by ,)


-- WELCOME MESSAGE --
config.welcomeEnabled = false -- Welcome the player upon joining
config.welcomeMessage = "~g~Welcome to " .. config.serverName


-- AFK PASSIVE --
config.AFKpassiveEnabled = true -- Enable or disable AFK passive, command-only (can't figure out automatic afk)

config.AFKpassiveCommand = "afk" -- The command to run AFK passive
config.enableACE = false -- Enable ACE permission for AFK passive (command.[the passive command])

config.AFKpassiveMessageEnabled = true -- Determines if you want a message to be shown to people when they use /afk
config.AFKpassiveEnabledMessage = "~g~You are now AFK" -- The message to show when enabled
config.AFKpassiveDisabledMessage = "~r~You are no longer AFK" -- The message to show when disabled
config.AFKpassiveFailureMessage = "~r~Unable to make you AFK!" -- The message will be shown when join passive is active