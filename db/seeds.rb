Event.destroy_all
User.destroy_all
Comment.destroy_all
Subscription.destroy_all
Photo.destroy_all

user_1 = User.create!(name: 'bbb', email: 'maxbbb88@gmail.com', password: '123456')
user_2 = User.create!(name: 'Maks', email: 'bender23max@gmail.com', password: '123456')

event_1 = user_1.events.create!(title: 'Megaparty', description: 'Парни и девушки приходите!', address: 'Moscow', datetime: Time.now + 1.days)
event_2 = user_2.events.create!(title: 'The end of the world', address: 'Fargo', datetime: Time.now + rand(0..4).days)

comment_1 = event_1.comments.create!(body: 'Всем привет!', user_name: 'Иван')
comment_2 = event_1.comments.create!(body: 'Будет круто', user_name: 'Марина')
comment_3 = event_2.comments.create!(body: 'Скорей бы уже всех вас увидеть!', user_name: 'Олег')
comment_4 = event_2.comments.create!(body: 'А как туда доехать?', user_name: 'Максим')
comment_4 = event_2.comments.create!(body: 'Я опоздаю, сорян)', user_name: 'Иван')

subscription_1 = user_1.subscriptions.create!(event_id: event_2.id)
subscription_2 = user_2.subscriptions.create!(event_id: event_1.id)
