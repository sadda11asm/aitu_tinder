class MessageBlueprint < Blueprinter::Base
  identifier :id

  fields :text

  association :sender, blueprint: UserBlueprint
end