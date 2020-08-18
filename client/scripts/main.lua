local PlayerList = require("scripts/PlayerList.lua")
PlayerList.Init()

local Chat = require("scripts/Chat.lua")
Chat.Init()

--local Player = require("scripts/Player.lua")
--Player.Init()

teverse.scene.simulate = true

local light = teverse.construct("directionalLight", {
    rotation = quaternion.euler(math.rad(-45), math.rad(20), 0),
    colour = colour(5, 5, 5)
})

local base = teverse.construct("block", {
    position = vector3(0, -10, 0),
    rotation = quaternion(0, math.rad(120), 0),
    scale = vector3(300, 1, 300),
    colour = colour.rgb(255, 255, 255),
    static = true
})

teverse.construct("block", {
    position = vector3(0, -9, -1.2),
    rotation = quaternion(0, math.rad(120), 0),
    scale = vector3(8, .05, 300),
    colour = colour.rgb(255, 0, 64),
    static = true
})

teverse.construct("block", {
    position = vector3(0, -9, 0),
    rotation = quaternion(0, math.rad(120), 0),
    scale = vector3(300, .05, 8),
    colour = colour.rgb(255, 0, 64),
    static = true
})

teverse.scene.camera.position = base.position + base.rotation * vector3(0,8,4.5)
