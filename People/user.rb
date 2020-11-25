class User
  attr_accessor :name, :age

  def initialize(name = "Doe", age = 20)
    @name = name
    @age = age
  end
end
