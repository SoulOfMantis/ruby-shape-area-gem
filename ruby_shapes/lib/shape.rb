 class Shape
    def area
        raise NotImplementedError
    end
     def info
        "площадь #{area.round(2)}"
     end
end

 class Ellipse < Shape
   attr_accessor :semi_major,:semi_minor
     def initialize(major, minor)
         raise ArgumentError unless [major, minor].all? {|arg| (arg.is_a? Numeric) && arg >= 0}
         @semi_major = major
         @semi_minor = minor
     end
     def area
         Math::PI * @semi_major * @semi_minor
     end
 end

 class Circle < Ellipse
     def initialize(radius)
         super radius, radius
     end
     def circumference
         2 * @semi_major * Math::PI
     end
 end

class Polygon < Shape
    def perimeter
        raise NotImplementedError
    end
end

 class RegularHexagon < Polygon
     attr_accessor :side
     def initialize(s)
         raise ArgumentError if s < 0
         @side = s
     end
     def area
         (3 * Math.sqrt(3) * @side ** 2) / 2.0
     end
     def perimeter
         6 * @side
     end
 end

 class Trapezoid < Polygon
  attr_accessor :base1,:base2,:side1, :side2, :height
  def initialize(b1, b2, s1, s2, h)
    raise ArgumentError unless (Trapezoid.check_sides b1, b2, s1, s2) && (h.is_a? Numeric) && h >= 0
    @base1 = b1
    @base2 = b2
    @height = h
    @side1 = s1
    @side2 = s2
  end
  def area
    (@base1 + @base2) * @height / 2.0
  end
  def self.check_sides(a, b, c, d)
    [a, b, c, d].all?{|arg| (arg.is_a? Numeric) && arg >= 0} && (d-c).abs < (b-a).abs && (b-a).abs < d + c
  end
  def perimeter
    @base1 + @base2 + @side1 + @side2
  end
end

 class Triangle < Polygon
     attr_accessor :a,:b,:c
     def initialize(a,b,c)
         raise ArgumentError unless Triangle.check_sides a, b, c
         @a = a
         @b = b
         @c = c
     end
     def self.check_sides(a, b, c)
       [a, b, c].all?{|arg| (arg.is_a? Numeric) && arg >= 0} && (a <= b + c) && (b <= a + c) && (c <= a + b)
     end
     def perimeter
         @a + @b + @c
     end
     def area
         p = perimeter/2.0
         Math.sqrt(p * (p - a) * (p - b) * (p - c))
     end
 end
     
 class Parallelogram < Polygon
     attr_accessor :base,:height,:side
     def initialize(b, h, s)
         raise ArgumentError unless [b, h, s].all?{|arg| (arg.is_a? Numeric) && arg >= 0}
         @base = b
         @height = h
         @side = s
     end
     def area
         @base * @height
     end
     def perimeter
         2 * (@base + @side)
     end
 end

 class Rhombus < Polygon
     attr_accessor :diag1, :diag2, :side
     def initialize(d1, d2, a)
         raise ArgumentError unless [d1, d2, a].all?{|arg| (arg.is_a? Numeric) && arg >= 0}
         @side = a
         @diag1 = d1
         @diag2 = d2
     end
     def area
         @diag1 * @diag2 / 2.0
     end
     def perimeter
         4 * @side
     end
 end

 class Rectangle < Parallelogram
     def initialize(w, h)
         super w, h, h
     end
 end

 class Square < Rectangle
     def initialize(a)
         super a, a
     end
 end

   
