require 'minitest/autorun'
require_relative '../lib/shape_factory'
require_relative '../lib/shape.rb'
class TestShapeArea <Minitest::Test
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

  def test_square_area
    assert_equal 25, @square.area
  end

  def test_rectangle_area
    assert_equal 24, @rectangle.area
  end

  def test_circle_area
    e = Math::PI*16
    assert_in_delta e, @circle.area, DELTA
  end

  def test_triangle_area
    assert_in_delta 6.0, @triangle.area, DELTA
  end

  def test_trapezoid_area
    assert_equal 30, @trapezoid.area
  end

  def test_parallelogram_area
    assert_equal 18, @parallelogram.area
  end

  def test_rhombus_area
    assert_in_delta 12.0, @rhombus.area, DELTA
  end

  def test_ellipse_area
    e = Math::PI*15
    assert_in_delta e, @ellipse.area, DELTA
  end

  def test_hexagon_area
    e = Math.sqrt(3) * 75/2
    assert_in_delta e, @hexagon.area, DELTA
  end
end
