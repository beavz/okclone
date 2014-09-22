json.(user,
  :id,
  :username,
  :zip_code,
  :gender,
  :avatar_id,
)

json.age user.birthday

if user.avatar
  json.avatar user.avatar.image.url(:small)
else
  json.avatar asset_path("default_avatar.jpeg")
end

json.location (("0" * (5 - user.zip_code.to_s.length)) + user.zip_code.to_s)