class UserBlueprint < Blueprinter::Base
  identifier :id

  fields :name, :aitu_id, :age, :city, :avatar_url

  association :user_tags, blueprint: UserTagBlueprint
end