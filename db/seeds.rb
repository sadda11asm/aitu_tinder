# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alngside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# TopicRoom.all.delete_all
# TopicTag.all.delete_all
# Tag.all.delete_all
# Topic.all.delete_all
# HacknuUser.all.delete_all
Tag.create!(name: 'Футбол') # 1
Tag.create!(name: 'Фильмы') # 2
Tag.create!(name: 'Сериалы') # 3
Tag.create!(name: 'Рестораны') # 4
Tag.create!(name: 'Путешествия') # 5
Tag.create!(name: 'ТВ') # 6
Tag.create!(name: 'Сегодня') # 7
Tag.create!(name: 'Свежее') # 8
Tag.create!(name: 'Нетфликс') # 9
Tag.create!(name: 'Деньги') # 10
Tag.create!(name: 'Секс') # 11
Tag.create!(name: 'Здоровье') # 12
Topic.create!(name: 'Бриджертоны') # 1
Topic.create!(name: 'Жеребьёвка Лиги Чемпионов') # 2
Topic.create!(name: 'отношения Алекса и Джей Ло') # 3
Topic.create!(name: 'Джинни и Джорджия') # 4
Topic.create!(name: 'Барселона - ПСЖ') # 5
Topic.create!(name: 'Эфир, криптовалюты') # 6
Topic.create!(name: 'A life in a Year - хочу плакать 😭') # 7
Topic.create!(name: 'Отжимания') # 8
Topic.create!(name: 'Основы секса') # 9
Topic.create!(name: 'Открыть стартап') # 10
Topic.create!(name: 'Как выиграть хакатон') # 11
TopicTag.create!(topic_id: 1, tag_id: 3)
TopicTag.create!(topic_id: 1, tag_id: 9)
TopicTag.create!(topic_id: 1, tag_id: 11)
TopicTag.create!(topic_id: 2, tag_id: 1)
TopicTag.create!(topic_id: 2, tag_id: 6)
TopicTag.create!(topic_id: 2, tag_id: 7)
TopicTag.create!(topic_id: 3, tag_id: 7)
TopicTag.create!(topic_id: 3, tag_id: 8)
TopicTag.create!(topic_id: 3, tag_id: 11)
TopicTag.create!(topic_id: 3, tag_id: 2)
TopicTag.create!(topic_id: 4, tag_id: 1)
TopicTag.create!(topic_id: 4, tag_id: 6)
TopicTag.create!(topic_id: 4, tag_id: 7)
TopicTag.create!(topic_id: 4, tag_id: 8)
TopicTag.create!(topic_id: 5, tag_id: 1)
TopicTag.create!(topic_id: 5, tag_id: 10)
TopicTag.create!(topic_id: 6, tag_id: 10)
TopicTag.create!(topic_id: 6, tag_id: 7)
TopicTag.create!(topic_id: 7, tag_id: 7)
TopicTag.create!(topic_id: 7, tag_id: 8)
TopicTag.create!(topic_id: 7, tag_id: 9)
TopicTag.create!(topic_id: 8, tag_id: 12)
TopicTag.create!(topic_id: 9, tag_id: 11)
TopicTag.create!(topic_id: 9, tag_id: 8)
TopicTag.create!(topic_id: 10, tag_id: 10)
TopicTag.create!(topic_id: 10, tag_id: 7)
TopicTag.create!(topic_id: 11, tag_id: 7)
TopicTag.create!(topic_id: 11, tag_id: 8)
TopicTag.create!(topic_id: 11, tag_id: 10)
TopicTag.create!(topic_id: 11, tag_id: 11)
TopicTag.create!(topic_id: 11, tag_id: 12)
HacknuUser.create!(aitu_id: 1, name: 'Саддам', lastname: 'Асматуллаев', age: 22,
                   lat: '43.229910', lng: '76.933229', gender: 'man', city: 'Алматы') # 1
HacknuUser.create!(aitu_id: 2, name: 'Мэр', lastname: 'Нургалиева', age: 22,
                   lat: '43.229910', lng: '76.933239', gender: 'woman', city: 'Алматы') # 2
HacknuUser.create!(aitu_id: 3, name: 'Нурс', lastname: 'Персик', age: 22,
                   lat: '43.229920', lng: '76.933229', gender: 'man', city: 'Алматы') # 3
HacknuUser.create!(aitu_id: 4, name: 'Даке', lastname: 'Качок', age: 22,
                   lat: '43.229910', lng: '76.933221', gender: 'man', city: 'Алматы') # 4
HacknuUser.create!(aitu_id: 5, name: 'Аблан', lastname: 'КТЛ', age: 22,
                   lat: '43.229915', lng: '76.933229', gender: 'man', city: 'Алматы') # 5
HacknuUser.create!(aitu_id: 6, name: 'Адлет', lastname: 'Котлет', age: 22,
                   lat: '43.229911', lng: '76.933329', gender: 'man', city: 'Алматы') # 6
