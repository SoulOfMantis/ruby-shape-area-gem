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
    @polygon_base.area * @height
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

class Sphere < Solid_shape
  def initialize(r)
    raise ArgumentError unless r.is_a?(Numeric) and r >= 0
    @radius = r
  end
  def volume
    (4.0/3.0) * Math::PI * (@radius**3)
  end
end

class Cube < Right_prism
  def initialize(side)
    raise ArgumentError unless side.is_a?(Numeric) and side >= 0
    @side = side
  end
  def volume
    @side**3
  end
end

class Right_cuboid < Right_prism
  def initialize(w, l, h)
    raise ArgumentError unless [w, l, h].all? { |arg| arg.is_a?(Numeric) && arg >= 0 }
    super(Rectangle.new(w, l), h)
  end
end

class Cone < Solid_shape
  def initialize(circle, h)
    raise ArgumentError unless circle.is_a? Circle and h.is_a?(Numeric) and h >= 0
    @base = circle
    @height = h
  end
  def volume
    (@base.area * @height)/ 3.0
  end
end

class Pyramid < Solid_shape
  attr_reader :base, :height
  def initialize(polygon, h)
    raise ArgumentError unless polygon.is_a? Polygon and h.is_a?(Numeric) and h >= 0
    @base = polygon
    @height = h
  end
  def volume 
    (@base.area * @height) / 3.0
  end
end

class RightPrism < Solid_shape
  attr_reader :polygon_base, :height
  def initialize(base, h)
    raise ArgumentError unless base.is_a? Polygon and h.is_a?(Numeric) and h >= 0
    @polygon_base = base
    @height = h
  end
  def volume
    @polygon_base.area * @height
  end
end

class EllipticalCylinder < Solid_shape
  attr_reader :base, :height
  def initialize(semi_major, semi_minor, h)
    raise ArgumentError unless [semi_major, semi_minor, h].all? { |arg| arg.is_a?(Numeric) && arg >= 0 }
    
    @base = Ellipse.new(semi_major, semi_minor)
    @height = h
  end
  def volume 
    @base.area * @height
  end
end

class TrapezoidalPrism < RightPrism
  def initialize(base1, base2, base_height, prism_height)
    raise ArgumentError unless [base1, base2, base_height, prism_height].all? { |arg| arg.is_a?(Numeric) && arg >= 0 }
    super(Trapezoid.new(base1, base2, base_height), prism_height)
  end
end

class RightParallelepiped < RightPrism
  def initialize(base_side, base_height, prism_height)
    raise ArgumentError unless [base_side, base_height, prism_height].all? { |arg| arg.is_a?(Numeric) && arg >= 0 }
    super(Paralelogram.new(base_side, base_height, 0), prism_height)
  end
end

class RightRhombicPrism < RightPrism
  def initialize(diagonal_a, diagonal_b, height)
    raise ArgumentError unless [diagonal_a, diagonal_b, height].all? { |arg| arg.is_a?(Numeric) && arg >= 0 }
    super(Rhombus.new(diagonal_a, diagonal_b), height)
  end
end

class RegularTetrahedron < Solid_shape
  def initialize(side)
    raise ArgumentError unless side.is_a?(Numeric) && side >= 0
    @side = side
    @base = Tringl.new(side, side, side)
  end
  def volume
    (@side**3) / (6 * Math.sqrt(2))
  end
end
