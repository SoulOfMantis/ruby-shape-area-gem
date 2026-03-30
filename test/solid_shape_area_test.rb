require "minitest/autorun"
require_relative '../lib/solid_shape'
require_relative '../lib/shape'

class TestSolidShapesArea < Minitest::Test
  DELTA = 0.001

  def setup
  end

  #Сфера
  def test_sphere
    s = Sphere.new 3
    e = 4*Math::PI*3**2
    assert_in_delta(e,s.area,DELTA)
  end

  #Куб
  def test_cube
    c = Cube.new 2
    assert_equal(24, c.area)
  end

  #Прямоугольный параллелепипед
  def test_right_cuboid
    rc = RightCuboid.new 2, 3, 4
    assert_equal(52,rc.area)
  end

  #Конус
  def test_cone
    base_radius = 3
    cone = Cone.new base_radius, 5
    l = Math::sqrt(3**2+5**2)
    e = Math::PI*3*l + Math::PI*3**2
    assert_in_delta(e,cone.area,DELTA)
  end

  #Пирамида
  def test_pyramid
    sq = Square.new 3
    p = Pyramid.new sq, 6
    assert_raises(NotImplementedError) { p.area }
  end

  #Шестиугольная призма
  def test_hexagon_prism
    hp = RegularHexagonalPrism.new 2, 5
    hex_area = 10.392304845413264
    #assert_equal()
  end

  #Ромбическая призма
  def test_rhombic_prism
    rhp = RightRhombicPrism.new 6, 8, 10
    assert_equal(248,rhp.area)
  end

  #Тетраэдр
  def test_tetrahedron
    tetra = RegularTetrahedron.new 6
    assert_in_delta(Math.sqrt(3) * 36,tetra.area, DELTA)
  end
end