package sprites

import "core:fmt"
import ry "vendor:raylib"
COL_MAP :: 16
LIG_MAP :: 32
TILE_SIZE :: 32
TOTAL_IMG_MAP :: (16 * 32) + 1
TITLE_MAP :: "../assets/chipchallenge-win3-2.png"

/**
*
**/
getSprites :: proc(file_name: cstring) -> ry.Texture2D {
	t: ry.Texture2D = ry.LoadTexture(file_name)
	return t
}

/**
*
*/
load_tile_map :: proc(file_name: cstring) -> ry.Image {
	t: ry.Image = ry.LoadImage(file_name)
	return t
}


/**
*
*/
draw_tile :: proc(i: ry.Image, source: ry.Rectangle, distination: ry.Rectangle) {
	t: ry.Texture2D = ry.LoadTextureFromImage(i)
	ry.DrawTexturePro(t, source, distination, ry.Vector2{0, 0}, 0, ry.WHITE)
}

/**
*
**/
get_textures_from_map :: proc() -> [COL_MAP][LIG_MAP]ry.Image {

	images: [COL_MAP][LIG_MAP]ry.Image
	quad := load_tile_map(TITLE_MAP)

	for l in 0 ..< LIG_MAP {
		for c in 0 ..< COL_MAP {
			images[c][l] = ry.ImageFromImage(
				quad,
				{f32(c * TILE_SIZE), f32(l * TILE_SIZE), f32(TILE_SIZE), f32(TILE_SIZE)},
			)
		}
	}

	return images
}
