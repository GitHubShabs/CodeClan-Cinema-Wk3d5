require('pg')
require_relative('../db/sql_runner')

class Film

  attr_reader :id, :directors_name


  def initialize(options)
    @id = options['id'].to_i if options['id']
    @directors_name = options['directors_name']
  end

  def save()
    db = PG.connect({ dbname: 'cinema', host: 'localhost' })
    sql = "INSERT INTO films
    (
    name
    )
    VALUES
    (
    $1
    )
    RETURNING *"
    values = [@directors_name]
    db.prepare("save", sql)
    @id = db.exec_prepared("save", values)[0]["id"].to_i
    db.close()
  end

  def update()
    db = PG.connect({ dbname: 'tickets', host: 'localhost' })
    sql = "UPDATE tickets
    SET
    (
      name
    ) =
    (
      $1
    )
    WHERE id = $2"
    values = [@directors_name, @id]
    db.prepare("update", sql)
    db.exec_prepared("update", values)
    db.close()
  end

  def delete()
    db = PG.connect({ dbname: 'cinema', host: 'localhost' })
    sql = "DELETE FROM films
    WHERE id = $1"
    values = [@id]
    db.prepare("delete", sql)
    db.exec_prepared("delete", values)
    db.close()
  end

  def self.find(id)
    db = PG.connect({ dbname: 'cinema', host: 'localhost' })
    sql = "SELECT * FROM tickets
    WHERE id = $1"
    values = [id]
    db.prepare("find", sql)
    results = db.exec_prepared("find", values)
    db.close()
    film_hash = results.first
    film = Film.new(film_hash)
    return film
  end

  def self.all()
    sql = "SELECT * FROM film"
    customers = SqlRunner.run(sql)
    return film.map { |film|
      Film.new(film) }
  end

  def self.delete_all()
    db = PG.connect({ dbname: 'cinema', host: 'localhost' })
    sql = "DELETE FROM film"
    db.prepare("delete_all", sql)
    db.exec_prepared("delete_all")
    db.close()
  end

  def film()

  end


end
