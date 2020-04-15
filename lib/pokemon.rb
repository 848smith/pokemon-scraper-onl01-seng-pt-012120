class Pokemon
  attr_accessor :name, :type, :db
  attr_reader :id
  
  def initialize(name, type, db, id)
    @name = name
    @type = type
    @db = db
    @id = id
  end
end
