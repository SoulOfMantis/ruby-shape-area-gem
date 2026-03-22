require 'minitest/autorun'
require_relative 'Shape'
class TestShape <Minitest::Test
    DELTA = 0.001
    def setup
        @square = Square.new(5)
        @rectangle = Rectangle.new(4,6)
        @circle=Circle.new(4)
        @tringl = Tringl.new(3,4,5)
        @trapezoid = Trapezoid.new(3,5,2.5)
        @paralelogram = Paralelogram.new(5,3,4)
        @rhombus = Rhombus.new(5,4.8)
        @ellipse= Ellipse.new(5,3)
    end

    def test_square_area
        assert_equal(25,@square.area)
    end

    def test_rectang_area
        assert_equal(24,@rectangle.area)
    end

    def test_circle_area
        e = Math::PI*16
        assert_in_delta(e,@circle.area,DELTA)
    end

    def test_triangle_area
        assert_in_delta(6.0,@tringl.area,DELTA)
    end

    def test_trapezoid_area
        assert_equal(10,@trapezoid.area)
    end

    def test_parallelogram_area
        assert_equal(15,@paralelogram.area)
    end

    def test_rhombus_area
         assert_in_delta(24.0,@rhombus.area,DELTA)
    end

    def test_ellipse_area
        e = Math::PI*15
        assert_in_delta(e,@ellipse.area,DELTA)
    end

    def test_inheritance
        assert_kind_of(Ellipse,@circle)
         assert_kind_of(Shape,@circle)
         assert_kind_of(Shape,@tringl)
         assert_kind_of(Paralelogram,@rhombus)
         assert_kind_of(Paralelogram,@rectangle)
    end

    def test_polimorfizm
        shapes = [@square,@circle,@tringl,@rhombus]
        shapes.each do |sh|
            assert_respond_to(sh, :area)
        end
    end
end

