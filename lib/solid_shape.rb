class Solid_shape
  def volume
    raise NotImplementedError
  end
  def area
    raise NotImplementedError
  end
end

class Right_prism < Solid_shape
  attr_reader :polygon_base, :height
  def initialize(base, h)
    raise ArgumentError unless base.is_a? Polygon and h >= 0
    @polygon_base = base
    @height = h
  end
  def volume
    #TODO: implement volume for the right prism
    raise NotImplementedError
  end
  def area
    #TODO: implement area for the right prism
    raise NotImplementedError
  end
end

class Regular_hexagonal_prism < Right_prism
  def initialize(b, h)
    return super b, h if b.is_a? Regular_hexagon
    return super Regular_hexagon.new(b), h if b.is_a? Integer
    raise ArgumentError
  end
end

#TODO: implement the rest of the solid shapes