require_relative "user.rb"

class Teacher < User
  def initialize(name, age, subject)
    super(name, age)
    @subject = subject
  end

  puts "self is #{self}"

  def m
    puts "self is #{self}"
  end
end

t = Teacher.new("Ben", 20, "English")
u = User.new
p t, u

puts "Top Level"
puts "self is #{self}"
