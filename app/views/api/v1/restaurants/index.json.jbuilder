# Gets id, name and address from restaurants array.
# builds json array.
# Docs https://github.com/rails/jbuilder
# Change data served in this view. 

json.array! @restaurants do |restaurant|
  json.extract! restaurant, :id, :name, :address
end
