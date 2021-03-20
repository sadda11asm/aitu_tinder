class ChatBlueprint < Blueprinter::Base
  identifier :id

  association :user, blueprint: UserBlueprint do |chat, options|
    if options[:user] == chat.first_user
      chat.second_user
    else
      chat.first_user
    end
  end

  association :last_message, blueprint: MessageBlueprint
end