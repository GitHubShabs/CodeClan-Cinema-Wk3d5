require('pg')
require_relative('../db/sql_runner')
require_relative('film')
require_relative('cinema')

class Ticket

  attr_accessor :customer_name, :film_id
  attr_reader :id

  def initialize(options)
    @customer_name = options['customer_name']
    @id = options['id'].to_i if options['id']
    @customer_id = options['customer_id'].to_i
  end


  def customer()
    sql = "SELECT * FROM customers WHERE id = $1"
    values = [@customer_id]
    result = SqlRunner.run(sql, values)
    customer_hash = result[0]
    return Customer.new( customer_hash)
    # above linking film with customer.
  end





end
