json.(user,
  :id,
  :username,
  :age,
  :zip_code,
  :gender,
  :avatar_id,
)

if user.avatar
  json.avatar user.avatar.image.url(:small)
end
