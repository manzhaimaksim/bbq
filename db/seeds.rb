Event.destroy_all
User.destroy_all
Comment.destroy_all
Subscription.destroy_all

user_1 = User.create!(name: 'Mike', email: 'mmm@mm.mm', password: '123456')
user_2 = User.create!(name: 'Vadim', email: 'vvv@vv.vv', password: '123456')

event_1 = user_1.events.create!(title: 'Megaparty', description: 'girls and boys invited', address: 'Moscow', datetime: Time.now)
event_2 = user_2.events.create!(title: 'The end of the world', address: 'Earth', datetime: Time.now + 200.years)

comment_1 = event_1.comments.create!(body: 'Всем привет!', user_name: 'Иван')
comment_2 = event_1.comments.create!(body: 'Будет круто', user_name: 'Марина')
comment_3 = event_2.comments.create!(body: 'Скорей бы уже всех вас увидеть!', user_name: 'Олег')
comment_4 = event_2.comments.create!(body: 'А как туда доехать?', user_name: 'Максим')
comment_4 = event_2.comments.create!(body: 'Я опоздаю, сорян)', user_name: 'Иван')
