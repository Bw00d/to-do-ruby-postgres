class List
	def initialize(name)
		@name = name
	end

	def name
		@name
	end

  def self.all
    results = DB.exec("SELECT * FROM lists;")
    lists = []
    results.each do |result|
      name = result['name']
      lists << List.new(name)
    end
    lists
  end

  def save
    DB.exec("INSERT INTO list (name) VALUES ('#{@name}');")
  end
end

