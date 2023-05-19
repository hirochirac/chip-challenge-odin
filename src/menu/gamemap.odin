package gamemap

import "core:fmt"
import ry "vendor:raylib"
import sp "../sprites"

draw_map_creator :: proc() {

    src: ry.Image = sp.load_tile_map(sp.TITLE_MAP)
	t: [sp.COL_MAP][sp.LIG_MAP]ry.Image = sp.get_textures_from_map()

	for l in 0 ..< sp.LIG_MAP {
		for c in 0 ..< sp.COL_MAP {
			sp.draw_tile(
				t[c][l],
				{f32(c * sp.TILE_SIZE), f32(l * sp.TILE_SIZE), sp.TILE_SIZE, sp.TILE_SIZE},
				{f32(c * sp.TILE_SIZE), f32(l * sp.TILE_SIZE), sp.TILE_SIZE, sp.TILE_SIZE},
			)
		}


		for l in 0 ..< sp.LIG_MAP {
			for c in 0 ..< sp.COL_MAP {
				ry.DrawRectangleLines(
					i32(c * sp.TILE_SIZE) + (16 * sp.TILE_SIZE),
					i32(l * sp.TILE_SIZE),
					i32(sp.TILE_SIZE),
					i32(sp.TILE_SIZE),
					ry.WHITE,
				)
			}
		}
	}

}
