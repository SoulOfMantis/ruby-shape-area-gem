require_relative 'shape.rb'
class SolidShape
  def volume
    raise NotImplementedError
  end
  def area
    raise NotImplementedError
  end
end

class RightPrism < SolidShape
  attr_reader :polygon_base, :height
  def initialize(base, h)
    raise ArgumentError unless (base.is_a? Polygon) && (h.is_a? Numeric) && h >= 0
    @polygon_base = base
    @height = h
  end
  def volume
    @polygon_base.area * @height
  end
  def area
    2*@polygon_base.area+@polygon_base.perimetr *@height
  end
end

# Шестиугольная призма
class RegularHexagonalPrism < RightPrism
  def initialize(base, h)
    raise ArgumentError unless [base, h].all? {|arg|  (arg.is_a? Numeric) && arg >= 0}
    super RegularHexagon.new(base), h
  end
  
end

# Сфера
class Sphere < SolidShape
  attr_reader :radius
  def initialize(r)
    raise ArgumentError unless (r.is_a? Numeric) && r >= 0
    @radius = r
  end
  def volume
    (4.0/3.0) * Math::PI * (@radius**3)
  end
  def area
    4*Math::PI*@radius**2
  end
end

# Прямоугольный параллелепипед
class RightCuboid < RightPrism
  def initialize(w, l, h)
    raise ArgumentError unless [w, l, h].all? { |arg|  (arg.is_a? Numeric) && arg >= 0 }
    super Rectangle.new(w, l), h
  end
  def area
    2*(@l*@w+@w*@h+@l*@c)
  end
end

# Куб
class Cube < RightCuboid
  def initialize(side)
    raise ArgumentError unless (side.is_a? Numeric) && side >= 0
    super side, side, side
  end
  def area
    6*@side
  end
end


# Конус
class Cone < SolidShape
  attr_reader :base, :height
  def initialize(radius, h)
    raise ArgumentError unless [radius, h].all? {|arg| (arg.is_a? Numeric) && arg >= 0}
    @base = Circle.new radius
    @height = h
  end
  def volume
    (@base.area * @height) / 3.0
  end
  def area
    l = sqrt(@radius**2+@h**2)
    Math::PI*@radius*l + Math::PI*@radius**2
  end
end

# Пирамида
class Pyramid < SolidShape
  attr_reader :base, :height
  def initialize(polygon, h)
    raise ArgumentError unless (polygon.is_a? Polygon) && (h.is_a? Numeric) && h >= 0
    @base = polygon
    @height = h
  end
  def volume 
    (@base.area * @height) / 3.0
  end
  def area
    @side**2 + 2*@side * sqrt(@h**2+(@base/4.0)**2)

  end
end

# Эллиптический цилиндр
class EllipticalCylinder < SolidShape
  attr_reader :base, :height
  def initialize(semi_major, semi_minor, h)
    raise ArgumentError unless [semi_major, semi_minor, h].all? { |arg|  (arg.is_a? Numeric) && arg >= 0 }
    @base = Ellipse.new semi_major, semi_minor
    @height = h
  end
  def volume 
    @base.area * @height
  end
  def area
    a = @base.semi_major
    b = @base.semi_major
    base_ar= 2*@base.area
    per = Math::PI*(3*(a+b))-Math.sqrt((3*a+b)*a+3*b)
    lateral_area = per*@height
    base_ar+lateral_area
  end
end

# Трапециевидная призма
class TrapezoidalPrism < RightPrism
  def initialize(base1, base2, side1, side2, base_height, prism_height)
    raise ArgumentError unless [base1, base2, side1, side2, base_height, prism_height].all? { |arg|  (arg.is_a? Numeric) && arg >= 0 }
    super Trapezoid.new(base1, base2, side1, side2, base_height), prism_height
  end
  def area
    s_osn = (@side1+@side2) * @base_height/2.0
    s_bok = @base1+@base2+@side1+@side2*@prism_height
  end
   
end


# Ромбическая призма
class RightRhombicPrism < RightPrism
  def initialize(diagonal_a, diagonal_b, height)
    raise ArgumentError unless [diagonal_a, diagonal_b, height].all? { |arg|  (arg.is_a? Numeric) && arg >= 0 }
    side = Math.sqrt (diagonal_a/2.0)**2 + (diagonal_b/2.0)**2
    super Rhombus.new(diagonal_a, diagonal_b, side), height
  end
  def area
    @diagonal_a*@diagonal_b + 2*@height*Math::sqrt(@diagonal_a**2+diagonal_b**2)
  end

end

# Тетраэдр
class RegularTetrahedron < Pyramid
  def initialize(side)
    raise ArgumentError unless (side.is_a? Numeric) && side >= 0
    super Triangle.new(side, side, side), side
  end

  def volume
    (@height**3)/(6*Math.sqrt(2))
  end
  def area
    4*Math::sqrt(3*@side**@)
  end
end