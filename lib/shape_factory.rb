require_relative 'shape.rb'
class Shape_factory
  attr_accessor :shape
  def initialize(shape)
    change_shape shape
  end
  def change_shape(shape)
    @shape = shape
  end
  def create(args)
    case @shape
    when :ellipse then Ellipse.new args[:major], args[:minor]
    when :circle then Circle.new args[:radius]
    when :square then Square.new args[:side]
    when :rectangle then Rectangle.new args[:width], args[:height]
    when :parallelogram then Parallelogram.new args[:base], args[:height], args[:side]
    when :rhombus then Rhombus.new args[:diagonal1], args[:diagonal2], args[:side]
    when :triangle then Triangle.new args[:a], args[:b], args[:c]
    when :trapezoid then Trapezoid.new args[:base1], args[:base2], args[:side1], args[:side2], args[:height]
    when :regular_hexagon then Regular_hexagon.new args[:side]
    else raise ArgumentError
    end
  end
end

