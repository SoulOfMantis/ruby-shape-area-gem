class Solid_shape_factory
  attr_accessor :solid_shape
  def initialize(solid_shape)
    change_shape solid_shape
  end
  def change_shape(solid_shape)
    @solid_shape = solid_shape
  end
  def create(args)
    case @solid_shape
    when :right_prism then Right_prism.new args[:polygon_base], args[:height]
    #In case of regular hexagonal prism, base may either be a regular hexagon or an integer (regular hexagon's side)
    when :regular_hexagonal_prism then Regular_hexagonal_prism.new args[:base], args[:height]
    #TODO: implement all solid shapes and change the error to the ArgumentError
    else raise NotImplementedError
    end
  end
end