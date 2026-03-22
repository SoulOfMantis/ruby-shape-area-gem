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
    raise ArgumentError unless base.is_a? Polygon and h.is_a?(Numeric) and h >= 0
    @polygon_base = base
    @height = h
  end
  def volume
    @polygon_base.area * @height
  end
end

# Шестиугольная призма
class Regular_hexagonal_prism < Right_prism
  def initialize(side, h)
    if side.is_a?(Numeric)
      super(Regular_hexagon.new(side), h)
    elsif side.is_a?(Regular_hexagon)
      super(side, h)
    else
      raise ArgumentError
    end
  end
end

# Сфера
class Sphere < Solid_shape
  def initialize(r)
    raise ArgumentError unless r.is_a?(Numeric) and r >= 0
    @radius = r
  end
  def volume
    (4.0/3.0) * Math::PI * (@radius**3)
  end
end

# Куб
class Cube < Right_prism
  def initialize(side)
    raise ArgumentError unless side.is_a?(Numeric) and side >= 0
    super(Square.new(side), side)
  end
end

# Прямоугольный параллелепипед
class Right_cuboid < Right_prism
  def initialize(w, l, h)
    raise ArgumentError unless [w, l, h].all? { |arg| arg.is_a?(Numeric) && arg >= 0 }
    super(Rectangle.new(w, l), h)
  end
end

# Конус
class Cone < Solid_shape
  def initialize(circle, h)
    raise ArgumentError unless circle.is_a? Circle and h.is_a?(Numeric) and h >= 0
    @base = circle
    @height = h
  end
  def volume
    (@base.area * @height) / 3.0
  end
end

# Пирамида
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

# Эллиптический цилиндр
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

# Трапециевидная призма
class TrapezoidalPrism < Right_prism
  def initialize(base1, base2, side1, side2, base_height, prism_height)
    raise ArgumentError unless [base1, base2, side1, side2, base_height, prism_height].all? { |arg| arg.is_a?(Numeric) && arg >= 0 }
    super(Trapezoid.new(base1, base2, side1, side2, base_height), prism_height)
  end
end


# Ромбическая призма
class RightRhombicPrism < Right_prism
  def initialize(diagonal_a, diagonal_b, height)
    raise ArgumentError unless [diagonal_a, diagonal_b, height].all? { |arg| arg.is_a?(Numeric) && arg >= 0 }
    side = Math.sqrt((diagonal_a/2.0)**2 + (diagonal_b/2.0)**2)
    super(Rhombus.new(diagonal_a, diagonal_b, side), height)
  end
end

# Тетраэдр
class RegularTetrahedron < Solid_shape
  def initialize(side)
    raise ArgumentError unless side.is_a?(Numeric) && side >= 0
    @side = side
  end
  def volume
    (@side**3) / (6 * Math.sqrt(2))
  end
end