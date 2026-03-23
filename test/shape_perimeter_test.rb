require 'minitest/autorun'
require_relative '../lib/shape_factory'
class TestShapePerimeter <Minitest::Test
  DELTA = 0.001
  def setup
  end

  def test_square_perimeter
    square_factory = ShapeFactory.new :square
    args = { side: 5 }
    assert_equal 20, (square_factory.create args).perimeter
    args[:side] = -5
    assert_raises(ArgumentError) {square_factory.create args}
    args[:side] = 0
    assert_equal 0, (square_factory.create args).perimeter
  end

  def test_rectangle_perimeter
    rectangle_factory = ShapeFactory.new :rectangle
    args = { width: 5, height: 10 }
    assert_equal 30, (rectangle_factory.create args).perimeter
    args[:width] = -5
    assert_raises(ArgumentError) {rectangle_factory.create args}
    args[:width] = 10
    args[:height] = -5
    assert_raises(ArgumentError) {rectangle_factory.create args}
    args[:width] = 0
    args[:height] = 0
    assert_equal 0, (rectangle_factory.create args).perimeter
  end

  def test_circle_circumference
    circle_factory = ShapeFactory.new :circle
    args = { radius: 5 }
    assert_in_delta Math::PI*10, (circle_factory.create args).circumference, DELTA
    args[:radius] = -5
    assert_raises(ArgumentError) {circle_factory.create args}
    args[:radius] = 0
    assert_in_delta 0.0, (circle_factory.create args).circumference, DELTA
  end

  def test_triangle_perimeter
    triangle_factory = ShapeFactory.new :triangle
    args = { a: 3, b:4, c:5 }
    assert_equal 12, (triangle_factory.create args).perimeter
    args[:a] = -5
    assert_raises(ArgumentError) {triangle_factory.create args}
    args[:a] = 10
    args[:b] = -5
    assert_raises(ArgumentError) {triangle_factory.create args}
    args[:b] = 10
    args[:c] = -5
    assert_raises(ArgumentError) {triangle_factory.create args}
    args[:a] = 0
    args[:b] = 0
    args[:c] = 0
    assert_equal 0, (triangle_factory.create args).perimeter
  end

  def test_trapezoid_perimeter
    trapezoid_factory = ShapeFactory.new :trapezoid
    args = { base1: 3, base2: 7, side1: 9, side2: 10, height: 8 }
    assert_equal 29, (trapezoid_factory.create args).perimeter
    args[:base1] = -5
    assert_raises(ArgumentError) {trapezoid_factory.create args}
    args[:base1] = 7
    assert_raises(ArgumentError) {trapezoid_factory.create args}
    args[:base1] = 0
    args[:base2] = 0
    args[:side1] = 0
    args[:side2] = 0
    assert_raises(ArgumentError) {trapezoid_factory.create args}
  end

  def test_parallelogram_perimeter
    parallelogram_factory = ShapeFactory.new :parallelogram
    args = { base: 5, height: 10, side: 4 }
    assert_equal 18, (parallelogram_factory.create args).perimeter
    args[:base] = -5
    assert_raises(ArgumentError) {parallelogram_factory.create args}
    args[:base] = 10
    args[:height] = -5
    assert_raises(ArgumentError) {parallelogram_factory.create args}
    args[:height] = 5
    args[:side] = -2
    assert_raises(ArgumentError) {parallelogram_factory.create args}
    args[:base] = 0
    args[:side] = 0
    args[:height] = 0
    assert_equal 0, (parallelogram_factory.create args).perimeter
  end

  def test_rhombus_perimeter
    rhombus_factory = ShapeFactory.new :rhombus
    args = { diagonal1: 5, diagonal2: 10, side: 4 }
    assert_equal 16, (rhombus_factory.create args).perimeter
    args[:diagonal1] = -5
    assert_raises(ArgumentError) {rhombus_factory.create args}
    args[:diagonal1] = 10
    args[:diagonal2] = -5
    assert_raises(ArgumentError) {rhombus_factory.create args}
    args[:diagonal2] = 5
    args[:side] = -2
    assert_raises(ArgumentError) {rhombus_factory.create args}
    args[:diagonal1] = 0
    args[:diagonal2] = 0
    args[:side] = 0
    assert_equal 0, (rhombus_factory.create args).perimeter
  end

  def test_hexagon_perimeter
    hexagon_factory = ShapeFactory.new :regular_hexagon
    args = { side: 5 }
    assert_equal 30, (hexagon_factory.create args).perimeter
    args[:side] = -5
    assert_raises(ArgumentError) {hexagon_factory.create args}
    args[:side] = 0
    assert_equal 0, (hexagon_factory.create args).perimeter
  end
end
