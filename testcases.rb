$LOAD_PATH << '.'
require './enumerable_method'
require 'test/unit'

include Enumerable

class TestMySelect < Test::Unit::TestCase
  def test_basic
    assert_equal([2, 4], [1, 2, 3, 4, 5].my_select(&:even?))
  end
end

class TestMyAll < Test::Unit::TestCase
  def test_basic
    assert_equal(true, %w[ant bear cat].my_all? { |word| word.length >= 3 })
    assert_equal(false, %w[ant bear cat].my_all? { |word| word.length >= 4 })
    assert_equal(false, %w[ant bear cat].my_all?(/t/))
    assert_equal(true, [1, 2i, 3.14].my_all?(Numeric))
    assert_equal(false, [1, 'g', 3.14].my_all?(Numeric))
    assert_equal(false, ['a', 1, 'c'].my_all?(String))
    assert_equal(true, %w[a b c].my_all?(String))
    assert_equal(false, [nil, true, 99].my_all?)
    assert_equal(true, [].my_all?)
    assert_equal(true, %w[box book burn].my_all?(/b/))
    assert_equal(false, %w[box book turn].my_all?(/b/))
    assert_equal(true, [3, 3, 3].my_all?(3))
    assert_equal(false, [3, 3, 4].my_all?(3))
  end
end

class TestMyAny < Test::Unit::TestCase
  def test_basic
    assert_equal(true, %w[ant bear cat].my_any? { |word| word.length >= 3 })
    assert_equal(true, %w[ant bear cat].my_any? { |word| word.length >= 4 })
    assert_equal(false, %w[ant bear cat].my_any?(/d/))
    assert_equal(true, [nil, true, 99].my_any?(Integer))
    assert_equal(true, [nil, true, 99].my_any?)
    assert_equal(false, [].my_any?)
    assert_equal(true, %w[box book burn].my_any?(/b/))
    assert_equal(true, %w[box book turn].my_any?(/b/))
    assert_equal(true, [3, 3, 3].my_any?(3))
    assert_equal(true, [3, 3, 4].my_any?(3))
    assert_equal(true, [3, 4, 4].my_any?(3))
  end
end

class TestMyNone < Test::Unit::TestCase
  def test_basic
    assert_equal(true, %w[ant bear cat].my_none? { |word| word.length == 5 })
    assert_equal(false, %w[ant bear cat].my_none? { |word| word.length >= 4 })
    assert_equal(true, %w[ant bear cat].my_none?(/d/))
    assert_equal(false, [1, 3.14, 42].my_none?(Float))
    assert_equal(true, [].my_none?)
    assert_equal(true, [nil].my_none?)
    assert_equal(true, [nil, false].my_none?)
    assert_equal(false, [nil, false, true].my_none?)
  end
end

class TestMyCount < Test::Unit::TestCase
  def test_basic
    ary = [1, 2, 4, 2]
    assert_equal(4, ary.my_count)
    assert_equal(2, ary.my_count(2))
    assert_equal(3, ary.my_count(&:even?))
  end
end

class TestMyMap < Test::Unit::TestCase
  def test_basic
    assert_equal([1, 4, 9, 16], (1..4).my_map { |i| i * i })
    assert_equal(%w[cat cat cat cat], (1..4).my_map { 'cat' })
  end
end

class TestMyInject < Test::Unit::TestCase
  def test_basic
    assert_equal(45, (5..10).my_inject { |sum, n| sum + n })
    assert_equal(151_200, (5..10).my_inject(1) { |product, n| product * n })
    longest = %w[cat sheep bear].my_inject do |memo, word|
      memo.length > word.length ? memo : word
    end
    assert_equal('sheep', longest)
  end
end

class MultiplyElns < Test::Unit::TestCase
  def test_basic
    x = multiply_elns([1, 2, 3, 4, 5])
    assert_equal(120, x)
  end
end

class TestMyMapProc < Test::Unit::TestCase
  def test_basic
    assert_equal([1, 4, 9, 16], (1..4).my_map_proc { |i| i * i })
    assert_equal(%w[cat cat cat cat], (1..4).my_map_proc { 'cat' })
  end
end