HacknuUser.create!(aitu_id: 7, name: 'Алмас', lastname: 'Лётчик', age: 22,
                   lat: '43.224910', lng: '76.933249', gender: 'man', city: 'Алматы') # 7
HacknuUser.create!(aitu_id: 2, name: 'Ирина', lastname: 'Нургали', age: 21,
                   lat: '43.229910', lng: '76.933239', gender: 'woman', city: 'Алматы') # 2
HacknuUser.create!(aitu_id: 2, name: 'Алия', lastname: 'Шапиева', age: 24,
                   lat: '43.229910', lng: '76.933239', gender: 'woman', city: 'Алматы') # 2
HacknuUser.create!(aitu_id: 2, name: 'Алина', lastname: 'Сатиева', age: 24,
                   lat: '43.229910', lng: '76.933239', gender: 'woman', city: 'Алматы') # 2
HacknuUser.create!(aitu_id: 2, name: 'Малика', lastname: 'Карова', age: 24,
                   lat: '43.229910', lng: '76.933239', gender: 'woman', city: 'Алматы') # 2
HacknuUser.create!(aitu_id: 2, name: 'София', lastname: 'Масова', age: 19,
                   lat: '43.229910', lng: '76.933239', gender: 'woman', city: 'Алматы') # 2
HacknuPreference.create!(user_id: 1, min_age: 10, max_age: 25, distance: 25000) # 1
HacknuPreference.create!(user_id: 2, min_age: 10, max_age: 25, distance: 25000) # 1
HacknuPreference.create!(user_id: 3, min_age: 10, max_age: 25, distance: 25000) # 1
HacknuPreference.create!(user_id: 4, min_age: 10, max_age: 25, distance: 25000) # 1
HacknuPreference.create!(user_id: 5, min_age: 10, max_age: 25, distance: 25000) # 1
HacknuPreference.create!(user_id: 6, min_age: 10, max_age: 25, distance: 25000) # 1
HacknuPreference.create!(user_id: 7, min_age: 10, max_age: 25, distance: 25000) # 1
TopicRoom.create!(user_id: 1, topic_id: 11)
TopicRoom.create!(user_id: 1, topic_id: 10)
TopicRoom.create!(user_id: 1, topic_id: 3)
TopicRoom.create!(user_id: 1, topic_id: 3)
TopicRoom.create!(user_id: 2, topic_id: 1)
TopicRoom.create!(user_id: 2, topic_id: 1)
TopicRoom.create!(user_id: 2, topic_id: 2)
TopicRoom.create!(user_id: 2, topic_id: 5)
TopicRoom.create!(user_id: 2, topic_id: 3)
TopicRoom.create!(user_id: 2, topic_id: 6)
TopicRoom.create!(user_id: 3, topic_id: 7)
TopicRoom.create!(user_id: 3, topic_id: 8)
TopicRoom.create!(user_id: 3, topic_id: 7)
TopicRoom.create!(user_id: 3, topic_id: 4)
TopicRoom.create!(user_id: 3, topic_id: 1)
TopicRoom.create!(user_id: 4, topic_id: 2)
TopicRoom.create!(user_id: 4, topic_id: 11)
TopicRoom.create!(user_id: 4, topic_id: 10)
TopicRoom.create!(user_id: 4, topic_id: 7)
TopicRoom.create!(user_id: 4, topic_id: 6)
TopicRoom.create!(user_id: 5, topic_id: 5)
TopicRoom.create!(user_id: 5, topic_id: 4)
TopicRoom.create!(user_id: 5, topic_id: 8)
TopicRoom.create!(user_id: 5, topic_id: 7)
TopicRoom.create!(user_id: 5, topic_id: 11)
TopicRoom.create!(user_id: 6, topic_id: 1)
TopicRoom.create!(user_id: 6, topic_id: 2)
TopicRoom.create!(user_id: 6, topic_id: 5)
TopicRoom.create!(user_id: 6, topic_id: 4)
TopicRoom.create!(user_id: 6, topic_id: 3)
TopicRoom.create!(user_id: 7, topic_id: 1)
TopicRoom.create!(user_id: 7, topic_id: 9)
TopicRoom.create!(user_id: 7, topic_id: 10)
Chat.create!(first_user_id: 1, second_user_id: 2)
Chat.create!(first_user_id: 1, second_user_id: 3)
Message.create!(chat_id: 1, sender_id: 1, text: 'Салам Данекер!')
Message.create!(chat_id: 1, sender_id: 2, text: 'Уалейкум Ассалам Нурс!')
Message.create!(chat_id: 2, sender_id: 1, text: 'Салам Данекер!')
Message.create!(chat_id: 2, sender_id: 3, text: 'Уалейкум Ассалам Даулет!')





