require 'minitest/autorun'
require_relative '../lib/shape_factory'
class TestShape <Minitest::Test
    DELTA = 0.001
    def setup
        factory = ShapeFactory.new :square
        args = { side: 5, width: 4, height: 6, radius: 4, a: 3, b: 4, c: 5, base1: 3, base2: 7,
                 side1: 3, side2: 5, base: 3, major: 5, minor: 3, diagonal1: 5, diagonal2: 4.8 }
        @square = factory.create args
        factory.change_shape :rectangle
        @rectangle = factory.create args
        factory.change_shape :circle
        @circle = factory.create args
        factory.change_shape :triangle
        @triangle = factory.create args
        factory.change_shape :trapezoid
        @trapezoid = factory.create args
        factory.change_shape :parallelogram
        @parallelogram = factory.create args
        factory.change_shape :rhombus
        @rhombus = factory.create args
        factory.change_shape :ellipse
        @ellipse = factory.create args
        factory.change_shape :regular_hexagon
        @hexagon = factory.create args
    end

    def test_inheritance
        assert_kind_of Shape, @ellipse
        assert_kind_of Ellipse, @circle
        assert_kind_of Polygon, @triangle
        assert_kind_of Polygon, @rhombus
        assert_kind_of Parallelogram, @rectangle
    end

    def test_polymorphism
        shapes = [@square, @circle, @triangle, @rhombus]
        shapes.each do |sh|
            assert_respond_to sh, :area
        end
    end
end

