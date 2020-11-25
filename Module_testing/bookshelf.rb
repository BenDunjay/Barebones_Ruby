require_relative "stacklike"

class Book
  attr_reader :name

  def initialize(name)
    @name = name
    self.class.total_count += 1
    self.class.books << name
    if self.class.book_types[name]
      self.class.book_types[name] += 1
    else
      self.class.book_types[name] = 1
    end
  end

  def self.total_count
    @total_count ||= 0
  end

  def self.book_types
    @book_types ||= {}
  end

  def self.books
    @books ||= []
  end

  def self.book_types=(n)
    @book_types[n] = @book_types[n].length
  end

  def self.total_count=(n)
    @total_count = n
  end

  def self.books=(n)
    @books << n
  end
end

class Bookcase
  include Stacklike

  def put_book_on_shelf(book)
    print "Loading object "
    puts book.object_id
    add_to_stack(book)
  end

  def rent_out_book
    take_from_stack
  end
end

class Another < Book
end

ch = Bookcase.new
ac = Another.new("Another")
sc1 = Book.new("Ben")
sc2 = Book.new("Ben1")
sc3 = Book.new("Ben2")
sc4 = Book.new("Ben2")
sc5 = Book.new("Ben2")

bkb = Book.books
bkh = Book.book_types
bkc = Book.total_count
ac = Another.total_count
p bkc, bkh, ac, bkb

ch.put_book_on_shelf(sc1)
ch.put_book_on_shelf(sc2)
ch.put_book_on_shelf(sc3)

first_unloaded = ch.rent_out_book
print "The first suitcase off the plane is..."
puts first_unloaded.object_id

# class Car
#   @@makes = []
#   @@cars = {}
#   @@total_count = 0

#   attr_reader :make

#   def self.total_count
#     @@total_count
#   end

#   def self.add_make(make)
#     unless @@makes.include?(make)
#       @@makes << make
#       @@cars[make] = 0
#     end
#   end

#   def initialize(make)
#     if @@makes.include?(make)
#       puts "Creating a new #{make}!"
#       @make = make
#       @@cars[make] += 1
#       @@total_count += 1
#     else
#       raise "No such make: #{make}."
#     end
#   end

#   def make_mates
#     @@cars[self.make]
#   end
# end

# Car.add_make("Honda")
# Car.add_make("Honda")
# Car.add_make("Ford")
# h = Car.new("Honda")
# h2 = Car.new("Honda")
# f = Car.new("Ford")

# puts h.make_mates
# puts Car.total_count
