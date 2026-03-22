require 'minitest/autorun'
require_relative '../lib/shape_factory'
class TestShapeArea <Minitest::Test
  DELTA = 0.001
  def setup
    factory = Shape_factory.new :square
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

  def test_square_perimeter
    assert_equal 20, @square.perimeter
  end

  def test_rectangle_perimeter
    assert_equal 20, @rectangle.perimeter
  end

  def test_circle_circumference
    e = Math::PI*8
    assert_in_delta e, @circle.circumference, DELTA
  end

  def test_triangle_perimeter
    assert_equal 12, @triangle.perimeter
  end

  def test_trapezoid_perimeter
    assert_equal 18, @trapezoid.perimeter
  end

  def test_parallelogram_perimeter
    assert_equal 16, @parallelogram.perimeter
  end

  def test_rhombus_perimeter
    assert_equal 20, @rhombus.perimeter
  end

  def test_hexagon_perimeter
    assert_equal 30, @hexagon.area
  end
end
