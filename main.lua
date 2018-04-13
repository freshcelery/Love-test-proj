-- our tiles
tile = {}
for i = 0, 3 do -- change 3 to the number of tile images minus 1.
    tile[i] = love.graphics.newImage("images/tile_" .. i .. ".png")
end

love.graphics.setNewFont(12)

-- map variables
map_w = 20
map_h = 20
map_x = 0
map_y = 0
map_offset_x = 0
map_offset_y = 0
map_display_w = 14
map_display_h = 10
tile_w = 20
tile_h = 20
map = {}

function randomize_map()
    for i = 1, (map_w) do
        map[i] = {}
        for z = 1, (map_h) do
            map[i][z] = math.random(3)
        end
    end
end

randomize_map()
print(map[19][19])
function draw_map()
    for y = 1, map_display_h do
        for x = 1, map_display_w do
            love.graphics.draw(
                tile[map[y + map_y][x + map_x]],
                (x * tile_w) + map_offset_x,
                (y * tile_h) + map_offset_y
            )
        end
    end
end

function love.keypressed(key, unicode)
    if key == "up" then
        map_y = map_y - 1
        if map_y < 0 then
            map_y = 0
        end
    end
    if key == "down" then
        map_y = map_y + 1
        if map_y > map_h - map_display_h then
            map_y = map_h - map_display_h
        end
    end

    if key == "left" then
        map_x = math.max(map_x - 1, 0)
    end
    if key == "right" then
        map_x = math.min(map_x + 1, map_w - map_display_w)
    end
end

function love.draw()
    draw_map()
end
