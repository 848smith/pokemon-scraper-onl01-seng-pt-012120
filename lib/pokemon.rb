class Pokemon
  attr_accessor :name, :type, :db
  attr_reader :id
  
  def initialize(name:, type:, db:, i:=nil)
    @name = name
    @type = type
    @db = db
    @id = id
  end
end
