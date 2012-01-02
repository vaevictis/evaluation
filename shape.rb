class Shape
  attr_accessor :dimension,
                :dimension_type,
                :perimeter

  def initialize(dimension)
    @dimension      = dimension.to_f
    @dimension_type = "side length"
  end

  def number_of_sides
    self.class::NUMBER_OF_SIDES || 0
  end

  def perimeter
    @dimension * number_of_sides
  end

  def output_sentence
    "A #{self.class.to_s.downcase} with #{dimension_type} #{@dimension.to_s} u has a perimeter of #{perimeter} u and an area of #{area} u^2"
  end
end

class Triangle < Shape
  NUMBER_OF_SIDES = 3

  # Triangle area :(b*h)/2
  # b == @dimension
  # Pythagore: h = sqrt(@dimension**2 - (@dimension/2)**2)
  def area
    (@dimension * sqrt(@dimension**2 - (@dimension/2)**2))/2
  end
end

class Square < Shape
  NUMBER_OF_SIDES = 4

  def area
    @dimension**2
  end
end

class Pentagon < Shape
  NUMBER_OF_SIDES = 5

  # source : wikipedia.org
  # http://en.wikipedia.org/wiki/Pentagon#Regular_pentagons
  def area
    @dimension**2 * sqrt(25+10* sqrt(5)) / 4
  end
end

class Circle < Shape
  PI      = 3.1415927
  # using radius just to have a nicer API
  def initialize(dimension)
    super(dimension)
    @dimension_type = "radius"
    @radius         = @dimension
  end

  def area
    PI * @radius**2
  end

  def perimeter
    2 * PI * @radius
  end
end