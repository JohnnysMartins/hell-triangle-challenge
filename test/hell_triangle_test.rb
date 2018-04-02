$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)

require "minitest/autorun"
require "hell_triangle"

class TriangleHellTest < Minitest::Test
  def test_triangle_is_empty
    triangle = HellTriangle.new([])
    assert_nil triangle.total_sum
  end

  def test_triangle_with_letter
    triangle = HellTriangle.new([[1], [2, "b"]])
    assert_nil triangle.total_sum
  end

  def test_triangle_total_sum
    triangle = HellTriangle.new([[1], [3, 7], [9, 7, 1]])
    assert_equal 15, triangle.total_sum
  end

  def test_triangle_max_sum
    triangle = HellTriangle.new([
      [6],
      [4, 5],
      [9, 7, 1],
      [9, 6, 8, 4],
    ])
    assert_equal 28, triangle.total_sum
  end

  def test_triangle_main_example
    triangle = HellTriangle.new([
      [6],
      [3, 5],
      [9, 7, 1],
      [4, 6, 8, 4],
    ])
    assert_equal 26, triangle.total_sum
  end

  def test_triangle_long_path
    triangle = HellTriangle.new([
      [9],
      [9, 5],
      [1, 9, 1],
      [1, 9, 8, 4],
      [1, 4, 9, 1, 1],
      [1, 2, 1, 9, 1, 9],
      [1, 1, 7, 1, 8, 1, 1],
      [1, 2, 9, 1, 4, 6, 1, 1],
    ])
    assert_equal 68, triangle.total_sum
  end
end
