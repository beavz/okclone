details = detail.pluralize


json.type :dropdown
json.label label
json.key detail
json.options do
  User.send(details.to_sym).each do |key, val|
    json.set!(key, t(key))
  end
end
