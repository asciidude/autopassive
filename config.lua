--[[
    DO NOT REUPLOAD WITHOUT MY PERMISSION
    Thank you for using my script
]]--

config = {}

config.serverName = "Virginia State Roleplay"

config.enabled = true -- Enable or disable the plugin
config.time = 120 * 100 -- Time in seconds (x * 100)

config.messageEnabled = true -- Determine if you'd like to show a message to the player about Peace Mode
config.message = "~r~You are in ~b~Passive Mode~r~, this will last ~b~2 minutes" -- The message to show the player

config.endMessageEnabled = true -- Notify the user when passive mode is disabled
config.endMessage = "~g~Passive Mode has been disabled, you can now resume roleplay" -- The message to show the player

config.welcomeEnabled = false -- Welcome the player upon joining
config.welcomeMessage = "~g~Welcome to " .. config.serverName