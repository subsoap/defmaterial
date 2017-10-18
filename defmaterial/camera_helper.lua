local M = {}


M.window_width = 16
M.window_height = 9

-- Give camera init data
local cam_lookat = vmath.vector3(0.0,0.0,0.0)
local cam_pos = vmath.vector3(-3.0,3.0,1.0)
local cam_up = vmath.vector3(0,1,0)
local view_matrix = vmath.matrix4_look_at(cam_pos, cam_lookat, cam_up)
local fov = (math.pi / 180.0) * 60.0 -- 60 degrees
local proj_matrix = vmath.matrix4_perspective(fov, M.window_width / M.window_height, 0.1, 100.0)
M.view_matrix = view_matrix
M.proj_matrix = proj_matrix

return M