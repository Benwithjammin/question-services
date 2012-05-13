object @user
attributes :id, :name, :email
node(:validation_errors, unless: -> u { u == nill }) do |u|
  u.errors
end