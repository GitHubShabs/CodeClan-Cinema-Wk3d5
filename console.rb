require("pry")
require_relative("../models/film")
require_relative('../models/ticket')

Film.delete_all()
Ticket.delete_all()


film1 = Film.new({ 'Star Wars' => 'George Lucas'})
film1.save

film2 = Film.new({ 'Romeo & Juliet' => 'Baz Luhrmann'})
film2.save

ticket1 = Ticket.new({
  'customer' => 'Mary',
  'customer_id' => customer1.id
  })
order1.save

binding.pry
nil
