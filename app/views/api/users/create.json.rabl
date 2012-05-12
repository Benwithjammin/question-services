object @user
attributes :id, :name, :email
node(:validation_errors) do |u|
  u.errors
end