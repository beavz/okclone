json.(user,
  :id,
  :email,
  :username,
  :zip_code,
  :gender,
  :orientation,
  :ethnicity,
  :height,
  :body_type,
  :diet,
  :smokes,
  :drinks,
  :drugs,
  :religion,
  :sign,
  :education,
  :job,
  :income,
  :relationship_status,
  :relationship_type,
  :offspring,
  :pets,
  :min_age,
  :max_age,
  :looking_for_status,
  :is_looking_for_men,
  :is_looking_for_women,
  :is_looking_for_friends,
  :is_looking_for_ltdating,
  :is_looking_for_stdating,
  :is_looking_for_sexitimes,
  :essay1,
  :essay2,
  :essay3,
  :essay4,
  :essay5,
  :essay6,
  :essay7,
  :essay8,
  :avatar_id,
  :birthday
)

json.age (user.birthday)
json.location (("0" * (5 - user.zip_code.to_s.length)) + user.zip_code.to_s)

if user.avatar
  json.avatar user.avatar.image.url(:small)
else
  json.avatar asset_path("default_avatar.jpeg")
end

json.responses user.responses, partial: "api/responses/response", as: :response
json.albums user.albums, partial: "api/albums/album", as: :album

json.match user.get_match_percentage(current_user) * 100