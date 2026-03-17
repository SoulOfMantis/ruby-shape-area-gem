 
class Shape
    
    def area
        raise NotImplementedError
    end
     def info
        "площадь #{area.round(2)}"
     end
end
    class Ellipse<Shape
        attr_reader :semi_major,:semi_manor
        def initialize(major,manor)
            @semi_major = major
            @semi_manor = manor
        end
        def area
            Math::PI * @semi_major*@semi_manor\
        end
    end

    class Circle <Ellipse
        def initialize(radius)
            super(radius,radius)
        end
    end

    class RegularHexagon < Shape
        attr_reader :side
        def initialize(s)
            @side = s
        end
        def area
            (3*Math.sqrt(3)*@side**2)/2.0
        end
    end

    class Trapezoid<Shape
        attr_reader :base1,:base2,:height
        def initialize(b1,b2,h)
            @base1 = b1
            @base2 = b2
            @height = h
        end
        def area
           ( (@base1 + base2)*@height)/2.0
        end
    end

    class Tringl<Shape
        attr_reader :a,:b,:c
        def initialize(a,b,c)
            @a = a
            @b=b
            @c=c
        end
        def perimeter
            @a+@b+@c
        end
        def area
            p = perimeter/2.0
            Math.sqrt(p*(p-a)*(p-b)*(p-c))
        end
    end
     
    class Paralelogram < Shape
        attr_reader :base,:height,:side
        def initialize(b,h,s)
            @base = b
            @height =h
            @side=s
        end
        def area
            @base*@height
        end
    end

    class Rhombus <Paralelogram
        attr_reader :a,:h
        def initialize(a,h)
            @a=a
            @h=h
        end
    end

    class Rectangle < Paralelogram
        attr_reader :width, :height
        def initialize(w,h)
            @width = w
            @height = h
        end
    end

    class Square <Rectangle
        attr_reader :size
        def initialize(side)
            super(a,a)
        end
    end

   def main()
    
   
   
