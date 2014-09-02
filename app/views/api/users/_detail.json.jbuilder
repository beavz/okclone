details = detail.pluralize


json.type :dropdown
json.label label
json.key detail
json.options User.send(details.to_sym) do |key, val|
  json.key key
  json.label t(key)
end
