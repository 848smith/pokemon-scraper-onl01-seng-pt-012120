require 'pry'
class Pokemon
  attr_accessor :name, :type, :db
  attr_reader :id
  
  def initialize(name:, type:, db:, id:nil)
    @name = name
    @type = type
    @db = db
    @id = id
  end
  
  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type) VALUES (?, ?)
      SQL
    db.execute(sql, name, type)
    @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end
  
  def self.find(id, db)
    sql = <<-SQL
      SELECT * FROM pokemon WHERE id = ?
      SQL
    pokemon = db.execute(sql, id)
    id = pokemon[0][0]
    name = pokemon[0][1]
    type = pokemon[0][2]
    new_pokemon = Pokemon.new(name: name, type: type, db: db, id: id)
  end
end
