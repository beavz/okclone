json.(picture, :id, :caption, :album_id)
json.small_img picture.image.url(:small)
json.full_img picture.image.url(:full)