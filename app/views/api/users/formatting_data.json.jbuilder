json.current_essays current_essays do |essay_key|
  json.key essay_key
  json.text t( essay_key )
end

json.details do
  json.gender { json.partial! "detail", detail: "gender", label: "Gender" }
  json.orientation { json.partial! "detail", detail: "orientation", label: "Orientation"}
  json.ethnicity { json.partial! "detail", detail: "ethnicity", label: "Ethnicity"}

  json.height do
    json.type :height
    json.label "Height"
  end

  json.body_type { json.partial! "detail", detail: "body_type", label: "Body type"}
  json.diet { json.partial! "detail", detail: "diet", label: "Diet"}
  json.smokes { json.partial! "detail", detail: "smokes", label: "Smokes"}
  json.drinks { json.partial! "detail", detail: "drinks", label: "Drinks"}
  json.drugs { json.partial! "detail", detail: "drugs", label: "Does drugs"}
  json.religion { json.partial! "detail", detail: "religion", label: "Religion"}
  json.sign { json.partial! "detail", detail: "sign", label: "Astrological sign"}
  json.eduction { json.partial! "detail", detail: "education", label: "Education"}
  json.job { json.partial! "detail", detail: "job", label: "Job"}
  json.income { json.partial! "detail", detail: "income", label: "Income"}
  json.relationship_status { json.partial! "detail", detail: "relationship_status", label: "Relationship status"}
  json.relationship_type { json.partial! "detail", detail: "relationship_type", label: "Relationship type"}
  json.offspring { json.partial! "detail", detail: "offspring", label: "Children"}
  json.pets { json.partial! "detail", detail: "pets", label: "Pets"}

  json.looking_for do
    json.type :subtitle
    json.label "Looking for:"
  end

  json.age_range do
    json.type :age_range
    json.label "Age"
  end

  json.looking_for_status { json.partial! "detail", detail: "looking_for_status", label: "Status"}

  json.looking_for_gender do
    json.type :radio
    json.label "Gender"
    json.options do
      json.set!( :is_looking_for_men, t( :is_looking_for_men ))
      json.set!( :is_looking_for_women, t( :is_looking_for_women ))
    end
  end

  json.looking_for_activities do
    json.type :radio
    json.label "For"
    json.options do
      json.set!( :is_looking_for_friends, t( :is_looking_for_friends ))
      json.set!( :is_looking_for_stdating, t( :is_looking_for_stdating ))
      json.set!( :is_looking_for_ltdating, t( :is_looking_for_ltdating ))
      json.set!( :is_looking_for_sexitimes, t( :is_looking_for_sexitimes ))

    end
  end

end

