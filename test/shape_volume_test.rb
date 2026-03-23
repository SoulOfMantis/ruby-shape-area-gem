require "minitest/autorun"
require_relative '../lib/solid_shape'
require_relative '../lib/shape'

class TestSolidShapesCombined < Minitest::Test
  DELTA = 0.001

  def setup
  end

  #Сфера
  def test_sphere
    s = Sphere.new 3
    expected_volume = 113.09733552923255
    assert_in_delta expected_volume, s.volume, DELTA
    assert_equal 0, Sphere.new(0).volume
    assert_raises(ArgumentError) { Sphere.new -3 }
    tiny = Sphere.new 0.001
    assert_in_delta 4.18879e-9, tiny.volume, 1e-12
    huge = Sphere.new 1_000_000
    assert huge.volume > 0
  end

  #Куб
  def test_cube
    c = Cube.new 2
    assert_equal 8, c.volume
    assert_equal 0, Cube.new(0).volume
    assert_raises(ArgumentError) { Cube.new -5 }
    cu = Cube.new 1
    assert_equal 1, cu.volume
  end

  #Прямоугольный параллелепипед
  def test_right_cuboid
    rc = RightCuboid.new 2, 3, 4
    assert_equal 24, rc.volume
    assert_equal 0, RightCuboid.new(0, 5, 10).volume
    assert_equal 0, RightCuboid.new(5, 0, 10).volume
    assert_equal 0, RightCuboid.new(5, 10, 0).volume
    assert_raises(ArgumentError) { RightCuboid.new -2, -3, 10 }
    assert_raises(ArgumentError) { RightCuboid.new -2, 0, 10 }
    float_cuboid = RightCuboid.new 2.5, 3.5, 4.5 
    assert_in_delta 39.375, float_cuboid.volume, DELTA
  end

  #Конус
  def test_cone
    base_radius = 3
    cone = Cone.new base_radius, 5
    expected_volume = 47.12388980384689
    assert_in_delta expected_volume, cone.volume, DELTA
    assert_equal 0, Cone.new(base_radius, 0).volume
    assert_raises(ArgumentError) { Cone.new base_radius, -5 }
    assert_equal 0, Cone.new(0, 5).volume
    assert_raises(ArgumentError) { Cone.new -10, 5 }
    tiny_radius = 0.001
    tiny_cone = Cone.new tiny_radius, 10
    assert_in_delta 1.0472e-5, tiny_cone.volume, 1e-8
  end

  #Пирамида
  def test_pyramid
    sq = Square.new 3
    p = Pyramid.new sq, 6
    assert_equal 18, p.volume  
    rect = Rectangle.new 4, 5
    p_rect = Pyramid.new rect, 10
    assert_in_delta 66.667, p_rect.volume, DELTA 
    triangle = Triangle.new 3, 4, 5
    p_tri = Pyramid.new triangle, 6
    assert_in_delta 12.0, p_tri.volume, DELTA
    assert_equal 0, Pyramid.new(sq, 0).volume
    zero_square = Square.new 0
    assert_equal 0, Pyramid.new(zero_square, 10).volume
    assert_raises(ArgumentError) { Pyramid.new nil, 5 }
  end

  #Эллиптический цилиндр
  def test_elliptical_cylinder
    ec = EllipticalCylinder.new 3, 2, 10 
    expected_volume = 188.4955592153876
    assert_in_delta expected_volume, ec.volume, DELTA
    assert_equal 0, EllipticalCylinder.new(0, 2, 10).volume
    assert_equal 0, EllipticalCylinder.new(3, 0, 10).volume
    assert_equal 0, EllipticalCylinder.new(3, 2, 0).volume
    assert_raises(ArgumentError) { EllipticalCylinder.new -3, -2, 10 }
    ec_float = EllipticalCylinder.new 2.5, 1.5, 4.2 
    assert_in_delta 49.480, ec_float.volume, DELTA
  end

  #Шестиугольная призма
  def test_hexagon_prism
    hp = RegularHexagonalPrism.new 2, 5
    hex_area = 10.392304845413264
    expected_volume = hex_area * 5
    assert_in_delta expected_volume, hp.volume, DELTA
    assert_equal 0, RegularHexagonalPrism.new(0, 5).volume
    assert_equal 0, RegularHexagonalPrism.new(2, 0).volume
    assert_raises(ArgumentError)  { RegularHexagonalPrism.new -2, 5 }
  end

  #Трапециевидная призма
  def test_trapezoidal_prism
  tp = TrapezoidalPrism.new(3, 5, 4, 4, 2, 10)
  assert_equal 80, tp.volume
  # Эти тесты не проходят, но и не должны? площадь трапеции в них это 5 и 3 соответственно, с объёмом в 50 и 30
  # assert_equal 0, TrapezoidalPrism.new(0, 5, 4, 4, 2, 10).volume
  # assert_equal 0, TrapezoidalPrism.new(3, 0, 4, 4, 2, 10).volume
  # Добавил тест с нулевыми основаниями, но тогда трапеция не может существовать и вызывает ошибку
  assert_raises(ArgumentError) { TrapezoidalPrism.new 0, 0, 4, 4, 2, 10 }
  assert_equal 0, TrapezoidalPrism.new(3, 5, 4, 4, 0, 10).volume
  assert_equal 0, TrapezoidalPrism.new(3, 5, 4, 4, 2, 0).volume
  assert_raises(ArgumentError) { TrapezoidalPrism.new -3, -5, 4, 4, 2, 10 }
   tp2 = TrapezoidalPrism.new 4, 6, 5, 5, 3, 8
  assert_equal 120, tp2.volume
   tp3 = TrapezoidalPrism.new 2.5, 4.5, 3, 3, 1.5, 5
  assert_in_delta 26.25, tp3.volume, DELTA
end

  #Ромбическая призма
  def test_rhombic_prism
    rhp = RightRhombicPrism.new 6, 8, 10
    assert_equal 240, rhp.volume
    assert_equal 0, RightRhombicPrism.new(0, 8, 10).volume
    assert_equal 0, RightRhombicPrism.new(6, 0, 10).volume
    assert_raises(ArgumentError) { RightRhombicPrism.new -6, -8, 10 }
  end

  #Тетраэдр
  def test_tetrahedron
    tetra = RegularTetrahedron.new 6
    expected_volume = 25.45584412271571
    assert_in_delta expected_volume, tetra.volume, DELTA
    assert_equal 0, RegularTetrahedron.new(0).volume
    tiny = RegularTetrahedron.new 0.001
    assert_in_delta 1.1785e-10, tiny.volume, 1e-13
  end
end