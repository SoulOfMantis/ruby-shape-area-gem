require_relative 'solid_shape.rb'
class SolidShapeFactory
  attr_accessor :solid_shape
  def initialize(solid_shape)
    change_shape solid_shape
  end
  def change_shape(solid_shape)
    @solid_shape = solid_shape
  end
  def create(args)
    case @solid_shape
    when :right_prism then RightPrism.new args[:polygon_base], args[:height]
    when :regular_hexagonal_prism then RegularHexagonalPrism.new args[:base], args[:height]
    when :sphere then Sphere.new args[:radius]
    when :right_cuboid then RightCuboid.new args[:width], args[:length], args[:height]
    when :cube then Cube.new args[:side]
    when :cone then Cone.new args[:base_radius], args[:height]
    when :pyramid then Pyramid.new args[:polygon_base], args[:height]
    when :elliptical_cylinder then EllipticalCylinder.new args[:semi_major], args[:semi_minor], args[:height]
    when :trapezoidal_prism then TrapezoidalPrism.new args[:base1], args[:base2], args[:side1], args[:side2],
                                                      args[:base_height], args[:prism_height]
    when :right_rhombic_prism then RightRhombicPrism.new args[:diagonal1], args[:diagonal2], args[:height]
    when :regular_tetrahedron then RegularTetrahedron.new args[:side]
    else raise ArgumentError
    end
  end
end