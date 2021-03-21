class UserTagBlueprint < Blueprinter::Base
  identifier :id

  association :tag, blueprint: TagBlueprint

end