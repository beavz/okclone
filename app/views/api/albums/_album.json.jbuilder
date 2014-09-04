json.(album, :id, :name, :user_id)

json.pictures album.pictures, partial: "api/pictures/picture", as: :picture
