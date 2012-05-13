object @user
attributes :id, :name, :email
node(:validation_errors, unless: -> u { u == nil }) do |u|
  u.errors
end