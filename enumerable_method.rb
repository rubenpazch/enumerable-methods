# rubocop:disable Metrics/ModuleLength
module Enumerable
  def my_each
    return to_enum(:my_each) unless block_given?

    i = 0
    while i < length
      yield (self[i])
      i += 1
    end
  end

  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    i = 0
    while i < length
      yield self[i], i
      i += 1
    end
  end

  def my_select
    return to_enum(:my_select) unless block_given?

    newarray = []
    my_each do |x|
      newarray << x if yield(x) == true
    end
    newarray
  end

  def my_count(item = nil)
    counter = 0
    if item.nil?
      return length unless block_given?

      each do |x|
        counter += 1 if yield(x)
      end
    else
      my_each do |y|
        counter += 1 if y == item
      end
    end
    counter
  end

  def my_map
    return to_enum(:my_map) unless block_given?

    newarray = []
    if self.class == Array
      my_each do |x|
        newarray << yield(x) ? true : false
      end
    else
      i = first
      while i <= last
        newarray << yield(i) unless yield(i).nil?
        i += 1
      end
    end
    newarray
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  # rubocop:disable Metrics/MethodLength
  # rubocop:disable Metrics/PerceivedComplexity
  def my_all?(param = nil)
    t = true

    if block_given?
      my_each do |x|
        t = yield(x).nil? || yield(x) == false ? false : true
        break if t == false
      end
    elsif !param.nil?
      if param.class == Class
        my_each do |x|
          return false unless x.is_a?(param)
        end
      elsif param.class == Regexp
        my_each do |x|
          return false unless x.match(param)
        end
      else
        my_each do |x|
          return false unless x == param
        end
      end
    else
      my_each do |x|
        return false unless x
      end
    end
    t
  end

  def my_any?(param = nil)
    return false if empty?

    t = false
    if block_given?
      my_each do |x|
        t = yield(x).nil? || yield(x) == false ? false : true
        break if t == true
      end
    elsif !param.nil?
      if param.class == Class
        my_each do |x|
          t = x.is_a?(param) ? true : false
          break if t == true
        end
      elsif param.class == Regexp
        my_each do |x|
          t = x.match(param) ? true : false
          break if t == true
        end
      else
        my_each do |x|
          return true if x == param
        end
      end
    else
      my_each do |x|
        t = x == false || x.nil? ? false : true
      end
    end
    t
  end

  def my_none?(param = nil)
    t = true
    if block_given?
      my_each do |x|
        t = yield(x) == false
        break if t == false
      end
    elsif param.class == Class && !param.nil?
      my_each do |x|
        t = x.is_a?(param) ? false : true
        break if t == false
      end
    elsif param.class == Regexp && !param.nil?
      my_each do |x|
        t = x.match(param) ? false : true
        break if t == true
      end
    else
      t = false
      return true if length.zero? && param.nil?

      if param.nil?
        my_each do |x|
          t = x != true
          break if t == false
        end
      else
        my_each do |x|
          t = x != param
          break if t == false
        end
      end
    end
    t
  end
  # rubocop:enable Metrics/CyclomaticComplexity
  # rubocop:enable Metrics/MethodLength
  # rubocop:enable Metrics/PerceivedComplexity

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/CyclomaticComplexity
  # rubocop:disable Metrics/MethodLength
  # rubocop:disable Metrics/PerceivedComplexity

  def my_inject(acum_initial = nil, symb = nil)
    if block_given?
      if is_a? Array
        return 0 if length.zero? && acum_initial.nil?
        return nil if length.zero?

        acum = acum_initial.nil? ? self[0] : acum_initial
        self[1..length].my_each { |item| acum = yield(item, acum) }
      else
        autoarray = (first..last).my_map { |i| i }
        if acum_initial.nil?
          acum = autoarray[0]
          autoarray[1..last].my_each { |item| acum = yield(item, acum) }
        else
          acum = acum_initial
          autoarray.my_each { |item| acum = yield(item, acum) }
        end
      end
    elsif acum_initial.class == Symbol || symb.class == Symbol
      tempsymbol = acum_initial.class == Symbol && symb.nil? ? acum_initial : symb
      if is_a? Array
        return nil if length.zero? && acum_initial.nil?
        return acum_initial if length.zero? && !acum_initial.nil? && acum_initial.class != Symbol
        return nil if length.zero?

        acum = acum_initial.class == Symbol ? self[0] : acum_initial
        index_start = 1
        self[index_start..length].my_each do |item|
          acum = tempsymbol.to_sym == :+ ? acum + item : acum * item
        end
      else
        autoarray = if tempsymbol.to_sym == :+ && first == 1
                      (0..last - 1).my_map { |i| i }
                    else
                      (first..last).my_map { |i| i }
                    end

        acum = acum_initial.class == Symbol ? autoarray[0] : acum_initial
        index_start = 0
        autoarray[index_start..last].my_each do |item|
          acum = tempsymbol.to_sym == :+ ? acum + item : acum * item
        end
      end
    else
      0
    end
    acum
  end

  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/CyclomaticComplexity
  # rubocop:enable Metrics/MethodLength
  # rubocop:enable Metrics/PerceivedComplexity

  def my_map_proc(&block)
    return to_enum(:my_map) unless block_given?

    newarray = []
    i = first
    while i <= last
      newarray << block.call(i) unless block.call(i).nil?
      i += 1
    end
    newarray
  end
end
# rubocop:enable Metrics/ModuleLength

# print arr.my_inject(2){|a,b| a + b}

# TEST

# arr.my_each{|item| puts item.to_s}
# hash.my_each{|item| puts item.to_s}

# arr.my_each_with_index { |v, i| puts "#{v} at index #{i}" }
# hash.my_each_with_index { |k, v, i| puts "#{k}: #{v} at index #{i}" }

# print [1, 2, 2, 3, 5, 8, 9].my_select(&:odd?)
# print hash.my_select { |k, v| v > 1 }

# print arr.my_all?(/\D/)
# print arr.my_all?(String)
# print hash.my_all? { |k, v| v.is_a? Integer }
# print hash.my_all?(/\d/)

# print arr.my_any?
# print [1, 2, nil, 3, 5, 8, 9].my_any? { |v| v || v.nil? }
# print arr.my_any?(/\d/)

# print arr.my_none?
# print [1, 2, nil, 3, 5, 8, 9].my_none? { |v| v || v.nil? }
# print arr.my_none?(/\d/)

# print arr.my_count
# print arr.my_count(2)
# print arr.my_count{ |x| x%2==0 }

# test = Proc.new { |i| i*i }
# print arr.my_map( &test)
# print arr.my_map { |i| i*i }

# print [1,2,3,4,5].my_inject{|a,b| a+b}

# print multiply_els(arr)
