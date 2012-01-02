class Shape
  attr_accessor :dimension,
                :dimension_type,
                :perimeter

  def initialize(dimension)
    @dimension      = dimension.to_f
    @dimension_type = "side length"
  end

  def output_sentence
    "A #{self.class.to_s.downcase} with #{dimension_type} #{@dimension.to_s} u has a perimeter of #{perimeter} u and an area of #{area} u^2"
  end
end

class Triangle < Shape
  def perimeter
    @dimension * 3
  end

  # Triangle area :(b*h)/2
  # b == @dimension
  # Pythagore: h = sqrt(@dimension**2 - (@dimension/2)**2)
  def area
    (@dimension * sqrt(@dimension**2 - (@dimension/2)**2))/2
  end
end

class Square < Shape
  def perimeter
    @dimension * 4
  end

  def area
    @dimension**2
  end
end

class Pentagon < Shape
  def perimeter
    @dimension * 5
  end

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