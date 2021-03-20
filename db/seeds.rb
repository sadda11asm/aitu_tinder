# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
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





