package main

import "core:fmt"
import ry "vendor:raylib"
import sp "sprites"

TITLE :: "Chips Challenge"
HEIGHT :: 1024
WIDTH :: 2000

main :: proc() {

	ry.InitWindow(WIDTH, HEIGHT, TITLE)

	src: ry.Image = sp.load_tile_map(sp.TITLE_MAP)
	t: [sp.COL_MAP][sp.LIG_MAP]ry.Image = sp.get_textures_from_map()

	for (!ry.WindowShouldClose()) {
		ry.BeginDrawing()
		ry.ClearBackground(ry.BLACK)

		for l in 0 ..< sp.LIG_MAP {
			for c in 0 ..< sp.COL_MAP {
				sp.draw_tile(
					t[c][l],
					{f32(c * sp.TILE_SIZE), f32(l * sp.TILE_SIZE), sp.TILE_SIZE, sp.TILE_SIZE},
					{f32(c * sp.TILE_SIZE), f32(l * sp.TILE_SIZE), sp.TILE_SIZE, sp.TILE_SIZE},
				)
			}
		}

		ry.EndDrawing()
	}

	ry.CloseWindow()

}
