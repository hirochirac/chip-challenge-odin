package main

import "core:fmt"
import ry "vendor:raylib"
import sp "sprites"
import gm "menu"

TITLE :: "Chips Challenge"
HEIGHT :: 32 * sp.TILE_SIZE
WIDTH :: 2 * 16 * sp.TILE_SIZE

main :: proc() {

	ry.InitWindow(WIDTH, HEIGHT, TITLE)


	for (!ry.WindowShouldClose()) {
		ry.BeginDrawing()
		ry.ClearBackground(ry.BLACK)

		gm.draw_map_creator()

		ry.EndDrawing()
	}

	ry.CloseWindow()

}
