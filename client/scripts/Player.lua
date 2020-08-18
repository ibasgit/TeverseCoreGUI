local Player = {}

Player.Init = function()
    local Physics = teverse.construct("block", {
        position = vector3(0, -5, 0),
        scale = vector3(2, 3.5, 1),
        static = false,
    })


    local Camera = teverse.scene.camera

    spawn(function()
        while sleep(0) do
            local Rotation = Physics.rotation
            
            if Rotation.z > math.rad(30) or Rotation.z < math.rad(0) then
                local euler = Rotation:getEuler()
                Physics.rotation = quaternion.euler(euler.x, 0, euler.z)
            end
            
            if teverse.input:isKeyDown(enums.keys["KEY_W"]) then
                Physics.velocity = Physics.rotation * vector3(0, 0, 1)
            end

            if teverse.input:isKeyDown(enums.keys["KEY_S"]) then
                Physics.velocity = Physics.rotation * vector3(0, 0, -1)
            end

            if teverse.input:isKeyDown(enums.keys["KEY_A"]) then
                Physics.angularVelocity = vector3(0,-1,0)
            end

            if teverse.input:isKeyDown(enums.keys["KEY_D"]) then
                Physics.angularVelocity = vector3(0,1,0)
            end

            Camera.rotation = Physics.rotation
            Camera.position = Physics.position + Physics.rotation * vector3(0,5,-18)
        end
    end)
end

return Player