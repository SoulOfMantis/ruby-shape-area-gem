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
    #TODO: implement all shapes and change the error to the ArgumentError
    else raise NotImplementedError
    end
  end
end

