Event.destroy_all
User.destroy_all

user_1 = User.create!(name: 'Mike', email: 'mmm@mm.mm', password: '123456')
user_2 = User.create!(name: 'Vadim', email: 'vvv@vv.vv', password: '123456')

user_1.events.create!(title: 'Megaparty', description: 'girls and boys invited', address: 'Moscow', datetime: Time.now)
user_2.events.create!(title: 'The end of the world', address: 'Earth', datetime: Time.now + 200.years)
